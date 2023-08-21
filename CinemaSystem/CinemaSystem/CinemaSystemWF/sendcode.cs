using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CinemaSystemWF
{
    public partial class sendcode : Form
    {
        string randomcode;
        public static string to;

        public sendcode()
        {
            InitializeComponent();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            LoginForm loginForm = new LoginForm();
            loginForm.Show();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            string from, pass, messesagebody;
            Random random = new Random();
            randomcode = (random.Next(9999999)).ToString();
            MailMessage message = new MailMessage();
            to = (textBox1.Text).ToString();
            from = "csdeptest@gmail.com";
            pass = "1234cs1234";
            messesagebody = $"Your Reset Code is {randomcode}";
            message.To.Add(to);
            message.From = new MailAddress(from);
            message.Body = messesagebody;
            message.Subject = "Password Reset Code";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(from, pass);
            try
            {
                smtp.Send(message);
                MessageBox.Show("Code have been sent to your email!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private void button3_Click(object sender, EventArgs e)
        {
            if (randomcode == (textBox2.Text).ToString())
            {
                to = textBox1.Text;
                resetpassword rp = new resetpassword();
                this.Hide();
                rp.Show();
            }
            else
            {
                MessageBox.Show("You have enter wrong code");

            }
        }
    }
}