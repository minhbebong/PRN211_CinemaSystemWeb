namespace CinemaSystemWF
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            DGShows = new DataGridView();
            ID = new DataGridViewTextBoxColumn();
            Film = new DataGridViewTextBoxColumn();
            Start = new DataGridViewTextBoxColumn();
            End = new DataGridViewTextBoxColumn();
            TicketPrice = new DataGridViewTextBoxColumn();
            Room = new DataGridViewTextBoxColumn();
            CheckTicket = new DataGridViewButtonColumn();
            linkLabel1 = new LinkLabel();
            ((System.ComponentModel.ISupportInitialize)DGShows).BeginInit();
            SuspendLayout();
            // 
            // DGShows
            // 
            DGShows.AllowUserToAddRows = false;
            DGShows.AllowUserToDeleteRows = false;
            DGShows.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            DGShows.Columns.AddRange(new DataGridViewColumn[] { ID, Film, Start, End, TicketPrice, Room, CheckTicket });
            DGShows.Dock = DockStyle.Fill;
            DGShows.Location = new Point(0, 0);
            DGShows.Margin = new Padding(3, 4, 3, 4);
            DGShows.Name = "DGShows";
            DGShows.ReadOnly = true;
            DGShows.RowHeadersWidth = 51;
            DGShows.RowTemplate.Height = 25;
            DGShows.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            DGShows.Size = new Size(862, 593);
            DGShows.TabIndex = 5;
            DGShows.CellContentClick += DGShows_CellContentClick;
            // 
            // ID
            // 
            ID.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            ID.HeaderText = "#";
            ID.MinimumWidth = 6;
            ID.Name = "ID";
            ID.ReadOnly = true;
            ID.Width = 47;
            // 
            // Film
            // 
            Film.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            Film.HeaderText = "Film";
            Film.MinimumWidth = 6;
            Film.Name = "Film";
            Film.ReadOnly = true;
            Film.Width = 66;
            // 
            // Start
            // 
            Start.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            Start.HeaderText = "Start";
            Start.MinimumWidth = 6;
            Start.Name = "Start";
            Start.ReadOnly = true;
            Start.Width = 69;
            // 
            // End
            // 
            End.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            End.HeaderText = "End";
            End.MinimumWidth = 6;
            End.Name = "End";
            End.ReadOnly = true;
            End.Width = 63;
            // 
            // TicketPrice
            // 
            TicketPrice.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            TicketPrice.HeaderText = "TicketPrice";
            TicketPrice.MinimumWidth = 6;
            TicketPrice.Name = "TicketPrice";
            TicketPrice.ReadOnly = true;
            TicketPrice.Width = 109;
            // 
            // Room
            // 
            Room.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            Room.HeaderText = "Room";
            Room.MinimumWidth = 6;
            Room.Name = "Room";
            Room.ReadOnly = true;
            Room.Width = 78;
            // 
            // CheckTicket
            // 
            CheckTicket.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            CheckTicket.HeaderText = "CheckTicket";
            CheckTicket.MinimumWidth = 6;
            CheckTicket.Name = "CheckTicket";
            CheckTicket.ReadOnly = true;
            // 
            // linkLabel1
            // 
            linkLabel1.AutoSize = true;
            linkLabel1.Location = new Point(675, 0);
            linkLabel1.Name = "linkLabel1";
            linkLabel1.Size = new Size(56, 20);
            linkLabel1.TabIndex = 6;
            linkLabel1.TabStop = true;
            linkLabel1.Text = "Logout";
            // 
            // MainForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(862, 593);
            Controls.Add(linkLabel1);
            Controls.Add(DGShows);
            Name = "MainForm";
            Text = "Cinema System";
            ((System.ComponentModel.ISupportInitialize)DGShows).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView DGShows;
        private DataGridViewTextBoxColumn ID;
        private DataGridViewTextBoxColumn Film;
        private DataGridViewTextBoxColumn Start;
        private DataGridViewTextBoxColumn End;
        private DataGridViewTextBoxColumn TicketPrice;
        private DataGridViewTextBoxColumn Room;
        private DataGridViewButtonColumn CheckTicket;
        private LinkLabel linkLabel1;
    }
}