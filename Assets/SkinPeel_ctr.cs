using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Valve.VR;

public class SkinPeel_ctr : MonoBehaviour
{
    [SerializeField] private Transform border_object;
    [SerializeField] private Transform skin_object;
    [SerializeField] private SteamVR_Input_Sources handType;
    [SerializeField] private SteamVR_Action_Boolean triggerAction;
    [SerializeField] private int _ChengeModeSkin = 0;

    [SerializeField] private float widthFactor = 2.0f; // �ړ������ɑ΂��镝�̑����{��

    private Vector3 lastPosition;
    private Vector3 initialPosition;
    private Vector3 initialposition_world;

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
        if (triggerAction.GetState(handType))
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
                    skin_object.localPosition = new Vector3(initialPosition.x + scaleChange * 5.0f * widthFactor, initialPosition.y, initialPosition.z);
                    break;
            }
        }

        initialPosition = skin_object.localPosition;
        lastPosition = border_object.position;
    }
}
