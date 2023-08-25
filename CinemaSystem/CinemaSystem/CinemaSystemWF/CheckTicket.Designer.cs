namespace CinemaSystemWF
{
    partial class CheckTicket
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CheckTicket));
            label4 = new Label();
            CheckBtn = new Button();
            label3 = new Label();
            TextBoxOTP = new TextBox();
            backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            groupBox1 = new GroupBox();
            DGLogs = new DataGridView();
            Time = new DataGridViewTextBoxColumn();
            Email = new DataGridViewTextBoxColumn();
            Status = new DataGridViewTextBoxColumn();
            pictureBox1 = new PictureBox();
            groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)DGLogs).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            SuspendLayout();
            // 
            // label4
            // 
            label4.Font = new Font("Segoe UI", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            label4.Location = new Point(3, 272);
            label4.Name = "label4";
            label4.Size = new Size(430, 56);
            label4.TabIndex = 8;
            label4.Text = "Check Ticket";
            label4.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // CheckBtn
            // 
            CheckBtn.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            CheckBtn.Location = new Point(147, 430);
            CheckBtn.Margin = new Padding(3, 4, 3, 4);
            CheckBtn.Name = "CheckBtn";
            CheckBtn.Size = new Size(160, 53);
            CheckBtn.TabIndex = 13;
            CheckBtn.Text = "Check";
            CheckBtn.UseVisualStyleBackColor = true;
            CheckBtn.Click += CheckBtn_Click;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(3, 375);
            label3.Name = "label3";
            label3.Size = new Size(35, 20);
            label3.TabIndex = 12;
            label3.Text = "OTP";
            // 
            // TextBoxOTP
            // 
            TextBoxOTP.Location = new Point(55, 368);
            TextBoxOTP.Margin = new Padding(3, 4, 3, 4);
            TextBoxOTP.Name = "TextBoxOTP";
            TextBoxOTP.Size = new Size(357, 27);
            TextBoxOTP.TabIndex = 11;
            // 
            // groupBox1
            // 
            groupBox1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            groupBox1.Controls.Add(DGLogs);
            groupBox1.Location = new Point(450, 48);
            groupBox1.Margin = new Padding(3, 4, 3, 4);
            groupBox1.Name = "groupBox1";
            groupBox1.Padding = new Padding(3, 4, 3, 4);
            groupBox1.Size = new Size(450, 536);
            groupBox1.TabIndex = 14;
            groupBox1.TabStop = false;
            groupBox1.Text = "Logs";
            // 
            // DGLogs
            // 
            DGLogs.AllowUserToAddRows = false;
            DGLogs.AllowUserToDeleteRows = false;
            DGLogs.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            DGLogs.Columns.AddRange(new DataGridViewColumn[] { Time, Email, Status });
            DGLogs.Dock = DockStyle.Fill;
            DGLogs.Location = new Point(3, 24);
            DGLogs.Margin = new Padding(3, 4, 3, 4);
            DGLogs.Name = "DGLogs";
            DGLogs.ReadOnly = true;
            DGLogs.RowHeadersWidth = 51;
            DGLogs.RowTemplate.Height = 25;
            DGLogs.Size = new Size(444, 508);
            DGLogs.TabIndex = 0;
            // 
            // Time
            // 
            Time.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            Time.HeaderText = "Time";
            Time.MinimumWidth = 6;
            Time.Name = "Time";
            Time.ReadOnly = true;
            Time.Width = 71;
            // 
            // Email
            // 
            Email.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Email.HeaderText = "Email";
            Email.MinimumWidth = 6;
            Email.Name = "Email";
            Email.ReadOnly = true;
            // 
            // Status
            // 
            Status.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            Status.HeaderText = "Status";
            Status.MinimumWidth = 6;
            Status.Name = "Status";
            Status.ReadOnly = true;
            Status.Width = 78;
            // 
            // pictureBox1
            // 
            pictureBox1.Image = (Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new Point(40, 60);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(376, 179);
            pictureBox1.SizeMode = PictureBoxSizeMode.Zoom;
            pictureBox1.TabIndex = 15;
            pictureBox1.TabStop = false;
            // 
            // CheckTicket
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(914, 600);
            Controls.Add(pictureBox1);
            Controls.Add(groupBox1);
            Controls.Add(label4);
            Controls.Add(CheckBtn);
            Controls.Add(label3);
            Controls.Add(TextBoxOTP);
            Margin = new Padding(3, 5, 3, 5);
            Name = "CheckTicket";
            Text = "CheckTicket";
            Controls.SetChildIndex(TextBoxOTP, 0);
            Controls.SetChildIndex(label3, 0);
            Controls.SetChildIndex(CheckBtn, 0);
            Controls.SetChildIndex(label4, 0);
            Controls.SetChildIndex(groupBox1, 0);
            Controls.SetChildIndex(pictureBox1, 0);
            groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)DGLogs).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label4;
        private Button CheckBtn;
        private Label label3;
        private TextBox TextBoxOTP;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private GroupBox groupBox1;
        private DataGridView DGLogs;
        private DataGridViewTextBoxColumn Time;
        private DataGridViewTextBoxColumn Email;
        private DataGridViewTextBoxColumn Status;
        private PictureBox pictureBox1;
    }
}