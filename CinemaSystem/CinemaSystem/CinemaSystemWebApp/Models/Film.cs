using System;
using System.Collections.Generic;

namespace CinemaSystemWebApp.Models
{
    public partial class Film
    {
        public Film()
        {
            Shows = new HashSet<Show>();
            Categories = new HashSet<Category>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Desc { get; set; }
        public int Length { get; set; }
        public string ImageUrl { get; set; }
        public DateTime ReleaseDate { get; set; }

        public virtual ICollection<Show> Shows { get; set; }

        public virtual ICollection<Category> Categories { get; set; }
    }
}
