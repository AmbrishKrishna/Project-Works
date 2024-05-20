using System;
using System.Collections.Generic;
using System.Text;

namespace PRG2_Assignment
{
    abstract class Ticket
    {
        //Properties
        public Screening Screening { get; set; }

        //Constructors
        public Ticket() { }

        public Ticket(Screening s)
        {
            Screening = s;
        }

        public abstract double CalculatePrice();

        public override string ToString()
        {
            return "Screening: " + Screening;
        }
    }
}
