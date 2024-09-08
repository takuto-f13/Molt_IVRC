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
        //回転の同期
        float controllerRotationX = targetObject_rotation.localEulerAngles.x;
        Vector3 this_rotation = this.transform.localEulerAngles;

        this_rotation.x = controllerRotationX;

        this.transform.localEulerAngles = this_rotation;

        // トリガーが押されているかどうかを確認
        if (triggerAction.GetState(handType) && !_MoveDevice)
        {
            // 現在のコントローラーの位置を取得
            Vector3 currentControllerPosition = controllerPose.transform.localPosition;

            // コントローラーのx軸の移動量を計算
            //変化量に変数をつけ、小さくすることで脱皮の抵抗感を増やせる(変数は後々加える)
            Vector3 movement = Move_Resistance * (currentControllerPosition - lastControllerPosition);

            // オブジェクトがターゲットに向かって移動する方向を計算
            Vector3 directionToTarget = (targetObject.position - this.transform.position).normalized;

            // オブジェクトを動かす
            this.transform.position += directionToTarget * movement.magnitude;

            //Debug.Log(Vector3.Distance(targetObject.position, this.transform.position));
            if (Vector3.Distance(targetObject.position, this.transform.position) < 0.15)
            {
                //Debug.Log("on");
                EndPoint = true;
            }

            // コントローラーの位置を更新
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
            // トリガーが押されていない場合、コントローラーの位置を更新しておく
            lastControllerPosition = controllerPose.transform.localPosition;
        }
        ChangeParent.IsChanged = EndPoint;
    }
}
