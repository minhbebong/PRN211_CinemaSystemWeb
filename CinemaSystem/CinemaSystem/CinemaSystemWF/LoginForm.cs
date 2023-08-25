using CinemaSystemWF;
using CinemaSystemWF.Models;
using CinemeSystemWF.Requests;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CinemaSystemWebApp.Utils;

namespace CinemaSystemWF
{
    public partial class LoginForm : TemplateForm
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        public LoginForm(TemplateForm parentForm)
        {
            InitializeComponent();
            loginForm = (LoginForm)parentForm; // Lưu form đăng nhập
        }

        private void ForgotPasswordLink_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Process.Start("cmd", "/c start http://localhost:5216/Home/ForgotPassword");
        }

        private void LoginBtn_Click(object sender, EventArgs e)
        {
            string email = TextBoxEmail.Text;
            string password = TextBoxPassword.Text;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Please fill in all the fields", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            using (var context = new CinemaSystemContext())
            {
                var user = context.Users.FirstOrDefault(u => u.Email == email);

                if (user != null)
                {
                    if (user.Role == 0)
                    {
                        MessageBox.Show("Đăng nhập không được phép.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        // Compare hashed password
                        string hashedPassword = Crypto.SHA256(password);
                        if (hashedPassword == user.Password)
                        {
                            // Ẩn form đăng nhập và hiển thị MainForm
                            this.Hide();
                            // Both role 1 and role 2 can log in
                            MainForm mainForm = new MainForm();
                            mainForm.Show();
                        }
                        else
                        {
                            MessageBox.Show("Invalid email or password", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                else
                {
                    MessageBox.Show("User not found", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

    }

}
