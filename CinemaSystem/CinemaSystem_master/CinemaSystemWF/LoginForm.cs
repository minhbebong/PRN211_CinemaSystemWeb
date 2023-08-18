using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CinemaSystemWF;
using CinemeSystemWF.Requests;

namespace CinemaSystemWF
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private async void btnLogin_Click(object sender, EventArgs e)
        {

            string email = txtEmail.Text;
            string password = txtPassword.Text;

            if (email.Length == 0 || password.Length == 0)
            {
                MessageBox.Show("Please fill all the fields", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            var result = await AuthRequest.Instance.Login(email, password).ConfigureAwait(false);
            if (result.Success)
            {
                Program.Token = result.Token;
                this.Invoke(() =>
                {
                    this.Hide();
                    MainForm form = new();
                    form.Show();
                });
            }
            else
            {
                MessageBox.Show(result.Message, "Error");
            }
        }

        private void linkFogotPassword_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Process.Start("cmd", "");
        }

        private void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

