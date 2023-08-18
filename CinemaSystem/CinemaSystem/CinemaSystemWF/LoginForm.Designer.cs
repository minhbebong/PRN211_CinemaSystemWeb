namespace CinemaSystemWF
{
    partial class LoginForm
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
            label4 = new Label();
            label1 = new Label();
            label2 = new Label();
            tbEmail = new TextBox();
            tbPassword = new TextBox();
            btnLogin = new Button();
            linkLabel1 = new LinkLabel();
            SuspendLayout();
            // 
            // label4
            // 
            label4.Font = new Font("Segoe UI", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            label4.Location = new Point(155, 72);
            label4.Name = "label4";
            label4.Size = new Size(430, 56);
            label4.TabIndex = 3;
            label4.Text = "Login";
            label4.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(155, 166);
            label1.Name = "label1";
            label1.Size = new Size(46, 20);
            label1.TabIndex = 4;
            label1.Text = "Email";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(143, 236);
            label2.Name = "label2";
            label2.Size = new Size(70, 20);
            label2.TabIndex = 5;
            label2.Text = "Password";
            // 
            // tbEmail
            // 
            tbEmail.Location = new Point(270, 159);
            tbEmail.Name = "tbEmail";
            tbEmail.Size = new Size(214, 27);
            tbEmail.TabIndex = 6;
            // 
            // tbPassword
            // 
            tbPassword.Location = new Point(270, 229);
            tbPassword.Name = "tbPassword";
            tbPassword.Size = new Size(214, 27);
            tbPassword.TabIndex = 7;
            // 
            // btnLogin
            // 
            btnLogin.Location = new Point(270, 317);
            btnLogin.Name = "btnLogin";
            btnLogin.Size = new Size(118, 60);
            btnLogin.TabIndex = 8;
            btnLogin.Text = "Login";
            btnLogin.UseVisualStyleBackColor = true;
            btnLogin.Click += btnLogin_Click;
            // 
            // linkLabel1
            // 
            linkLabel1.AutoSize = true;
            linkLabel1.Location = new Point(424, 357);
            linkLabel1.Name = "linkLabel1";
            linkLabel1.Size = new Size(127, 20);
            linkLabel1.TabIndex = 9;
            linkLabel1.TabStop = true;
            linkLabel1.Text = "Forgot password?";
            // 
            // LoginForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(786, 471);
            Controls.Add(linkLabel1);
            Controls.Add(btnLogin);
            Controls.Add(tbPassword);
            Controls.Add(tbEmail);
            Controls.Add(label2);
            Controls.Add(label1);
            Controls.Add(label4);
            Name = "LoginForm";
            Text = "LoginForm";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label4;
        private Label label1;
        private Label label2;
        private TextBox tbEmail;
        private TextBox tbPassword;
        private Button btnLogin;
        private LinkLabel linkLabel1;
    }
}