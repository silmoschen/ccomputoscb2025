namespace Padron
{
    partial class Form1
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
            this.button1 = new System.Windows.Forms.Button();
            this.arch = new System.Windows.Forms.TextBox();
            this.codos = new System.Windows.Forms.TextBox();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(439, 24);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(127, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "Exportar Medicos";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // arch
            // 
            this.arch.Location = new System.Drawing.Point(29, 24);
            this.arch.Name = "arch";
            this.arch.Size = new System.Drawing.Size(387, 20);
            this.arch.TabIndex = 1;
            this.arch.Text = "z:\\prescriptores.csv";
            // 
            // codos
            // 
            this.codos.Location = new System.Drawing.Point(29, 50);
            this.codos.Name = "codos";
            this.codos.Size = new System.Drawing.Size(130, 20);
            this.codos.TabIndex = 2;
            this.codos.Text = "121005";
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(29, 76);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(537, 199);
            this.listBox1.TabIndex = 3;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(583, 290);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.codos);
            this.Controls.Add(this.arch);
            this.Controls.Add(this.button1);
            this.Name = "Form1";
            this.Text = "Exportar";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox arch;
        private System.Windows.Forms.TextBox codos;
        private System.Windows.Forms.ListBox listBox1;
    }
}

