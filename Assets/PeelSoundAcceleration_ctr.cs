using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Valve.VR;
using Valve.VR.InteractionSystem;

public class PeelSoundAcceleration_ctr : MonoBehaviour
{
    [SerializeField] private float Acc_threshold = 100f;

    public bool CheckUpper_Threshold = false;

    // Start is called before the first frame update
    void Start()
    {
        GetComponent<AudioSource>().Play();
    }

    // Update is called once per frame
    void Update()
    {
        //‰Á‘¬“x‚ÌŽæ“¾
        VelocityEstimator VE = GetComponent<VelocityEstimator>();

        float Acceleration = VE.GetAccelerationEstimate().magnitude / Acc_threshold;
        float Velocity = VE.GetVelocityEstimate().x / Acc_threshold;

        if (Acceleration > 1.0f)
        {
            CheckUpper_Threshold=true;
            Acceleration = 1.0f;
        }
        Debug.Log(Acceleration);

        //‰¹—Ê‚Ì•Ï‰»
        GetComponent<AudioSource>().volume = Acceleration;
    }
}
