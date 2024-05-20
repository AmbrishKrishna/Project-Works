using System;
using System.Collections.Generic;
using System.Text;

namespace PRG2_Assignment
{
    class Cinema
    {
        //Properties
        public string Name { get; set; }
        public int HallNo { get; set; }
        public int Capacity { get; set; }

        //Constructors
        public Cinema() { }
        public Cinema(string n, int h, int c)
        {
            Name = n;
            HallNo = h;
            Capacity = c;
        }
        public override string ToString()
        {
            return "Name: " + Name + " HallNo: " + HallNo + " Capacity: " + Capacity;
        }
    }
}
