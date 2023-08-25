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
            panel1 = new Panel();
            btn_Logout = new Button();
            ((System.ComponentModel.ISupportInitialize)DGShows).BeginInit();
            panel1.SuspendLayout();
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
            DGShows.Size = new Size(887, 536);
            DGShows.TabIndex = 4;
            DGShows.CellClick += DGShows_CellClick;
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
            // panel1
            // 
            panel1.Controls.Add(btn_Logout);
            panel1.Controls.Add(DGShows);
            panel1.Location = new Point(14, 48);
            panel1.Margin = new Padding(3, 4, 3, 4);
            panel1.Name = "panel1";
            panel1.Size = new Size(887, 536);
            panel1.TabIndex = 5;
            // 
            // btn_Logout
            // 
            btn_Logout.Location = new Point(794, -1);
            btn_Logout.Name = "btn_Logout";
            btn_Logout.Size = new Size(94, 29);
            btn_Logout.TabIndex = 5;
            btn_Logout.Text = "Logout";
            btn_Logout.UseVisualStyleBackColor = true;
            btn_Logout.Click += btn_Logout_Click;
            // 
            // MainForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(914, 600);
            Controls.Add(panel1);
            Margin = new Padding(3, 5, 3, 5);
            Name = "MainForm";
            Text = "MainForm";
            Load += MainForm_Load;
            Controls.SetChildIndex(panel1, 0);
            ((System.ComponentModel.ISupportInitialize)DGShows).EndInit();
            panel1.ResumeLayout(false);
            ResumeLayout(false);
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
        private Panel panel1;
        private Button btn_Logout;
    }
}