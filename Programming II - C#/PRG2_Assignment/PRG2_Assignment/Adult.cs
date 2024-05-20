using System;
using System.Collections.Generic;
using System.Text;

namespace PRG2_Assignment
{
    class Adult : Ticket
    {
        //Properties
        public virtual bool PopcornOffer { get; set; }

        //Constructors
        public Adult(Screening s, bool p) : base() { }

        public override double CalculatePrice()
        {
            return 1.0;
        }
    }
}
