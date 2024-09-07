using UnityEngine;

public class ChangeParent : MonoBehaviour
{
    [SerializeField] private Transform newParent; // �V�����e�I�u�W�F�N�g
    [SerializeField] private SkinPeel_ctr skinPeel_Ctr;
    [SerializeField] private PlaneController PlaneController;
    [SerializeField] private Moveborder_ctr moveborder_ctr;
    [SerializeField] private GameObject cloth_skin;

    private bool changeParent = false; // ����bool��true�ɂȂ�����e��ύX

    void Update()
    {
        if (changeParent && newParent != null)
        {
            cloth_skin.SetActive(true);
            //Debug.Log("StopMovement");

            GetComponent<MeshRenderer>().enabled = false;
            skinPeel_Ctr.enabled = false;
            //PlaneController.enabled = false;  
            moveborder_ctr.enabled = false;

            PlaneController.EndPoint = true;

            Vector3 localPosition = transform.localPosition;
            Vector3 localScale = transform.localScale;

            // �e��V�����I�u�W�F�N�g�ɕύX
            transform.SetParent(newParent);

            // ���[�J���̈ʒu�ƃX�P�[�����ēK�p
            //transform.localPosition = localPosition;
            localPosition = Vector3.zero;
            transform.localScale = localScale;
        }
    }

    public bool IsChanged
    {
        get { return changeParent; }
        set { changeParent = value; }
    }
}
