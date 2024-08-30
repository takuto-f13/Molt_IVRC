using UnityEngine;

public class StretchablePlane : MonoBehaviour
{
    public Transform anchor; // �Œ葤�I�u�W�F�N�g
    public Transform target; // �������I�u�W�F�N�g

    private Vector3 initialScale;
    private Mesh mesh;
    private Vector3[] originalVertices;

    void Start()
    {
        // �����X�P�[�����L�^
        initialScale = transform.localScale;

        // Mesh�ƒ��_�̏�����Ԃ��擾
        mesh = GetComponent<MeshFilter>().mesh;
        originalVertices = mesh.vertices;
    }

    void Update()
    {
        // Anchor��Target�̈ʒu���擾
        Vector3 anchorPosition = anchor.position;
        Vector3 targetPosition = target.position;

        // Anchor����Target�ւ̃x�N�g�����v�Z
        Vector3 direction = targetPosition - anchorPosition;
        float distance = direction.magnitude;

        // Plane�̃X�P�[����X�������ɋ����ɍ��킹�Ē���
        transform.localScale = new Vector3(distance / 10f, initialScale.y, initialScale.z);

        // Plane�̈ʒu��Anchor��Target�̒��Ԃɐݒ�
        transform.position = (anchorPosition + targetPosition) / 2;

        // Plane�̉�]��Anchor��Target�̕����ɍ��킹��
        transform.right = direction.normalized;
    }
}
