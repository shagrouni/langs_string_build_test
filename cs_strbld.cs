// dotnet build --configuration Release cs_strbld.csproj -o ..\exe
using System;
using System.IO;
using System.Text;

namespace FSharpToCSharp
{
    class Program
    {
        static void Test(long num)
        {
            Console.Write($"  C#");
            StringBuilder s = new StringBuilder("");
            long i = 1L;
            DateTime startTime = DateTime.Now;

            for ( i = 1L; i <= num; i++)
            {
                s.Append(" C " + i.ToString());
            }
            
            TimeSpan elapsedTime = DateTime.Now - startTime;
            int minutes = elapsedTime.Minutes;
            int seconds = elapsedTime.Seconds;
            int milliseconds = elapsedTime.Milliseconds;

            int length = s.Length;
            Console.WriteLine($"  {minutes}:{seconds}:{milliseconds} Iter {num}: Len {length}");
            
            
            string filePath = "out/c#_output.txt";

            try
            {
                using (StreamWriter file = new StreamWriter(filePath))
                {
                    file.Write(s.ToString());
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error saving string to file: {ex.Message}");
            }
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