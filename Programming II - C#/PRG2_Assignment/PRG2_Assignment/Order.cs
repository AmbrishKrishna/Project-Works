using System;
using System.Collections.Generic;
using System.Text;

namespace PRG2_Assignment
{
    class Order
    {
        //Properties
        public int OrderNo { get; set; }
        public DateTime OrderDateTime { get; set; }
        public double Amount { get; set; }
        public string Status { get; set; }
        public List<Ticket> TicketList { get; set; }

        //Constructors
        public Order() { }

        public Order(int o, DateTime oDT)
        {
            OrderNo = o;
            OrderDateTime = oDT;
        }

        public void AddTicket(string t)
        {

        }

        public override string ToString()
        {
            return "OrderNo: " + OrderNo + " OrderDateTime: " + OrderDateTime + " Amount: " + Amount +
                " Status: " + Status + " TicketList: " + TicketList;
        }
    }
}
