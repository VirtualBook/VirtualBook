using UnityEngine;
using System.Collections;

public class SunLight : MonoBehaviour {

    public const float pi = 3.1415F;

    public bool isRotate = false;
    public float angle = 0;
    public float angleV = 2;
    public float distance = 20;

    // Use this for initialization
    void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyDown("z"))
        {
            isRotate = !isRotate;
        }

        if (isRotate)
        {
            angle += angleV * Time.deltaTime;
            float z = distance * Mathf.Cos(angle);
            float x = distance * Mathf.Sin(angle);
            transform.position = new Vector3(x, 0, z);
        }
    }
}
