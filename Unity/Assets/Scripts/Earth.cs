using UnityEngine;
using System.Collections;

public class Earth : MonoBehaviour {

    public bool isRotate = false;
    public float angle = 0;
    public float angleV = 10;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        processInput();

	    if (isRotate)
        {
            angle += angleV * Time.deltaTime;
            Quaternion rotate = Quaternion.Euler(0, angle, 0);
            transform.rotation = rotate;
        }
	}

    void processInput()
    {
        if (Input.GetKeyDown("space"))
        {
            isRotate = !isRotate;
        }
    }    

    void reset()
    {

    }
}
