using UnityEngine;

public class StretchableCloth : MonoBehaviour
{
    public Transform anchor1;  // �Œ葤�I�u�W�F�N�g
    public Transform anchor2;  // �������I�u�W�F�N�g

    private Mesh mesh;
    private Vector3[] originalVertices;
    private Vector3[] modifiedVertices;

    void Start()
    {
        mesh = GetComponent<MeshFilter>().mesh;
        originalVertices = mesh.vertices;
        modifiedVertices = new Vector3[originalVertices.Length];
    }

    void Update()
    {
        // ���[�̃A���J�[�Ԃ̋������v�Z
        Vector3 direction = anchor2.position - anchor1.position;
        float distance = direction.magnitude;

        // �A���J�[�̒��ԓ_���v�Z
        Vector3 midpoint = (anchor1.position + anchor2.position) / 2;

        // ���_�̈ʒu���X�V
        for (int i = 0; i < originalVertices.Length; i++)
        {
            // �I���W�i���̒��_�̈ʒu
            Vector3 vertex = originalVertices[i];

            // �V�������_�̈ʒu���v�Z
            Vector3 worldPos = transform.TransformPoint(vertex);
            float yFactor = Mathf.Sin((worldPos - midpoint).magnitude * Mathf.PI / distance) * (distance / 2);
            worldPos.y = Mathf.Lerp(worldPos.y, yFactor, 0.5f);

            // ���[�J�����W�ɕϊ����ĕۑ�
            modifiedVertices[i] = transform.InverseTransformPoint(worldPos);
        }

        // ���b�V���ɕύX��K�p
        mesh.vertices = modifiedVertices;
        mesh.RecalculateNormals();
        mesh.RecalculateBounds();
    }
}
