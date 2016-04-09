using UnityEngine;
using System.Collections;

public class Textures {

    public static Textures[] seaTempTextures;
    public static string seaTempName = "Sea Temp";
    public static int[] seaTempYears = { 2014 };
    public static int[] seaTempNumber = { 100 };
 //   public static int[] seaTempYears = { 2014, 2015, 2016 };
 //   public static int[] seaTempNumber = { 360, 365, 98 };

	// Use this for initialization
	void Start () {
	
	}

    private static Textures[] LoadTextures(string name, int[] years, int[] numbers)
    {
        Textures[] textures = new Textures[Sum(years)];
        for (int yi = 0; yi < years.Length; yi++)
        {
            int year = years[yi];
            int n = numbers[i];
            for (int k = 1; k < n; k++)
            {

            }
        }

        return textures;
    }

    public static int Sum(int[] n)
    {
        int s = 0;
        for (int i =0; i<n.Length; i++)
        {
            s += i;
        }
        return s;
    }
	
	// Update is called once per frame
	void Update () {
	
	}
}
