using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Valve.VR;
using Valve.VR.InteractionSystem;

public class PeelSoundAcceleration_ctr : MonoBehaviour
{
    [SerializeField] private float _Acc_threshold = 100f;

    public bool CheckUpper_Threshold = false;

    [SerializeField] AddEffect SetVelocity;

    // Start is called before the first frame update
    void Start()
    {
        GetComponent<AudioSource>().Play();
    }

    // Update is called once per frame
    void Update()
    {
        Debug.Log(CheckUpper_Threshold);
        //加速度の取得
        VelocityEstimator VE = GetComponent<VelocityEstimator>();

        float Acceleration = VE.GetAccelerationEstimate().magnitude / _Acc_threshold;
        float Velocity = VE.GetVelocityEstimate().x / _Acc_threshold;
        
        if (Acceleration > 1.0f)
        {
            CheckUpper_Threshold=true;
            Acceleration = 1.0f;
        }
        Debug.Log(Acceleration);

        SetVelocity.SetAcc_Velocity = Acceleration;

        //音量の変化
        GetComponent<AudioSource>().volume = Acceleration;
    }

    public bool Miss_Point
    {
        get { return CheckUpper_Threshold; }
    }
}
