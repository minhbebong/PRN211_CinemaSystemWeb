using System;
using System.Collections.Generic;

namespace CinemaSystemWF.Models
{
    public partial class Ticket
    {
        public int ShowId { get; set; }
        public int? UserId { get; set; }
        public string Otp { get; set; }
        public int Row { get; set; }
        public int Col { get; set; }
        public bool IsUsed { get; set; }

        public virtual Show Show { get; set; }
        public virtual User User { get; set; }
        public bool IsTicketValid { get; internal set; }
    }
}
