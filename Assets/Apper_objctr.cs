using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Apper_objctr : MonoBehaviour
{
    [SerializeField] private ChangeParent ChangeParent;
    [SerializeField] private Cloth clothComponent;
    [SerializeField] private GameObject skin;

    private bool apper_obj = false;
    private ClothSkinningCoefficient[] originalSkinningCoefficients;

    // Update is called once per frame
    void Update()
    {
        apper_obj = ChangeParent.IsChanged;

        if (apper_obj)
        {
            transform.localPosition = skin.transform.localPosition;
            transform.localRotation = skin.transform.localRotation;
            //transform.localScale = skin.transform.localScale;

            // RecreateCloth();
            skin.GetComponent<MeshRenderer>().enabled = false;
        }
    }
    void RecreateCloth()
    {
        // Cloth�R���|�[�l���g���폜
        if (clothComponent != null)
        {
            Destroy(clothComponent);
        }

        // �V����Cloth�R���|�[�l���g��ǉ�
        clothComponent = gameObject.AddComponent<Cloth>();
        clothComponent.coefficients = originalSkinningCoefficients;

        // �K�v�ɉ����đ���Cloth�ݒ���R�s�[
        // clothComponent.stretchingStiffness = 1.0f; �Ȃ�
    }
}
