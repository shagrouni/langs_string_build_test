// dotnet build --configuration Release cs_strbld.csproj -o ..\exe
using System;
using System.IO;
using System.Text;
using System.Diagnostics;

namespace FSharpToCSharp
{
    class Program
    {
        static void Test(long num)
        {
            Console.Write($"  C#");
            StringWriter s = new StringWriter();
            long i = 1L;
            var stopWatch = new Stopwatch();

            stopWatch.Start();
            for ( i = 1L; i <= num; i++)
            {
                s.Write(" C {0}", i);
            }
            stopWatch.Stop();

            TimeSpan elapsedTime = stopWatch.Elapsed;
            int length = s.GetStringBuilder().Length;
            Console.WriteLine($"  {elapsedTime:mm':'ss':'fffff} Iter {num}: Len {length}");
            
            // string filePath = "out/c#_output.txt";

            // try
            // {
            //     using (StreamWriter file = new StreamWriter(filePath))
            //     {
            //         file.Write(s.ToString());
            //     }
            // }
            // catch (Exception ex)
            // {
            //     Console.WriteLine($"Error saving string to file: {ex.Message}");
            // }
        }

        static int Main(string[] args)
        {
            if (args.Length > 0 && long.TryParse(args[0], out long num))
            {
                Test(num);
                return 0;
            }
            else
            {
                Console.WriteLine("Invalid argument. Please provide a valid integer.");
                return 1;
            }
        }
    }
}