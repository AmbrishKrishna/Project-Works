using System;
using System.Collections.Generic;
using System.Text;

namespace PRG2_Assignment
{
    class SeniorCitizen : Ticket
    {
        //Properties
        public int YearOfBirth { get; set; }

        //Constructors
        public SeniorCitizen(Screening s, int y) : base() { }

        public override double CalculatePrice()
        {
            return 1.0;
        }
    }
}
