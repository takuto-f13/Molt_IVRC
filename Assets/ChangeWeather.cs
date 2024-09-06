using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DistantLands.Cozy;
using DistantLands.Cozy.Data;

public class ChangeWeather : MonoBehaviour
{
    //Reference module
    private CozyWeatherModule weatherModule;
    [SerializeField] private List<WeatherProfile> weatherProfiles;

    [SerializeField] private int _ChangeWeather = 0;
    // Start is called before the first frame update
    void Start()
    {
        weatherModule = FindObjectOfType<CozyWeatherModule>();
        if (weatherProfiles != null && weatherProfiles.Count > 0)
        {
            ApplyWeatherProfile(weatherProfiles[0]);
        }
    }

    // Update is called once per frame
    void Update()
    {
        ChangeWeatherByIndex(_ChangeWeather);
    }

    public void ApplyWeatherProfile(WeatherProfile profile)
    {
        if (weatherModule == null || profile == null)
        {
            Debug.LogWarning("WeatherModule or Profile is not set.");
            return;
        }
        foreach (var weather in weatherModule.ecosystem.forecastProfile.profilesToForecast)
        {
            weather.SetWeatherWeight(0);
        }

        profile.SetWeatherWeight(1.0f);
        weatherModule.PropogateVariables();
    }
    public void ChangeWeatherByIndex(int index)
    {
        if (index < 0 || index >= weatherProfiles.Count)
        {
            Debug.LogWarning("Invalid weather profile index.");
            return;
        }

        ApplyWeatherProfile(weatherProfiles[index]);
    }
    public int ChangeWeatherNumber
    {
        get { return _ChangeWeather; }
        set { _ChangeWeather = value; }
    }
}
