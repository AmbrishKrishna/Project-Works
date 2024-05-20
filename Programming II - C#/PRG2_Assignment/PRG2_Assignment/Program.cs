using System;
using System.IO;
using System.Collections.Generic;

namespace PRG2_Assignment
{
    class Program
    {
        static void Main(string[] args)
        {
            //List all movies
            foreach (Movie obj in movieList)
            {
                Console.WriteLine("");
                Console.WriteLine(i + ") " + c);

            }

            //Prompt user to select a movie
            Console.Write("Enter your choice of movie: ");
            int choice = Convert.ToInt32(Console.ReadLine());

            //choice 1
            //choice 2
            //choice 3
            //choice 4
            //choice 5
            //choice 6
            //choice 7
            //choice 8
            //choice 9
            //choice 10

            //Prompt user to select a screening type
            Console.Write("Enter a screening type (2D/3D): ");
            string screenType = Console.ReadLine();

            //choice 2D
            /*
            if (screenType != "2D" && screenType != "3D")
            {

            }
            */

            //choice 3D

            //Prompt user to enter a screening date and time
            Console.Write("Enter a screening date and time separated by a comma(,): ");
            string dateTime = Console.ReadLine();
            dateTime.Split(",");
            string[] array = new string[] { "1/1/2011", "8:00PM" };
            array[0] = dateTime;
            Console.WriteLine(array);
            //check if datetime > openingdate

            //List all cinema halls
            string[] cinemasList = new string[] { };
            int i = 0;
            foreach (string c in cinemasList)
            {
                i++;
                Console.WriteLine(i + ") " + c);
            }

            //Prompt user to select a cinema hall
            Console.Write("Enter a cinema hall: ");
            string cinemaHall = Console.ReadLine();
            //check screeningsList to see if the [1](part of the list) cinemaHall = dateTime

            //Create Screening object with given information
            //Screening newObj = new Screening(dateTime, screenType, cinemaHall, *hallNumber*, choice);
            // ** yet to find

            //Displaying status of screening session creation
            if (true)
            {
                Console.WriteLine("A new session is created!");
            }



            /*
            Console.Write("Enter an integer : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter another integer : ");
            int num2 = Convert.ToInt32(Console.ReadLine());
            try
            {
                Console.WriteLine(num1 + "/" + num2 + " is " + (num1 / num2));
            }
            catch (Exception ex)
            {
                Console.WriteLine("Message : " + ex.Message);
            }
            */
        }
    }
}
