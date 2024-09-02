using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkinRotation_ctr : MonoBehaviour
{
    [SerializeField]private Transform target;

    void Update()
    {
        if (target != null)
        {
            // �^�[�Q�b�g�̕������擾
            Vector3 direction = target.position - transform.position;

            // �Ώە����Ɍ����ĉ�]
            transform.rotation = Quaternion.LookRotation(direction);
        }
    }
}
