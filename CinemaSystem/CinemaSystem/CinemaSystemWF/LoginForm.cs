using CinemaSystemWF;
using CinemaSystemWF.Models;
using CinemeSystemWF.Requests;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CinemaSystemWF
{
    public partial class LoginForm : TemplateForm
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void ForgotPasswordLink_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Process.Start("cmd", "/c start http://localhost:5216/Home/ForgotPassword");
        }

        private async void LoginBtn_Click(object sender, EventArgs e)
        {
            string email = TextBoxEmail.Text;
            string password = TextBoxPassword.Text;

            if (email.Length == 0 || password.Length == 0)
            {
                MessageBox.Show("Please fill all the fields", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            using (var context = new CinemaSystemContext()) // Replace with your actual DbContext class
            {
                var user = context.Users.FirstOrDefault(u => u.Email == email && u.Password == password);

                if (user != null)
                {
                    // Login successful
                    this.Hide();
                    MainForm form = new MainForm();
                    form.Show();
                }
                else
                {
                    MessageBox.Show("Invalid email or password", "Error");
                }


                //    var result = await AuthRequest.Instance.Login(email, password).ConfigureAwait(false);
                //    if (result.Success)
                //    {
                //        Program.Token = result.Token;
                //        this.Invoke(() =>
                //        {
                //            this.Hide();
                //            MainForm form = new();
                //            form.Show();
                //        });
                //    }
                //    else
                //    {
                //        MessageBox.Show(result.Message, "Error");
                //    }
                //}
            }
        }
    }
}
