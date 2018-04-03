using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise_p36_Csharp_Course
{
    class Program
    {
        static void Main(string[] args)
        {
            bool validInput = false;

            do
            {
                try
                {
                    Console.Clear();
                    Console.Write("Enter a number on which to do some math:  ");
                    double num = Convert.ToDouble(Console.ReadLine());
                    Console.WriteLine($"Your number plus 5 is equal to {NumOps.AddFive(num)}");
                    Console.WriteLine($"Your number minus 5 is equal to {NumOps.SubtractFive(num)}");
                    Console.WriteLine($"Your number times 5 is equal to {NumOps.MultiplyFive(num)}");
                    validInput = true;
                }

                catch (Exception)
                {
                    Console.WriteLine("\nInvalid Input.  Please enter a number.\n Press any key to try again.");
                }

                finally
                {
                    Console.ReadKey();
                }
            } while (!validInput);
       }
    }
}
