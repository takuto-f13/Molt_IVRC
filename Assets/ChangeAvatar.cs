using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeAvatar : MonoBehaviour
{
    [SerializeField] private int _ChangeAvatar = 0;

    [SerializeField] private GameObject [] Avatar;

    // Start is called before the first frame update
    void Awake()
    {
        if(_ChangeAvatar < 0 ||  _ChangeAvatar >= Avatar.Length)
        {
            Debug.Log("Only Avatar number");
            _ChangeAvatar = 0;
        }

        for (int i = 0; i < Avatar.Length; i++) { Avatar[i].SetActive(false); }
        Avatar[_ChangeAvatar].SetActive(true);
    }
}
