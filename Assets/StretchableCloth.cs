using UnityEngine;

public class StretchableCloth : MonoBehaviour
{
    public Cloth cloth; // Cloth�R���|�[�l���g���Q��
    public float stretchCoefficient = 1.0f; // �L�k�̌W��
    private Mesh originalMesh; // ���̃��b�V���f�[�^
    private Vector3[] originalVertices; // ���̒��_�ʒu
    private Mesh deformedMesh; // �ό`�p�̃��b�V��
    private Vector3[] deformedVertices; // �ό`���ꂽ���_�ʒu

    void Start()
    {
        // ���̃��b�V���ƒ��_�ʒu��ۑ�
        originalMesh = GetComponent<SkinnedMeshRenderer>().sharedMesh;
        originalVertices = originalMesh.vertices;

        // ���b�V���̃R�s�[���쐬
        deformedMesh = Instantiate(originalMesh);
        deformedVertices = new Vector3[originalVertices.Length];
        GetComponent<SkinnedMeshRenderer>().sharedMesh = deformedMesh;
    }

    void Update()
    {
        // Cloth�̌��݂̒��_�ʒu���擾
        var currentVertices = GetComponent<SkinnedMeshRenderer>().sharedMesh.vertices;

        // ���̒��_�ʒu�Ƃ̍������g���ĐV�����ʒu���v�Z
        for (int i = 0; i < originalVertices.Length; i++)
        {
            Vector3 delta = currentVertices[i] - originalVertices[i];
            deformedVertices[i] = originalVertices[i] + stretchCoefficient * delta;
        }

        // �ό`�������_�����b�V���ɔ��f
        deformedMesh.vertices = deformedVertices;
        deformedMesh.RecalculateNormals(); // �K�v�ɉ����Ė@�����Čv�Z
    }
}
