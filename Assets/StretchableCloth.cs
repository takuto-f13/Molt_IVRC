using UnityEngine;

public class StretchableCloth : MonoBehaviour
{
    public Cloth cloth; // Clothコンポーネントを参照
    public float stretchCoefficient = 1.0f; // 伸縮の係数
    private Mesh originalMesh; // 元のメッシュデータ
    private Vector3[] originalVertices; // 元の頂点位置
    private Mesh deformedMesh; // 変形用のメッシュ
    private Vector3[] deformedVertices; // 変形された頂点位置

    void Start()
    {
        // 元のメッシュと頂点位置を保存
        originalMesh = GetComponent<SkinnedMeshRenderer>().sharedMesh;
        originalVertices = originalMesh.vertices;

        // メッシュのコピーを作成
        deformedMesh = Instantiate(originalMesh);
        deformedVertices = new Vector3[originalVertices.Length];
        GetComponent<SkinnedMeshRenderer>().sharedMesh = deformedMesh;
    }

    void Update()
    {
        // Clothの現在の頂点位置を取得
        var currentVertices = GetComponent<SkinnedMeshRenderer>().sharedMesh.vertices;

        // 元の頂点位置との差分を使って新しい位置を計算
        for (int i = 0; i < originalVertices.Length; i++)
        {
            Vector3 delta = currentVertices[i] - originalVertices[i];
            deformedVertices[i] = originalVertices[i] + stretchCoefficient * delta;
        }

        // 変形した頂点をメッシュに反映
        deformedMesh.vertices = deformedVertices;
        deformedMesh.RecalculateNormals(); // 必要に応じて法線を再計算
    }
}
