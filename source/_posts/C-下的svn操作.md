title: 'C#下的svn操作'
date: 2016-03-17 12:02:09
tags:
---
实现是**利用C#的Process来执行外部程序，然后借助cmd来调用TortoiseProc（或者svn）命令行来进行svn操作**。
不过cmd命令行中对输入有长度限制，**XP或更高版本命令行最大长度为8191个字符**。
如果超出限度的话，就需要将命令中的部分参数存成文本，然后再调用。

具体使用例子如下

``` cs
using System.IO;
using System.Text;
using System.Diagnostics;
using System.Collections.Generic;

public class Test
{
    private void TestFunction()
    {
        string tmpFilePath = "C:\\SvnCommit.tmp";
        List<string> commitFiles = new List<string>();
        //commitFiles.Add(@"c;/commitFile1.txt");
        //commitFiles.Add(@"c;/commitFile2.txt");
        using (var s = File.Create(tmpFilePath))
        {
            using (var sw = new StreamWriter(s, new UnicodeEncoding(false, false)))
            {
                for (int i = 0, count = commitFiles.Count; i < count; ++i)
                {
                    sw.Write(commitFiles[i] + '\n');
                }
            }
        }
        
        Execute("TortoiseProc /command:commit /pathfile:\"" + tmpFilePath + "\"", true);
    }

    public void Execute(string cmd, bool createNoWindow)
    {
        Process p = new Process();
        p.StartInfo.FileName = "cmd.exe";
        p.StartInfo.Arguments = "/c " + cmd;
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.RedirectStandardInput = true;
        p.StartInfo.RedirectStandardOutput = true;
        p.StartInfo.RedirectStandardError = true;
        p.StartInfo.CreateNoWindow = createNoWindow;
        p.Start();
    }

}

```