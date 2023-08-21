using Microsoft.Data.SqlClient;
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
    public partial class resetpassword : Form
    {
        string email = sendcode.to;
        public resetpassword()
        {
            InitializeComponent();
        }

        private void resetpassword_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            LoginForm loginForm = new LoginForm();
            loginForm.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string password = textBox2.Text;
            if (textBox1.Text == password)
            {

            }
            SqlConnection conn = new SqlConnection(@Data Source = (local);
            string q = "update [User] set [Password] = '" + password + "' WHERE EMAIL= '" + email + "'";
            SqlCommand cmd = new SqlCommand(q, conn);

            conn.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                MessageBox.Show("Password have changed successfully!");
            }
            else
            {
                MessageBox.Show("Sorry your New Password and Confirm Pass Word is not match");
            }
            conn.Close();

        }
    }
}
