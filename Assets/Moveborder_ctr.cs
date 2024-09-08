using RootMotion.Demos;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Valve.VR;
using Valve.VR.InteractionSystem;

public class Moveborder_ctr : MonoBehaviour
{
    [SerializeField] private SteamVR_Input_Sources handType;
    [SerializeField] private SteamVR_Action_Boolean triggerAction;
    [SerializeField] private SteamVR_Behaviour_Pose controllerPose;
    [SerializeField] private Transform targetObject;
    [SerializeField] private Transform targetObject_rotation;

    [SerializeField] private float Move_Resistance;
    [SerializeField] private float Key_Move_Speed = 0.1f;

    [SerializeField] private ChangeParent ChangeParent;

    [SerializeField] private bool _MoveDevice = false;
    public float Movedistance = 0.1f;
    private float _TempMovement = 0.0f;

    private Vector3 lastControllerPosition;
    private bool EndPoint = false;

    // Start is called before the first frame update
    void Start()
    {
        lastControllerPosition = controllerPose.transform.localPosition;
    }

    // Update is called once per frame
    void Update()
    {
        //��]�̓���
        float controllerRotationX = targetObject_rotation.localEulerAngles.x;
        Vector3 this_rotation = this.transform.localEulerAngles;

        this_rotation.x = controllerRotationX;

        this.transform.localEulerAngles = this_rotation;

        // �g���K�[��������Ă��邩�ǂ������m�F
        if (triggerAction.GetState(handType) && !_MoveDevice)
        {
            // ���݂̃R���g���[���[�̈ʒu���擾
            Vector3 currentControllerPosition = controllerPose.transform.localPosition;

            // �R���g���[���[��x���̈ړ��ʂ��v�Z
            //�ω��ʂɕϐ������A���������邱�ƂŒE��̒�R���𑝂₹��(�ϐ��͌�X������)
            Vector3 movement = Move_Resistance * (currentControllerPosition - lastControllerPosition);

            // �I�u�W�F�N�g���^�[�Q�b�g�Ɍ������Ĉړ�����������v�Z
            Vector3 directionToTarget = (targetObject.position - this.transform.position).normalized;

            // �I�u�W�F�N�g�𓮂���
            this.transform.position += directionToTarget * movement.magnitude;

            //Debug.Log(Vector3.Distance(targetObject.position, this.transform.position));
            if (Vector3.Distance(targetObject.position, this.transform.position) < 0.15)
            {
                //Debug.Log("on");
                EndPoint = true;
            }

            // �R���g���[���[�̈ʒu���X�V
            lastControllerPosition = currentControllerPosition;
        }
        else if(Input.GetKey(KeyCode.A) && _MoveDevice)
        {

            Vector3 directionToTarget = (targetObject.position - this.transform.position).normalized;

            this.transform.position += directionToTarget * Move_Resistance * Key_Move_Speed;

            if (Vector3.Distance(targetObject.position, this.transform.position) < 0.15)
            {
                //Debug.Log("on");
                EndPoint = true;
            }
        }
        else if (_MoveDevice)
        {
            Vector3 directionToTarget = (targetObject.position - this.transform.position).normalized;
            if(_TempMovement != Movedistance)
            {
                this.transform.position += directionToTarget * (Movedistance - _TempMovement) / 100f;
                _TempMovement = Movedistance;
            }

            if (Vector3.Distance(targetObject.position, this.transform.position) < 0.15)
            {
                //Debug.Log("on");
                EndPoint = true;
            }
        }
        else
        {
            // �g���K�[��������Ă��Ȃ��ꍇ�A�R���g���[���[�̈ʒu���X�V���Ă���
            lastControllerPosition = controllerPose.transform.localPosition;
        }
        ChangeParent.IsChanged = EndPoint;
    }
}
