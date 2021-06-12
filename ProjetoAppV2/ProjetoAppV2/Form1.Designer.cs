
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
            this.saveButton = new System.Windows.Forms.Button();
            this.editButton = new System.Windows.Forms.Button();
            this.condominioPainel = new System.Windows.Forms.Panel();
            this.condominioEndereco = new System.Windows.Forms.TextBox();
            this.condominioSaldo = new System.Windows.Forms.TextBox();
            this.condominioFim = new System.Windows.Forms.TextBox();
            this.condominioInicio = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.condominioNome = new System.Windows.Forms.TextBox();
            this.condominioEstado = new System.Windows.Forms.TextBox();
            this.condominioNumRegistro = new System.Windows.Forms.TextBox();
            this.condominioNumContribuinte = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.removeButton = new System.Windows.Forms.Button();
            this.attDropdown = new System.Windows.Forms.ComboBox();
            this.attListBox = new System.Windows.Forms.ListBox();
            this.button1 = new System.Windows.Forms.Button();
            this.condominioListBox = new System.Windows.Forms.ListBox();
            this.fracaoPainel = new System.Windows.Forms.Panel();
            this.fracaoEndereco = new System.Windows.Forms.TextBox();
            this.fracaoEnderecoText = new System.Windows.Forms.Label();
            this.fracaoArea = new System.Windows.Forms.TextBox();
            this.fracaoAreaText = new System.Windows.Forms.Label();
            this.fracaoIdentificador = new System.Windows.Forms.TextBox();
            this.fracaoIdentificadorText = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.cancelButton = new System.Windows.Forms.Button();
            this.viewAdd.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.condominioPainel.SuspendLayout();
            this.fracaoPainel.SuspendLayout();
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
            this.tabPage1.Controls.Add(this.cancelButton);
            this.tabPage1.Controls.Add(this.saveButton);
            this.tabPage1.Controls.Add(this.editButton);
            this.tabPage1.Controls.Add(this.condominioPainel);
            this.tabPage1.Controls.Add(this.removeButton);
            this.tabPage1.Controls.Add(this.attDropdown);
            this.tabPage1.Controls.Add(this.attListBox);
            this.tabPage1.Controls.Add(this.button1);
            this.tabPage1.Controls.Add(this.condominioListBox);
            this.tabPage1.Controls.Add(this.fracaoPainel);
            this.tabPage1.Location = new System.Drawing.Point(4, 24);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(768, 398);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "View";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // saveButton
            // 
            this.saveButton.Location = new System.Drawing.Point(675, 359);
            this.saveButton.Name = "saveButton";
            this.saveButton.Size = new System.Drawing.Size(75, 23);
            this.saveButton.TabIndex = 28;
            this.saveButton.Text = "Salvar";
            this.saveButton.UseVisualStyleBackColor = true;
            this.saveButton.Visible = false;
            this.saveButton.Click += new System.EventHandler(this.saveButton_Click);
            // 
            // editButton
            // 
            this.editButton.Location = new System.Drawing.Point(675, 359);
            this.editButton.Name = "editButton";
            this.editButton.Size = new System.Drawing.Size(75, 23);
            this.editButton.TabIndex = 27;
            this.editButton.Text = "Editar";
            this.editButton.UseVisualStyleBackColor = true;
            this.editButton.Visible = false;
            this.editButton.Click += new System.EventHandler(this.editButton_Click);
            // 
            // condominioPainel
            // 
            this.condominioPainel.Controls.Add(this.condominioEndereco);
            this.condominioPainel.Controls.Add(this.condominioSaldo);
            this.condominioPainel.Controls.Add(this.condominioFim);
            this.condominioPainel.Controls.Add(this.condominioInicio);
            this.condominioPainel.Controls.Add(this.label8);
            this.condominioPainel.Controls.Add(this.label7);
            this.condominioPainel.Controls.Add(this.label6);
            this.condominioPainel.Controls.Add(this.condominioNome);
            this.condominioPainel.Controls.Add(this.condominioEstado);
            this.condominioPainel.Controls.Add(this.condominioNumRegistro);
            this.condominioPainel.Controls.Add(this.condominioNumContribuinte);
            this.condominioPainel.Controls.Add(this.label5);
            this.condominioPainel.Controls.Add(this.label4);
            this.condominioPainel.Controls.Add(this.label3);
            this.condominioPainel.Controls.Add(this.label2);
            this.condominioPainel.Controls.Add(this.label1);
            this.condominioPainel.Location = new System.Drawing.Point(211, 33);
            this.condominioPainel.Name = "condominioPainel";
            this.condominioPainel.Size = new System.Drawing.Size(554, 320);
            this.condominioPainel.TabIndex = 26;
            this.condominioPainel.Visible = false;
            // 
            // condominioEndereco
            // 
            this.condominioEndereco.Enabled = false;
            this.condominioEndereco.Location = new System.Drawing.Point(0, 186);
            this.condominioEndereco.Multiline = true;
            this.condominioEndereco.Name = "condominioEndereco";
            this.condominioEndereco.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.condominioEndereco.Size = new System.Drawing.Size(539, 124);
            this.condominioEndereco.TabIndex = 15;
            // 
            // condominioSaldo
            // 
            this.condominioSaldo.Enabled = false;
            this.condominioSaldo.Location = new System.Drawing.Point(404, 105);
            this.condominioSaldo.Name = "condominioSaldo";
            this.condominioSaldo.Size = new System.Drawing.Size(135, 23);
            this.condominioSaldo.TabIndex = 14;
            // 
            // condominioFim
            // 
            this.condominioFim.Enabled = false;
            this.condominioFim.Location = new System.Drawing.Point(427, 29);
            this.condominioFim.Name = "condominioFim";
            this.condominioFim.Size = new System.Drawing.Size(112, 23);
            this.condominioFim.TabIndex = 13;
            // 
            // condominioInicio
            // 
            this.condominioInicio.Enabled = false;
            this.condominioInicio.Location = new System.Drawing.Point(297, 30);
            this.condominioInicio.Name = "condominioInicio";
            this.condominioInicio.Size = new System.Drawing.Size(112, 23);
            this.condominioInicio.TabIndex = 12;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(404, 81);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(53, 15);
            this.label8.TabIndex = 11;
            this.label8.Text = "Saldo (€)";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(427, 6);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(77, 15);
            this.label7.TabIndex = 10;
            this.label7.Text = "Fim Exercício";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(297, 6);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(86, 15);
            this.label6.TabIndex = 9;
            this.label6.Text = "Início Exercício";
            // 
            // condominioNome
            // 
            this.condominioNome.Enabled = false;
            this.condominioNome.Location = new System.Drawing.Point(0, 105);
            this.condominioNome.Name = "condominioNome";
            this.condominioNome.Size = new System.Drawing.Size(383, 23);
            this.condominioNome.TabIndex = 8;
            // 
            // condominioEstado
            // 
            this.condominioEstado.Enabled = false;
            this.condominioEstado.Location = new System.Drawing.Point(213, 30);
            this.condominioEstado.Name = "condominioEstado";
            this.condominioEstado.Size = new System.Drawing.Size(67, 23);
            this.condominioEstado.TabIndex = 7;
            // 
            // condominioNumRegistro
            // 
            this.condominioNumRegistro.Enabled = false;
            this.condominioNumRegistro.Location = new System.Drawing.Point(141, 30);
            this.condominioNumRegistro.Name = "condominioNumRegistro";
            this.condominioNumRegistro.Size = new System.Drawing.Size(55, 23);
            this.condominioNumRegistro.TabIndex = 6;
            // 
            // condominioNumContribuinte
            // 
            this.condominioNumContribuinte.Enabled = false;
            this.condominioNumContribuinte.Location = new System.Drawing.Point(0, 30);
            this.condominioNumContribuinte.Name = "condominioNumContribuinte";
            this.condominioNumContribuinte.Size = new System.Drawing.Size(121, 23);
            this.condominioNumContribuinte.TabIndex = 5;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(213, 6);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(42, 15);
            this.label5.TabIndex = 4;
            this.label5.Text = "Estado";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(0, 158);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(56, 15);
            this.label4.TabIndex = 3;
            this.label4.Text = "Endereço";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(0, 81);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(40, 15);
            this.label3.TabIndex = 2;
            this.label3.Text = "Nome";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(141, 6);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(18, 15);
            this.label2.TabIndex = 1;
            this.label2.Text = "ID";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(0, 6);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(121, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "Número Contribuinte";
            // 
            // removeButton
            // 
            this.removeButton.Location = new System.Drawing.Point(583, 359);
            this.removeButton.Name = "removeButton";
            this.removeButton.Size = new System.Drawing.Size(75, 23);
            this.removeButton.TabIndex = 20;
            this.removeButton.Text = "Remover";
            this.removeButton.UseVisualStyleBackColor = true;
            this.removeButton.Visible = false;
            this.removeButton.Click += new System.EventHandler(this.removeButton_Click);
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
            // attListBox
            // 
            this.attListBox.FormattingEnabled = true;
            this.attListBox.ItemHeight = 15;
            this.attListBox.Location = new System.Drawing.Point(211, 33);
            this.attListBox.Name = "attListBox";
            this.attListBox.Size = new System.Drawing.Size(121, 349);
            this.attListBox.TabIndex = 12;
            this.attListBox.Visible = false;
            this.attListBox.SelectedIndexChanged += new System.EventHandler(this.attListBox_SelectedIndexChanged);
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
            // fracaoPainel
            // 
            this.fracaoPainel.Controls.Add(this.fracaoEndereco);
            this.fracaoPainel.Controls.Add(this.fracaoEnderecoText);
            this.fracaoPainel.Controls.Add(this.fracaoArea);
            this.fracaoPainel.Controls.Add(this.fracaoAreaText);
            this.fracaoPainel.Controls.Add(this.fracaoIdentificador);
            this.fracaoPainel.Controls.Add(this.fracaoIdentificadorText);
            this.fracaoPainel.Location = new System.Drawing.Point(338, 3);
            this.fracaoPainel.Name = "fracaoPainel";
            this.fracaoPainel.Size = new System.Drawing.Size(427, 350);
            this.fracaoPainel.TabIndex = 21;
            this.fracaoPainel.Visible = false;
            // 
            // fracaoEndereco
            // 
            this.fracaoEndereco.Enabled = false;
            this.fracaoEndereco.Location = new System.Drawing.Point(21, 141);
            this.fracaoEndereco.Multiline = true;
            this.fracaoEndereco.Name = "fracaoEndereco";
            this.fracaoEndereco.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.fracaoEndereco.Size = new System.Drawing.Size(322, 183);
            this.fracaoEndereco.TabIndex = 25;
            // 
            // fracaoEnderecoText
            // 
            this.fracaoEnderecoText.AutoSize = true;
            this.fracaoEnderecoText.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.fracaoEnderecoText.Location = new System.Drawing.Point(21, 105);
            this.fracaoEnderecoText.Name = "fracaoEnderecoText";
            this.fracaoEnderecoText.Size = new System.Drawing.Size(74, 21);
            this.fracaoEnderecoText.TabIndex = 24;
            this.fracaoEnderecoText.Text = "Endereço";
            // 
            // fracaoArea
            // 
            this.fracaoArea.Enabled = false;
            this.fracaoArea.Location = new System.Drawing.Point(162, 59);
            this.fracaoArea.Name = "fracaoArea";
            this.fracaoArea.Size = new System.Drawing.Size(76, 23);
            this.fracaoArea.TabIndex = 23;
            // 
            // fracaoAreaText
            // 
            this.fracaoAreaText.AutoSize = true;
            this.fracaoAreaText.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.fracaoAreaText.Location = new System.Drawing.Point(162, 30);
            this.fracaoAreaText.Name = "fracaoAreaText";
            this.fracaoAreaText.Size = new System.Drawing.Size(76, 21);
            this.fracaoAreaText.TabIndex = 22;
            this.fracaoAreaText.Text = "Area (m²)";
            // 
            // fracaoIdentificador
            // 
            this.fracaoIdentificador.Enabled = false;
            this.fracaoIdentificador.Location = new System.Drawing.Point(21, 59);
            this.fracaoIdentificador.Name = "fracaoIdentificador";
            this.fracaoIdentificador.Size = new System.Drawing.Size(100, 23);
            this.fracaoIdentificador.TabIndex = 20;
            // 
            // fracaoIdentificadorText
            // 
            this.fracaoIdentificadorText.AutoSize = true;
            this.fracaoIdentificadorText.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.fracaoIdentificadorText.Location = new System.Drawing.Point(21, 30);
            this.fracaoIdentificadorText.Name = "fracaoIdentificadorText";
            this.fracaoIdentificadorText.Size = new System.Drawing.Size(97, 21);
            this.fracaoIdentificadorText.TabIndex = 21;
            this.fracaoIdentificadorText.Text = "Identificador";
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
            // cancelButton
            // 
            this.cancelButton.Location = new System.Drawing.Point(583, 359);
            this.cancelButton.Name = "cancelButton";
            this.cancelButton.Size = new System.Drawing.Size(75, 23);
            this.cancelButton.TabIndex = 29;
            this.cancelButton.Text = "Cancelar";
            this.cancelButton.UseVisualStyleBackColor = true;
            this.cancelButton.Visible = false;
            this.cancelButton.Click += new System.EventHandler(this.cancelButton_Click);
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
            this.condominioPainel.ResumeLayout(false);
            this.condominioPainel.PerformLayout();
            this.fracaoPainel.ResumeLayout(false);
            this.fracaoPainel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl viewAdd;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.ListBox condominioListBox;
        private System.Windows.Forms.ComboBox attDropdown;
        private System.Windows.Forms.ListBox attListBox;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button removeButton;
        private System.Windows.Forms.Panel fracaoPainel;
        private System.Windows.Forms.TextBox fracaoEndereco;
        private System.Windows.Forms.Label fracaoEnderecoText;
        private System.Windows.Forms.TextBox fracaoArea;
        private System.Windows.Forms.Label fracaoAreaText;
        private System.Windows.Forms.TextBox fracaoIdentificador;
        private System.Windows.Forms.Label fracaoIdentificadorText;
        private System.Windows.Forms.Panel condominioPainel;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox condominioEstado;
        private System.Windows.Forms.TextBox condominioNumRegistro;
        private System.Windows.Forms.TextBox condominioNumContribuinte;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox condominioNome;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox condominioSaldo;
        private System.Windows.Forms.TextBox condominioFim;
        private System.Windows.Forms.TextBox condominioInicio;
        private System.Windows.Forms.TextBox condominioEndereco;
        private System.Windows.Forms.Button editButton;
        private System.Windows.Forms.Button saveButton;
        private System.Windows.Forms.Button cancelButton;
    }
}

