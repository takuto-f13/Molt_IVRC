using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeshPosition : MonoBehaviour
{
    [SerializeField] private Cloth cloth; // Cloth�R���|�[�l���g
    [SerializeField] private int vertexIndex = 0; // �Œ肵�������_�̃C���f�b�N�X
    [SerializeField] private Transform targetObject; // ���_���Ǐ]����I�u�W�F�N�g

    private Mesh clothMesh; // Cloth�̃��b�V��
    private Vector3[] originalVertices; // Cloth�̒��_�z��
    private Vector3[] modifiedVertices; // �X�V���ꂽ���_�z��

    void Start()
    {
        // Cloth�̃��b�V�����擾
        clothMesh = cloth.GetComponent<SkinnedMeshRenderer>().sharedMesh;
        // ���̒��_����ۑ�
        originalVertices = clothMesh.vertices;
        // �X�V�p�ɒ��_�z����R�s�[
        modifiedVertices = (Vector3[])originalVertices.Clone();
    }

    void Update()
    {
        if (vertexIndex < 0 || vertexIndex >= modifiedVertices.Length)
        {
            Debug.LogError("���_�C���f�b�N�X���͈͊O�ł�");
            return;
        }

        // ���_�̈ʒu���^�[�Q�b�g�I�u�W�F�N�g�̈ʒu�ɍX�V
        modifiedVertices[vertexIndex] = cloth.transform.InverseTransformPoint(targetObject.position);

        // �X�V�������_��Cloth���b�V���ɔ��f
        clothMesh.vertices = modifiedVertices;
        cloth.GetComponent<SkinnedMeshRenderer>().sharedMesh = clothMesh;
    }

    // ���b�V�������̏�ԂɃ��Z�b�g����
    public void ResetMesh()
    {
        clothMesh.vertices = originalVertices;
        clothMesh.RecalculateNormals(); // �K�v�ɉ����Ė@�����Čv�Z
        cloth.GetComponent<SkinnedMeshRenderer>().sharedMesh = clothMesh;
    }

    void OnDisable()
    {
        // �Đ��I�����Ƀ��b�V�������ɖ߂�
        ResetMesh();
    }
}
