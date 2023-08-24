using CinemaSystemWF.Models;
using CinemeSystemWF;
using CinemeSystemWF.Requests;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CinemaSystemWF
{
    public partial class CheckTicket : TemplateForm
    {
        private int showID;

        public CheckTicket(int showId)
        {
            this.showID = showId;
            InitializeComponent();
        }

        private async void CheckBtn_Click(object sender, EventArgs e)
        {
            var email = TextBoxEmail.Text.Trim();
            var otp = TextBoxOTP.Text.Trim();

            if (email.Length == 0 || otp.Length == 0)
            {
                MessageBox.Show("Please fill all fields");
                return;
            }

            using (var context = new CinemaSystemContext())
            {
                var ticket = context.Tickets.FirstOrDefault(t => t.Show.Id == showID && t.User.Email == email && t.Otp == otp);
                if (ticket != null)
                {
                    MessageBox.Show("Ticket is valid");

                    // Thêm thông tin log vào DataGridView
                    DGLogs.Rows.Add(DateTime.Now, email, ticket.IsUsed);
                }
                else
                {
                    MessageBox.Show("Invalid ticket");



                }
            }
        }
    }
}



