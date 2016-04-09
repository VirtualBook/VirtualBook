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

    public static Texture[] seaTempTextures;
    public static string seaTempName = "Sea Temp";
    private static bool isLoaded = false;

    public static void LoadAll()
    {
        if (isLoaded) return;
        isLoaded = true;
        
        seaTempTextures = Resources.LoadAll<Texture>("Sea Temp/2015");
    }

    private Texture[] textures;
    private int day = 0;
    private int totalDay = 365;
    public bool isAnimated = false;

    public void Reset()
    {
        day = 0;
        isAnimated = false;
    }

    public void Update()
    {
        if (!isAnimated) return;

        day += 1;
        if (day >= 365)
        {
            day = 0;
        }
    }

    public void ToggleAnimated()
    {
        isAnimated = !isAnimated;
    }

    public Texture getCurTex()
    {
        int index = (int)Mathf.Floor((float)day * textures.Length / 365);
        if (index >= textures.Length) index = textures.Length;
        return textures[index];
    }
}
