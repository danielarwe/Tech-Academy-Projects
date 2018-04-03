using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercise_p34_Csharp_Course
{
    class Program
    {
        static void Main(string[] args)
        {
            bool invalidInput = true;
            do
            {
                Console.Clear();
                try
                {
                    Console.WriteLine("1.  Player\n2.  Dart\n3.  Balloon\n");   //menu displayed for user
                    Console.Write("Which of the above classes of object would you like to create?   ");  //user enters selection
                    byte selection = Convert.ToByte(Console.ReadLine());  //read user selection and type cast to byte
                    switch (selection)
                    {    //action taken based on user selection
                        case 1:
                            Player player = CreatePlayer();   //method called to create instance of player class
                            Console.WriteLine("\nPlayer Info:");    //lising properties of player object
                            Console.WriteLine($"Name:  {player.Name}");
                            Console.WriteLine($"Gender:  {player.Gender}");
                            Console.WriteLine($"Status:  {player.Status}");
                            Console.WriteLine($"Score:  {player.Score}");
                            break;
                        case 2:
                            Dart dart1 = CreateDart();    //method called to create instance of dart class
                            Console.WriteLine("\nDart Info:");  //lising properties of dart object
                            Console.WriteLine($"X-Position: {dart1.PositionX}");
                            Console.WriteLine($"Y-Position:  {dart1.PositionY}");
                            break;
                        case 3:
                            Balloon balloon1 = CreateBalloon();   //method called to create instance of balloon class
                            Console.WriteLine("\nBalloon Info:");   //lising properties of balloon object
                            Console.WriteLine($"X-Position: {balloon1.PositionX}");
                            Console.WriteLine($"Y-Position:  {balloon1.PositionY}");
                            Console.WriteLine($"Color:  {balloon1.Color}");
                            Console.WriteLine($"Size:  {balloon1.Size}");
                            Console.WriteLine($"Status:  {balloon1.Status}");
                            break;
                    }
                    if (selection != 1 || selection != 2 || selection != 3)
                    {
                        Console.WriteLine("Invalid input!  Please enter a 1, 2, or 3!");
                    }
                    else { invalidInput = false; }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Invalid input!  Please enter a 1, 2, or 3!");
                }

                finally
                {
                    Console.WriteLine("\nPress any key to try again.");
                    Console.ReadKey();
                }
            } while (invalidInput);
        }
        public static Player CreatePlayer() //method to create instance of Player class
        {  
            Player player = new Player();
            player.Name = "John Doe";
            player.Gender = "male";
            player.Status = "active";
            player.Score = 0;
            return player;  //return object to main method
        }

        public static Dart CreateDart()  //method to create instance of Dart class
        {
            Dart dart1 = new Dart();
            dart1.PositionX = 0;
            dart1.PositionY = 0;
            return dart1;   //return object to main method
        }

        public static Balloon CreateBalloon()   //method to create instance of Balloon class
        {
            Balloon balloon1 = new Balloon();
            balloon1.PositionX = 100;
            balloon1.PositionY = 100;
            balloon1.Color = "red";
            balloon1.Size = 1;
            balloon1.Status = "inflated";
            return balloon1;    //return object to main method
        }
    }
}

