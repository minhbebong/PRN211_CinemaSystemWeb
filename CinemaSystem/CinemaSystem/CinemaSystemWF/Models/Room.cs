using System;
using System.Collections.Generic;

namespace CinemaSystemWF.Models
{
    public partial class Room
    {
        public Room()
        {
            Shows = new HashSet<Show>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Rows { get; set; }
        public int Cols { get; set; }

        public virtual ICollection<Show> Shows { get; set; }
    }
}
