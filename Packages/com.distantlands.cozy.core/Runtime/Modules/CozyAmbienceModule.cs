//  Distant Lands 2024
//  COZY: Stylized Weather 3
//  All code included in this file is protected under the Unity Asset Store Eula

using System.Collections;
using DistantLands.Cozy.Data;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

#if UNITY_EDITOR
using UnityEditor;
#endif

namespace DistantLands.Cozy
{

    [ExecuteAlways]
    public class CozyAmbienceModule : CozyBiomeModuleBase<CozyAmbienceModule>
    {

        public AmbienceProfile[] ambienceProfiles = new AmbienceProfile[0];

        [System.Serializable]
        public class WeightedAmbience
        {
            public AmbienceProfile ambienceProfile;
            [Range(0, 1)]
            public float weight;
            public bool transitioning;
            public IEnumerator Transition(float value, float time)
            {
                transitioning = true;
                float t = 0;
                float start = weight;

                while (t < time)
                {

                    float div = (t / time);
                    yield return new WaitForEndOfFrame();

                    weight = Mathf.Lerp(start, value, div);
                    t += Time.deltaTime;

                }

                weight = value;
                ambienceProfile.SetWeight(weight);
                transitioning = false;

            }
        }

        public List<WeightedAmbience> weightedAmbience = new List<WeightedAmbience>();

        public AmbienceProfile currentAmbienceProfile;
        public AmbienceProfile ambienceChangeCheck;
        public float timeToChangeProfiles = 7;
        public float ambienceTimer;

        void Start()
        {
            if (!enabled)
                return;

            if (isBiomeModule)
                return;

            foreach (AmbienceProfile profile in ambienceProfiles)
            {
                foreach (FXProfile fx in profile.FX)
                    fx?.InitializeEffect(weatherSphere);
            }

            if (Application.isPlaying)
            {
                SetNextAmbience();
                weightedAmbience = new List<WeightedAmbience>() { new WeightedAmbience() { weight = 1, ambienceProfile = currentAmbienceProfile } };
            }

        }

        public void FindAllAmbiences()
        {

            List<AmbienceProfile> profiles = new List<AmbienceProfile>();

            foreach (AmbienceProfile i in EditorUtilities.GetAllInstances<AmbienceProfile>())
                if (i.name != "Default Ambience")
                    profiles.Add(i);

            foreach (AmbienceProfile profile in ambienceProfiles)
            {
                foreach (FXProfile fx in profile.FX)
                    fx?.InitializeEffect(weatherSphere);
            }

            ambienceProfiles = profiles.ToArray();

        }

        // Update is called once per frame
        public override void UpdateWeatherWeights()
        {
            if (Application.isPlaying)
            {
                if (ambienceChangeCheck != currentAmbienceProfile)
                {
                    SetAmbience(currentAmbienceProfile);
                }

                if (weatherSphere.timeModule)
                    ambienceTimer -= Time.deltaTime * weatherSphere.timeModule.modifiedTimeSpeed;
                else
                    ambienceTimer -= Time.deltaTime * 0.005f;

                if (ambienceTimer <= 0)
                {
                    SetNextAmbience();
                }

            }

            ComputeBiomeWeights();
        }

        public override void UpdateFXWeights()
        {
            foreach (WeightedAmbience i in weightedAmbience)
            {
                i.ambienceProfile.SetWeight(i.weight * weight);
            }
            foreach (CozyAmbienceModule biome in biomes)
            {
                foreach (WeightedAmbience i in biome.weightedAmbience)
                {
                    i.ambienceProfile.SetWeight(i.weight * biome.weight);
                }
            }
        }
        public override void UpdateBiomeModule()
        {
            if (weightedAmbience.Count == 0 || weightedAmbience[0].ambienceProfile != currentAmbienceProfile)
            {
                weightedAmbience = new List<WeightedAmbience>() {
                    new WeightedAmbience() {
                        ambienceProfile = currentAmbienceProfile,
                        weight = 1
                    }
                };
            }

        }

        public void SetNextAmbience()
        {

            currentAmbienceProfile = WeightedRandom(ambienceProfiles.ToArray());

        }

        public void SetAmbience(AmbienceProfile profile)
        {

            currentAmbienceProfile = profile;
            ambienceChangeCheck = currentAmbienceProfile;

            if (weightedAmbience.Find(x => x.ambienceProfile == profile) == null)
                weightedAmbience.Add(new WeightedAmbience() { weight = 0, ambienceProfile = profile, transitioning = true });

            foreach (WeightedAmbience j in weightedAmbience)
            {

                if (j.ambienceProfile == profile)
                    StartCoroutine(j.Transition(1, timeToChangeProfiles));
                else
                    StartCoroutine(j.Transition(0, timeToChangeProfiles));

            }

            ambienceTimer += Random.Range(currentAmbienceProfile.minTime, currentAmbienceProfile.maxTime);
        }

        public void SetAmbience(AmbienceProfile profile, float timeToChange)
        {

            currentAmbienceProfile = profile;
            ambienceChangeCheck = currentAmbienceProfile;

            if (weightedAmbience.Find(x => x.ambienceProfile == profile) == null)
                weightedAmbience.Add(new WeightedAmbience() { weight = 0, ambienceProfile = profile, transitioning = true });

            foreach (WeightedAmbience j in weightedAmbience)
            {

                if (j.ambienceProfile == profile)
                    StartCoroutine(j.Transition(1, timeToChange));
                else
                    StartCoroutine(j.Transition(0, timeToChange));

            }

            ambienceTimer += Random.Range(currentAmbienceProfile.minTime, currentAmbienceProfile.maxTime);
        }

        public void SkipTime(float timeToSkip) => ambienceTimer -= timeToSkip;

        public AmbienceProfile WeightedRandom(AmbienceProfile[] profiles)
        {
            AmbienceProfile i = null;
            List<float> floats = new List<float>();
            float totalChance = 0;

            foreach (AmbienceProfile k in profiles)
            {
                float chance;

                if (weatherSphere.weatherModule)
                    if (k.dontPlayDuring.Contains(weatherSphere.weatherModule.ecosystem.currentWeather))
                        chance = 0;
                    else
                        chance = k.GetChance(weatherSphere);
                else
                    chance = k.GetChance(weatherSphere);

                floats.Add(chance);
                totalChance += chance;
            }

            if (totalChance == 0)
            {
                i = (AmbienceProfile)Resources.Load("Default Ambience");
                Debug.LogWarning("Could not find a suitable ambience given the current selected profiles and chance effectors. Defaulting to an empty ambience.");
                return i;
            }

            float selection = Random.Range(0, totalChance);

            int m = 0;
            float l = 0;

            while (l <= selection)
            {
                if (selection >= l && selection < l + floats[m])
                {
                    i = profiles[m];
                    break;
                }
                l += floats[m];
                m++;

            }

            if (!i)
            {
                i = profiles[0];
            }

            return i;
        }

        public float GetTimeTillNextAmbience() => ambienceTimer;

    }

#if UNITY_EDITOR
    [CustomEditor(typeof(CozyAmbienceModule))]
    [CanEditMultipleObjects]
    public class E_AmbienceManager : E_CozyModule, E_BiomeModule, IControlPanel
    {


        protected static bool profileSettings;
        protected static bool currentInfo;
        CozyAmbienceModule ambienceManager;


        public override GUIContent GetGUIContent()
        {

            return new GUIContent("    Ambience", (Texture)Resources.Load("Ambience Profile"), "Controls a secondary weather system that runs parallel to the main system allowing for ambient noises and FX.");

        }

        void OnEnable()
        {

            if (target)
                ambienceManager = (CozyAmbienceModule)target;

        }
        public override void GetReportsInformation()
        {

            EditorGUILayout.LabelField(GetGUIContent(), EditorStyles.toolbar);

            EditorGUILayout.HelpBox("Current Ambiences", MessageType.None);
            foreach (CozyAmbienceModule.WeightedAmbience w in ambienceManager.weightedAmbience)
                EditorGUILayout.HelpBox($"{w.ambienceProfile.name} - Weight: {w.weight}", MessageType.None);

        }

        public void GetControlPanel()
        {
            EditorGUILayout.PropertyField(serializedObject.FindProperty("currentAmbienceProfile"));
        }

        public override void OpenDocumentationURL()
        {
            Application.OpenURL("https://distant-lands.gitbook.io/cozy-stylized-weather-documentation/how-it-works/modules/ambience-module");
        }

        public override void DisplayInCozyWindow()
        {
            serializedObject.Update();
            EditorGUI.indentLevel = 0;

            if (ambienceManager == null)
                if (target)
                    ambienceManager = (CozyAmbienceModule)target;
                else
                    return;

            profileSettings = EditorGUILayout.BeginFoldoutHeaderGroup(profileSettings, "    Forecast Settings", EditorUtilities.FoldoutStyle);
            EditorGUI.EndFoldoutHeaderGroup();
            if (profileSettings)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.PropertyField(serializedObject.FindProperty("ambienceProfiles"));
                serializedObject.ApplyModifiedProperties();
                EditorGUILayout.Space();
                if (GUILayout.Button("Add all ambience profiles"))
                    ambienceManager.FindAllAmbiences();
                EditorGUI.indentLevel--;

            }


            currentInfo = EditorGUILayout.BeginFoldoutHeaderGroup(currentInfo, "    Current Information", EditorUtilities.FoldoutStyle);
            EditorGUI.EndFoldoutHeaderGroup();
            if (currentInfo)
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.PropertyField(serializedObject.FindProperty("currentAmbienceProfile"));
                if (Application.isPlaying)
                    EditorGUILayout.HelpBox(ambienceManager.currentAmbienceProfile.name + " will be playing for the next " + ((MeridiemTime)ambienceManager.GetTimeTillNextAmbience()).ToString() + " of in-game time.", MessageType.None, true);

                EditorGUI.indentLevel--;
            }

            serializedObject.ApplyModifiedProperties();
        }

        public void DrawBiomeReports()
        {
            EditorGUILayout.HelpBox($"Current ambience is {ambienceManager.currentAmbienceProfile.name}", MessageType.None, true);
        }

        public void DrawInlineBiomeUI()
        {
            if (target == null) return;
            serializedObject.Update();

            EditorGUI.indentLevel++;
            EditorGUILayout.PropertyField(serializedObject.FindProperty("currentAmbienceProfile"));
            EditorGUI.indentLevel--;


            serializedObject.ApplyModifiedProperties();
        }
    }
#endif
}