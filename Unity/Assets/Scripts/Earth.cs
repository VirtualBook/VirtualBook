using UnityEngine;
using System.Collections;

public class Earth : MonoBehaviour {

    public bool isRotate = false;
    public float angle = 0;
    public float angleV = 10;

    private Textures tex;

	// Use this for initialization
	void Start () {
        Textures.LoadAll();
        tex = new Textures();
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

        tex.Update();
        
        Renderer r = GetComponent<Renderer>();
        r.material.SetTexture("_MainTex", tex.getCurTex());
    }

    void processInput()
    {
        if (Input.GetKeyDown("space"))
        {
            isRotate = !isRotate;
        }

        if (Input.GetKeyDown("x"))
        {
            tex.ToggleAnimated();
        }

        if (Input.GetKeyDown("a"))
        {
            tex.setTexture(Textures.defaultTextures);
        }

        if (Input.GetKeyDown("s"))
        {
            tex.setTexture(Textures.seaTempTextures);
        }
    }    
}
