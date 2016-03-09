title: 浮点数比较
date: 2016-03-09 10:47:14
tags:
---
``` cs
using System;

// Reference:
// https://github.com/MattRix/UnityDecompiled/blob/master/UnityEngine/UnityEngine/Mathf.cs
// https://github.com/MattRix/UnityDecompiled/blob/master/UnityEngine/UnityEngineInternal/MathfInternal.cs
public class Test
{
    public struct MathfInternal
    {
        public static volatile float FloatMinNormal = 1.17549435E-38f;
        public static volatile float FloatMinDenormal = 1.401298E-45f;
        public static bool IsFlushToZeroEnabled = MathfInternal.FloatMinDenormal == 0f;
    }

    public readonly float Epsilon = (!MathfInternal.IsFlushToZeroEnabled) ? MathfInternal.FloatMinDenormal : MathfInternal.FloatMinNormal;

    public void TestFunc ()
    {
        float total = 1f;
        float num = 0f;
        
        for (int i = 0; i < 10; ++i)
        {
            num += 0.1f;
        }

        Console.WriteLine(num == total); // Print "False"
        Console.WriteLine(Approximately(num, total)); // Print "True"
    }

    private bool Approximately (float a, float b)
    {
        return Math.Abs (b - a) < Math.Max (1E-06f * Math.Max (Math.Abs (a), Math.Abs (b)), Epsilon * 8f);
    }
}
```