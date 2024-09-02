using System;
using UnityEngine;

public class PlaneSagController : MonoBehaviour
{
    // �������i�|���S����=128x128x2�j
    [SerializeField] private int n_divx = 128;
    [SerializeField] private int n_divz = 128;

    // �T�C�Y
    [SerializeField] private float size_x = 10f;
    [SerializeField] private float size_z = 0.5f;

    // �p�Ȓ��x
    [SerializeField] private float a = -0.07f;
    [SerializeField] private float b = 22f;

    // ����ݗ�
    private float Sag;

    // �Е��̕ӂ��Œ肷��I�u�W�F�N�g
    public Transform fixedObject;

    private DateTime t_0;

    private Mesh mesh;
    private Vector3[] vertices;

    void Awake()
    {
        CreateMesh();
        Deform(a, b);
    }

    void Start()
    {
        Deform(a, b);
    }

    void Update()
    {
        TimeSpan t = DateTime.Now - t_0;
        double omega = 0.01;
        double A = a * Math.Sin(omega * t.TotalMilliseconds);
        double B = b * Math.Sin(omega * t.TotalMilliseconds);

        Deform(a - Sag / 5, b);
    }

    void CreateMesh()
    {
        // ���b�V���̏�����
        mesh = new Mesh();
        MeshFilter meshFilter = GetComponent<MeshFilter>();
        meshFilter.sharedMesh = mesh;

        // ���_��
        int n_vertx = n_divx + 1;
        int n_vertz = n_divz + 1;

        // ���_��UV�̏�����
        vertices = new Vector3[n_vertx * n_vertz];
        Vector2[] uv = new Vector2[n_vertx * n_vertz];
        int k = 0;

        for (int i = 0; i <= n_divz; i++)
        {
            for (int j = 0; j <= n_divx; j++)
            {
                float u = (float)j / n_divx;
                float v = (float)i / n_divz;
                float x = (u - 0.5f) * size_x;
                float z = (v - 0.5f) * size_z;
                float y = 0;  // �����̍���
                vertices[k] = new Vector3(x, z, y);
                uv[k++].Set(u, v);
            }
        }

        // �O�p�`�|���S���̐ݒ�
        var triangles = new int[6 * n_divx * n_divz];
        int l = 0, A = 0, B = 1, C = n_vertx, D = n_vertx + 1;
        for (int i = 0; i < n_divz; i++)
        {
            for (int j = 0; j < n_divx; j++)
            {
                // 1�ڂ̎O�p�`
                triangles[l++] = A;
                triangles[l++] = C++;
                triangles[l++] = D;
                // 2�ڂ̎O�p�`
                triangles[l++] = B++;
                triangles[l++] = A++;
                triangles[l++] = D++;
            }
            A++; B++; C++; D++;
        }

        // ���b�V������
        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.uv = uv;

        // �@���ƃo�E���f�B���O�{�b�N�X�̍Čv�Z
        mesh.RecalculateNormals();
        mesh.RecalculateBounds();
        GetComponent<MeshCollider>().sharedMesh = mesh;
    }

    void Deform(float a, float b)
    {
        // ����݂𔽉f�����邽�߂ɒ��_��ό`
        for (int i = 0; i < vertices.Length; i++)
        {
            float x = vertices[i].x;
            float z = vertices[i].z;
            float y = a * x * x + b * z * z;

            // ���[�̒��_���Œ�I�u�W�F�N�g�̈ʒu�ɌŒ�
            if (i % (n_divx + 1) == 0)  // ���[�̒��_
            {
                vertices[i] = fixedObject.position;
            }
            else
            {
                vertices[i] = new Vector3(x, z, y);
            }
        }

        // ���b�V���ɕό`��K�p
        mesh.vertices = vertices;
        mesh.RecalculateNormals();
        mesh.RecalculateBounds();
        //GetComponent<MeshCollider>().sharedMesh = mesh;
    }

    // Sag�̃v���p�e�B
    public float ChangeSag
    {
        get { return this.Sag; }  //�擾�p
        set { this.Sag = value; } //�l���͗p
    }
}
