using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Valve.VR;
using static RootMotion.FinalIK.RagdollUtility;

public class SkinPeel_ctr : MonoBehaviour
{
    [SerializeField] private Transform border_object;
    [SerializeField] private Transform skin_object;
    [SerializeField] private Transform controller;
    [SerializeField] private SteamVR_Input_Sources handType;
    [SerializeField] private SteamVR_Action_Boolean triggerAction;
    [SerializeField] private int _ChengeModeSkin = 0;

    [SerializeField] private bool _ChengeEnabled = false;
    [SerializeField] private float widthFactor = 2.0f; // �ړ������ɑ΂��镝�̑����{��
    [SerializeField] private float dis_the = 0.25f;

    [SerializeField] PlaneController PlaneController;
    [SerializeField] private Transform _AimObject;

    private Vector3 lastPosition;
    private Vector3 initialPosition;
    private Vector3 initialposition_world;
    private float savedistance = 0.0f;

    // Start is called before the first frame update
    void Start()
    {
        // �����̃I�u�W�F�N�g�ʒu�ƃX�P�[����ۑ�
        lastPosition = border_object.position;
        initialPosition = skin_object.localPosition;
    }

    // Update is called once per frame
    void Update()
    {

        if (triggerAction.GetState(handType)||_ChengeEnabled)
        {
            // border�̈ړ��������v�Z
            Vector3 movement = border_object.position - lastPosition;

            // �ړ������ɉ����ĕ����v�Z
            float newScaleX = skin_object.localScale.x + movement.magnitude * widthFactor;

            switch (_ChengeModeSkin)
            {
                case 0:
                    // �В[�̈ʒu��ێ����邽�߂ɃI�u�W�F�N�g�̈ʒu�𒲐�
                    float scaleChange = newScaleX - skin_object.localScale.x;
                    //float positionOffset = scaleChange / 2.0f;

                    //position/scale = 5.0f
                    skin_object.localScale = new Vector3(newScaleX, skin_object.localScale.y, skin_object.localScale.z);
                    skin_object.localPosition = new Vector3(initialPosition.x + scaleChange * 5.0f, initialPosition.y, initialPosition.z);
                    break;
                case 1:
                    // �В[�̈ʒu��ێ����邽�߂ɃI�u�W�F�N�g�̈ʒu�𒲐�
                    scaleChange = newScaleX - skin_object.localScale.x;
                    //float positionOffset = scaleChange / 2.0f;

                    //position/scale = 5.0f
                    skin_object.localScale = new Vector3(newScaleX, skin_object.localScale.y, skin_object.localScale.z);
                    skin_object.localPosition = new Vector3(initialPosition.x, initialPosition.y, initialPosition.z);
                    break;
                case 2:
                    // �В[�̈ʒu��ێ����邽�߂ɃI�u�W�F�N�g�̈ʒu�𒲐�
                    scaleChange = newScaleX - skin_object.localScale.x;
                    //float positionOffset = scaleChange / 2.0f;

                    //position/scale = 5.0f
                    skin_object.localScale = new Vector3(newScaleX, skin_object.localScale.y, skin_object.localScale.z);
                    skin_object.localPosition = new Vector3(initialPosition.x, initialPosition.y, initialPosition.z +  scaleChange * 5.0f);
                    break;
                case 3:
                    float distance = Vector3.Distance(border_object.position, controller.position) / 2;
                   
                    skin_object.localScale = new Vector3(distance, skin_object.localScale.y, skin_object.localScale.z);
                    skin_object.localPosition = new Vector3(initialPosition.x, initialPosition.y, distance*5.2f + border_object.position.z);

                    break;
                case 4:
                    //distance = Vector3.Distance(border_object.position, controller.position) / 2;
                    distance = (border_object.position.z - controller.position.z) / 2;
                    if (savedistance < distance)
                    {
                        savedistance = distance;
                    }

                    skin_object.localScale = new Vector3(savedistance, skin_object.localScale.y, skin_object.localScale.z);
                    skin_object.localPosition = new Vector3(initialPosition.x, initialPosition.y, savedistance * 2f + border_object.position.z);

                    break;
                case 5:
                    distance = Vector3.Distance(border_object.position, controller.position) / 2;
                    if (savedistance < distance)
                    {
                        savedistance = distance;
                    }

                    PlaneController.ChangeSag = distance / savedistance;
                    //Debug.Log(PlaneController.ChangeSag);

                    //Debug.Log(distance);
                    if(distance < dis_the)
                    {
                        PlaneController.ChangeSag = -0.07f;
                    }

                    skin_object.localScale = new Vector3(distance, skin_object.localScale.y, skin_object.localScale.z);
                    skin_object.localPosition = new Vector3(initialPosition.x, initialPosition.y, distance * 5.2f + border_object.position.z);

                    break;
                case 6:
                    distance = Vector3.Distance(border_object.position, _AimObject.position) / 2;
                    if (savedistance < distance)
                    {
                        savedistance = distance;
                    }

                    PlaneController.ChangeSag = distance / savedistance;
                    //Debug.Log(PlaneController.ChangeSag);

                    //Debug.Log(distance);
                    if (distance < dis_the)
                    {
                        PlaneController.ChangeSag = -0.07f;
                    }

                    skin_object.localScale = new Vector3(distance, skin_object.localScale.y, skin_object.localScale.z);
                    skin_object.localPosition = new Vector3(initialPosition.x, initialPosition.y, distance * 5.3f + border_object.position.z);
                    break;
            }
        }

        initialPosition = skin_object.localPosition;
        lastPosition = border_object.position;
    }
}
