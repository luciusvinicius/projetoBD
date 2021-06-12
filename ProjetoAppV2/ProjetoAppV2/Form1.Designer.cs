
namespace ProjetoAppV2
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.viewAdd = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.fracaoEndereco = new System.Windows.Forms.TextBox();
            this.condominioListBox = new System.Windows.Forms.ListBox();
            this.fracaoEnderecoText = new System.Windows.Forms.Label();
            this.attDropdown = new System.Windows.Forms.ComboBox();
            this.fracaoArea = new System.Windows.Forms.TextBox();
            this.attListBox = new System.Windows.Forms.ListBox();
            this.fracaoAreaText = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.fracaoIdentificadorText = new System.Windows.Forms.Label();
            this.fracaoIdentificador = new System.Windows.Forms.TextBox();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.viewAdd.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.SuspendLayout();
            // 
            // viewAdd
            // 
            this.viewAdd.Controls.Add(this.tabPage1);
            this.viewAdd.Controls.Add(this.tabPage2);
            this.viewAdd.Location = new System.Drawing.Point(12, 12);
            this.viewAdd.Name = "viewAdd";
            this.viewAdd.SelectedIndex = 0;
            this.viewAdd.Size = new System.Drawing.Size(776, 426);
            this.viewAdd.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.fracaoEndereco);
            this.tabPage1.Controls.Add(this.condominioListBox);
            this.tabPage1.Controls.Add(this.fracaoEnderecoText);
            this.tabPage1.Controls.Add(this.attDropdown);
            this.tabPage1.Controls.Add(this.fracaoArea);
            this.tabPage1.Controls.Add(this.attListBox);
            this.tabPage1.Controls.Add(this.fracaoAreaText);
            this.tabPage1.Controls.Add(this.button1);
            this.tabPage1.Controls.Add(this.fracaoIdentificadorText);
            this.tabPage1.Controls.Add(this.fracaoIdentificador);
            this.tabPage1.Location = new System.Drawing.Point(4, 24);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(768, 398);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "View";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // fracaoEndereco
            // 
            this.fracaoEndereco.Location = new System.Drawing.Point(359, 124);
            this.fracaoEndereco.Multiline = true;
            this.fracaoEndereco.Name = "fracaoEndereco";
            this.fracaoEndereco.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.fracaoEndereco.Size = new System.Drawing.Size(410, 183);
            this.fracaoEndereco.TabIndex = 19;
            this.fracaoEndereco.Visible = false;
            // 
            // condominioListBox
            // 
            this.condominioListBox.FormattingEnabled = true;
            this.condominioListBox.ItemHeight = 15;
            this.condominioListBox.Location = new System.Drawing.Point(3, 3);
            this.condominioListBox.Name = "condominioListBox";
            this.condominioListBox.Size = new System.Drawing.Size(182, 379);
            this.condominioListBox.TabIndex = 10;
            this.condominioListBox.SelectedIndexChanged += new System.EventHandler(this.condominioListBox_SelectedIndexChanged);
            // 
            // fracaoEnderecoText
            // 
            this.fracaoEnderecoText.AutoSize = true;
            this.fracaoEnderecoText.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.fracaoEnderecoText.Location = new System.Drawing.Point(359, 100);
            this.fracaoEnderecoText.Name = "fracaoEnderecoText";
            this.fracaoEnderecoText.Size = new System.Drawing.Size(74, 21);
            this.fracaoEnderecoText.TabIndex = 18;
            this.fracaoEnderecoText.Text = "Endereço";
            this.fracaoEnderecoText.Visible = false;
            // 
            // attDropdown
            // 
            this.attDropdown.FormattingEnabled = true;
            this.attDropdown.Location = new System.Drawing.Point(211, 3);
            this.attDropdown.Name = "attDropdown";
            this.attDropdown.Size = new System.Drawing.Size(121, 23);
            this.attDropdown.TabIndex = 11;
            this.attDropdown.Text = "Atributos";
            this.attDropdown.SelectedIndexChanged += new System.EventHandler(this.attDropdown_SelectedIndexChanged);
            // 
            // fracaoArea
            // 
            this.fracaoArea.Location = new System.Drawing.Point(500, 57);
            this.fracaoArea.Name = "fracaoArea";
            this.fracaoArea.Size = new System.Drawing.Size(58, 23);
            this.fracaoArea.TabIndex = 17;
            this.fracaoArea.Visible = false;
            // 
            // attListBox
            // 
            this.attListBox.FormattingEnabled = true;
            this.attListBox.ItemHeight = 15;
            this.attListBox.Location = new System.Drawing.Point(211, 33);
            this.attListBox.Name = "attListBox";
            this.attListBox.Size = new System.Drawing.Size(121, 349);
            this.attListBox.TabIndex = 12;
            this.attListBox.SelectedIndexChanged += new System.EventHandler(this.attListBox_SelectedIndexChanged);
            // 
            // fracaoAreaText
            // 
            this.fracaoAreaText.AutoSize = true;
            this.fracaoAreaText.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.fracaoAreaText.Location = new System.Drawing.Point(500, 24);
            this.fracaoAreaText.Name = "fracaoAreaText";
            this.fracaoAreaText.Size = new System.Drawing.Size(42, 21);
            this.fracaoAreaText.TabIndex = 16;
            this.fracaoAreaText.Text = "Area";
            this.fracaoAreaText.Visible = false;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(704, 409);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 10);
            this.button1.TabIndex = 13;
            this.button1.Text = "Add";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // fracaoIdentificadorText
            // 
            this.fracaoIdentificadorText.AutoSize = true;
            this.fracaoIdentificadorText.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.fracaoIdentificadorText.Location = new System.Drawing.Point(359, 24);
            this.fracaoIdentificadorText.Name = "fracaoIdentificadorText";
            this.fracaoIdentificadorText.Size = new System.Drawing.Size(97, 21);
            this.fracaoIdentificadorText.TabIndex = 15;
            this.fracaoIdentificadorText.Text = "Identificador";
            this.fracaoIdentificadorText.Visible = false;
            // 
            // fracaoIdentificador
            // 
            this.fracaoIdentificador.Location = new System.Drawing.Point(359, 57);
            this.fracaoIdentificador.Name = "fracaoIdentificador";
            this.fracaoIdentificador.Size = new System.Drawing.Size(100, 23);
            this.fracaoIdentificador.TabIndex = 14;
            this.fracaoIdentificador.Visible = false;
            // 
            // tabPage2
            // 
            this.tabPage2.Location = new System.Drawing.Point(4, 24);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(768, 398);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Add";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.viewAdd);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.viewAdd.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl viewAdd;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TextBox fracaoEndereco;
        private System.Windows.Forms.ListBox condominioListBox;
        private System.Windows.Forms.Label fracaoEnderecoText;
        private System.Windows.Forms.ComboBox attDropdown;
        private System.Windows.Forms.TextBox fracaoArea;
        private System.Windows.Forms.ListBox attListBox;
        private System.Windows.Forms.Label fracaoAreaText;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label fracaoIdentificadorText;
        private System.Windows.Forms.TextBox fracaoIdentificador;
        private System.Windows.Forms.TabPage tabPage2;
    }
}

