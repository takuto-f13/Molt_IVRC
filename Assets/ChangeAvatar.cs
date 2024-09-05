using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeAvatar : MonoBehaviour
{
    [SerializeField] private int _ChangeAvatar = 0;

    [SerializeField] private GameObject TestAvatar0;
    [SerializeField] private GameObject Avatar1;
    [SerializeField] private GameObject Avatar2;
    [SerializeField] private GameObject Avatar3;

    // Start is called before the first frame update
    void Awake()
    {
        switch (_ChangeAvatar)
        {
            case 0:
                TestAvatar0.SetActive(true);
                break;
            case 1:
                Avatar1.SetActive(true);
                break;
            case 2:
                Avatar2.SetActive(true);
                break;
            case 3:
                Avatar3.SetActive(true);
                break;
        }
    }
}
