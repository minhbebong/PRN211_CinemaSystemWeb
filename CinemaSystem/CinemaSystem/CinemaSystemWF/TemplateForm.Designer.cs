namespace CinemaSystemWF
{
    partial class TemplateForm
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
            ExitBtn = new Button();
            TopTitle = new Panel();
            label1 = new Label();
            TopTitle.SuspendLayout();
            SuspendLayout();
            // 
            // ExitBtn
            // 
            ExitBtn.BackgroundImage = Properties.Resources.close;
            ExitBtn.BackgroundImageLayout = ImageLayout.Zoom;
            ExitBtn.Dock = DockStyle.Right;
            ExitBtn.FlatAppearance.BorderSize = 0;
            ExitBtn.FlatAppearance.MouseDownBackColor = Color.FromArgb(255, 192, 192);
            ExitBtn.FlatAppearance.MouseOverBackColor = Color.FromArgb(255, 128, 128);
            ExitBtn.FlatStyle = FlatStyle.Flat;
            ExitBtn.Location = new Point(868, 0);
            ExitBtn.Margin = new Padding(0);
            ExitBtn.Name = "ExitBtn";
            ExitBtn.Size = new Size(46, 40);
            ExitBtn.TabIndex = 0;
            ExitBtn.UseVisualStyleBackColor = true;
            ExitBtn.Click += ExitBtn_Click;
            // 
            // TopTitle
            // 
            TopTitle.Controls.Add(label1);
            TopTitle.Controls.Add(ExitBtn);
            TopTitle.Dock = DockStyle.Top;
            TopTitle.Location = new Point(0, 0);
            TopTitle.Margin = new Padding(3, 4, 3, 4);
            TopTitle.Name = "TopTitle";
            TopTitle.Size = new Size(914, 40);
            TopTitle.TabIndex = 3;
            TopTitle.MouseDown += TopTitle_MouseDown;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label1.Location = new Point(3, 4);
            label1.Name = "label1";
            label1.Size = new Size(144, 28);
            label1.TabIndex = 1;
            label1.Text = "Cinema System";
            label1.MouseDown += TopTitle_MouseDown;
            // 
            // TemplateForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(914, 600);
            Controls.Add(TopTitle);
            FormBorderStyle = FormBorderStyle.None;
            Margin = new Padding(3, 4, 3, 4);
            Name = "TemplateForm";
            Text = "Template";
            TopTitle.ResumeLayout(false);
            TopTitle.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private Button ExitBtn;
        private Label label1;
        private Panel TopTitle;
    }
}