using System;
using System.Collections.Generic;
using System.Text;

namespace PRG2_Assignment
{
    class Screening
    {
        //Properties
        public int Screening_no { get; set; }
        public DateTime Screening_date_time { get; set; }
        public string Screen_type { get; set; }
        public int Seats_remaining { get; set; }
        public Cinema Cinema { get; set; }
        public Movie Movie { get; set; }

        //Constructors
        public Screening() { }
        public Screening(int sNo, DateTime sDT, string sType, Cinema c, Movie m)
        {
            Screening_no = sNo;
            Screening_date_time = sDT;
            Screen_type = sType;
            Cinema = c;
            Movie = m;
        }

        public override string ToString()
        {
            return "ScreeningNo: " + ScreeningNo + " ScreeningDateTime: " + ScreeningDateTime +
                " ScreenType: " + ScreenType + " SeatsRemaining: " + SeatsRemaining +
                " Cinema: " + Cinema + " Movie: " + Movie;
        }
    }
}
