﻿namespace CinemaSystemWF
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
            label2 = new Label();
            TextBoxEmail = new TextBox();
            TextBoxPassword = new TextBox();
            label3 = new Label();
            LoginBtn = new Button();
            label4 = new Label();
            button1 = new Button();
            SuspendLayout();
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(14, 136);
            label2.Name = "label2";
            label2.Size = new Size(46, 20);
            label2.TabIndex = 3;
            label2.Text = "Email";
            // 
            // TextBoxEmail
            // 
            TextBoxEmail.Location = new Point(86, 132);
            TextBoxEmail.Margin = new Padding(3, 4, 3, 4);
            TextBoxEmail.Name = "TextBoxEmail";
            TextBoxEmail.Size = new Size(357, 27);
            TextBoxEmail.TabIndex = 4;
            // 
            // TextBoxPassword
            // 
            TextBoxPassword.Location = new Point(86, 171);
            TextBoxPassword.Margin = new Padding(3, 4, 3, 4);
            TextBoxPassword.Name = "TextBoxPassword";
            TextBoxPassword.PasswordChar = '*';
            TextBoxPassword.Size = new Size(357, 27);
            TextBoxPassword.TabIndex = 5;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(14, 175);
            label3.Name = "label3";
            label3.Size = new Size(70, 20);
            label3.TabIndex = 6;
            label3.Text = "Password";
            // 
            // LoginBtn
            // 
            LoginBtn.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            LoginBtn.Location = new Point(149, 227);
            LoginBtn.Margin = new Padding(3, 4, 3, 4);
            LoginBtn.Name = "LoginBtn";
            LoginBtn.Size = new Size(160, 53);
            LoginBtn.TabIndex = 7;
            LoginBtn.Text = "Login";
            LoginBtn.UseVisualStyleBackColor = true;
            LoginBtn.Click += LoginBtn_Click;
            // 
            // label4
            // 
            label4.Font = new Font("Segoe UI", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            label4.Location = new Point(14, 44);
            label4.Name = "label4";
            label4.Size = new Size(430, 56);
            label4.TabIndex = 2;
            label4.Text = "Login";
            label4.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // button1
            // 
            button1.Location = new Point(317, 319);
            button1.Name = "button1";
            button1.Size = new Size(128, 29);
            button1.TabIndex = 8;
            button1.Text = "Forgot Password";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // LoginForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(457, 360);
            Controls.Add(button1);
            Controls.Add(label4);
            Controls.Add(LoginBtn);
            Controls.Add(label3);
            Controls.Add(TextBoxPassword);
            Controls.Add(TextBoxEmail);
            Controls.Add(label2);
            Margin = new Padding(3, 5, 3, 5);
            Name = "LoginForm";
            Text = "Login";
            Controls.SetChildIndex(label2, 0);
            Controls.SetChildIndex(TextBoxEmail, 0);
            Controls.SetChildIndex(TextBoxPassword, 0);
            Controls.SetChildIndex(label3, 0);
            Controls.SetChildIndex(LoginBtn, 0);
            Controls.SetChildIndex(label4, 0);
            Controls.SetChildIndex(button1, 0);
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label2;
        private TextBox TextBoxEmail;
        private TextBox TextBoxPassword;
        private Label label3;
        private Button LoginBtn;
        private Label label4;
        private Button button1;
    }
}