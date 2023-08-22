using System;
using System.Collections.Generic;

namespace CinemaSystemWebApp.Models
{
    public partial class User
    {
        public enum Roles
        {
            User,
            Staff,
            Admin
        }
        public User()
        {
            Tickets = new HashSet<Ticket>();
        }

        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string AvatarUrl { get; set; }
        public double Balance { get; set; }
        public int Role { get; set; }

        public virtual ICollection<Ticket> Tickets { get; set; }
    }
}
