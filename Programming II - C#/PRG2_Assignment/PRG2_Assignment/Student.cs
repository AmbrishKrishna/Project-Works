using System;
using System.Collections.Generic;
using System.Text;

namespace PRG2_Assignment
{
    class Student : Ticket
    {
        //Properties
        public string LevelOfStudy { get; set; }

        //Constructors
        public Student(Screening s, string x) : base() { }

        public override double CalculatePrice()
        {
            return 1.0;
            
        }
    }
}
