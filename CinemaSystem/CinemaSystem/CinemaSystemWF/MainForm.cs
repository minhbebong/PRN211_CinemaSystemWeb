using CinemaSystemWF.Models;
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
    public partial class MainForm : TemplateForm
    {
        public MainForm()
        {
            InitializeComponent();
        }
        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            // Khi đóng MainForm, hiển thị lại LoginForm
            if (loginForm != null && !loginForm.IsDisposed)
            {
                loginForm.Show();
            }
        }
        private async void MainForm_Load(object sender, EventArgs e)
        {
            
            using (var context = new CinemaSystemContext()) // Replace with your actual DbContext class
            {
                var shows = context.Shows.ToList();

                this.Invoke(() =>
                {
                    foreach (var show in shows)
                    {
                        DGShows.Rows.Add(show.Id, show.FilmId, show.Start.ToString("dd/MM/yyyy"), show.End.ToString("dd/MM/yyyy"), show.TicketPrice, show.RoomId, "Check");
                    }
                });
            }
        }

        private void DGShows_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.ColumnIndex == 6)
                {
                    int showID = (int)DGShows.Rows[e.RowIndex].Cells[0].Value;
                    this.Hide();
                    var form = new CheckTicket(showID);
                    form.FormClosing += (_, _) => this.Show();
                    form.ShowDialog();
                }
            }
            catch { }
        }
    }
}

