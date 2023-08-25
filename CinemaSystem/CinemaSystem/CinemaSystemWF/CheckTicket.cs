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
            var otp = TextBoxOTP.Text.Trim();

            if (otp.Length == 0)
            {
                MessageBox.Show("Please enter OTP");
                return;
            }

            using (var context = new CinemaSystemContext())
            {
                var ticket = context.Tickets.FirstOrDefault(t => t.Show.Id == showID && t.Otp == otp);

                if (ticket != null)
                {
                    if (ticket.IsUsed)
                    {
                        MessageBox.Show("This OTP has already been checked.");
                    }
                    else
                    {
                        // Cập nhật trạng thái mã OTP đã được sử dụng
                        ticket.IsUsed = true;
                        context.SaveChanges();

                        MessageBox.Show("OTP is valid. It has been marked as used.");

                        // Thêm thông tin log vào DataGridView
                        DGLogs.Rows.Add(DateTime.Now, ticket.Otp, "Checked");

                        // Xóa mã OTP đã kiểm tra khỏi TextBox
                        TextBoxOTP.Text = string.Empty;
                    }
                }
                else
                {
                    MessageBox.Show("Invalid OTP");
                }
            }
        }
    }

}



