using System;
using System.IO;
using System.Collections.Generic;
using System.Text;

namespace PRG2_Assignment
{
    class Movie
    {
        //Properties
        public string Title { get; set; }
        public int Duration { get; set; }
        public string Classification { get; set; }
        public DateTime OpeningDate { get; set; }
        public List<string> GenreList { get; set; }
        public List<Screening> ScreeningList { get; set; }

        //Constructors
        public Movie() { }
        public Movie(string t, int d, string c, DateTime o, List<Screening> s)
        {
            Title = t;
            Duration = d;
            Classification = c;
            OpeningDate = o;
            ScreeningList = s;
        }

        public void AddGenre(string g)
        {
            GenreList.Add(g);
        }

        public void AddScreening(string s)
        {

        }

        public override string ToString()
        {
            return "Title: " + Title + " Duration: " + Duration + " Classification: " + Classification
                + " OpeningDate: " + OpeningDate + " GenreList: " + GenreList + " ScreeningList: " + ScreeningList;
        }
    }
}
