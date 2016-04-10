using UnityEngine;
using System.Collections;

public class MyException : System.Exception {
    public string msg;
    public MyException(string s)
    {
        msg = s;
    }
}

public class Textures {

    public static Texture[] defaultTextures;
    public static Texture[] seaTempTextures;
    public static Texture[] landTempTextures;
    private static bool isLoaded = false;

    public static void LoadAll()
    {
        if (isLoaded) return;
        isLoaded = true;

        defaultTextures = Resources.LoadAll<Texture>("Default");
        seaTempTextures = Resources.LoadAll<Texture>("Sea Temp/2014");
        landTempTextures = Resources.LoadAll<Texture>("Land Temp/2015");
    }

    private Texture[] textures;
    private float day = 0;
    public bool isAnimated = false;

    public Textures(string name)
    {
        setTexture(name);
    }

    public void setTexture(string name)
    {
        if (name == "default") textures = defaultTextures;
        else if (name == "sea_temp") textures = seaTempTextures;
        else if (name == "land_temp") textures = landTempTextures;
    }

    public void Reset()
    {
        day = 0;
        isAnimated = false;
    }

    public void Update()
    {
        if (!isAnimated) return;

        day += Time.deltaTime * 4;
        if (day >= 365)
        {
            day -= 365;
        }
    }

    public void ToggleAnimated()
    {
        isAnimated = !isAnimated;
    }

    public Texture getCurTex()
    {
        int index = (int)Mathf.Floor(day * textures.Length / 365);
        if (index >= textures.Length) index = textures.Length;
        Debug.Log(index);
        return textures[index];
    }
}
