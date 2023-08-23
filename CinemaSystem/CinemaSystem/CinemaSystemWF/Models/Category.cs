using System;
using System.Collections.Generic;

namespace CinemaSystemWF.Models
{
    public partial class Category
    {
        public Category()
        {
            Films = new HashSet<Film>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Desc { get; set; }

        public virtual ICollection<Film> Films { get; set; }
    }
}
