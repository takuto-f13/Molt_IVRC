using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ResetMeshPlane : MonoBehaviour
{
    [SerializeField] private Cloth cloth; // Cloth�R���|�[�l���g
    [SerializeField] private int vertexIndex = 0; // �Œ肵�������_�̃C���f�b�N�X
    [SerializeField] private Transform targetObject; // ���_���Ǐ]����I�u�W�F�N�g

    private Mesh clothMesh; // Cloth�̃��b�V��
    private Vector3[] vertices; // Cloth�̒��_�z��

    void Start()
    {
        // Cloth�̃��b�V�����擾
        clothMesh = cloth.GetComponent<SkinnedMeshRenderer>().sharedMesh;
        vertices = clothMesh.vertices;
    }

    void Update()
    {
        if (vertexIndex < 0 || vertexIndex >= vertices.Length)
        {
            Debug.LogError("���_�C���f�b�N�X���͈͊O�ł�");
            return;
        }

        // ���_�̈ʒu���^�[�Q�b�g�I�u�W�F�N�g�̈ʒu�ɍX�V
        vertices[vertexIndex] = new Vector3(5.0f,0.0f,5.0f);

        // �X�V�������_��Cloth���b�V���ɔ��f
        clothMesh.vertices = vertices;
        cloth.GetComponent<SkinnedMeshRenderer>().sharedMesh = clothMesh;
    }
}
