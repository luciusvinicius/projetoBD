using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using ProjetoClasse;
using System.Diagnostics;

namespace ProjetoAppV2
{
    public partial class Form1 : Form
    {
        private SqlConnection cn;
        private int currentCondominio;
        private String currentAtt;
        public Form1()
        {
            InitializeComponent();
            Console.WriteLine("print qualquer");

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            //loadCustomersToolStripMenuItem_Click(sender, e);
            Debug.WriteLine("sussssss");
            loadCondominios(sender, e);
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("data source= (LocalDb)\\MSSQLLocalDB;integrated security=true;initial catalog=ProjetoCondominio");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void loadCondominios(object sender, EventArgs e) {
            if (!verifySGBDConnection()) return;

            SqlCommand cmd = new SqlCommand("SELECT * FROM gestaoCondominio.condominio", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            condominioListBox.Items.Clear();

            while (reader.Read())
            {
                Condominio C = new Condominio();
                C.Nome = reader["nome"].ToString();
                C.NumContribuinte = reader["numContribuinte"].ToString();
                C.NumRegistro = reader["numRegistro"].ToString();
                C.InicioExercicio = reader["inicioExercicio"].ToString();
                C.FimExercicio = reader["fimExercicio"].ToString();
                C.Estado = reader["estado"].ToString();
                C.Saldo = reader["saldo"].ToString();
                C.Endereco = reader["endereço"].ToString();
                Debug.WriteLine(C.Nome);
                condominioListBox.Items.Add(C);
            }
            reader.Close();

        }



        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void condominioListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            attDropdown.Items.Clear();
            attListBox.Items.Clear();
            hideParameters();
            if (condominioListBox.SelectedIndex >= 0)
            {
                currentCondominio = condominioListBox.SelectedIndex;
                ShowCondominio();
            }

            attDropdown.SelectedIndex = 0;

        }

        private void hideParameters() {
            removeButton.Hide();
            editButton.Hide();
            //fracaoArea.Visible = false;
            //fracaoAreaText.Visible = false;
            //fracaoEndereco.Visible = false;
            //fracaoEnderecoText.Visible = false;
            //fracaoIdentificador.Visible = false;
            //fracaoIdentificadorText.Visible = false;
            fracaoPainel.Hide();
            condominioPainel.Hide();
        }

        private void ShowCondominio()
        {
            if (condominioListBox.Items.Count == 0 | currentCondominio < 0) {
                return;
            }
                
            Condominio condominio = (Condominio)condominioListBox.Items[currentCondominio];

            attDropdown.Items.Add("Condomínio");
            attDropdown.Items.Add("Fração");
            attDropdown.Items.Add("Pessoas");
            
            condominioNome.Text = condominio.Nome;
            condominioEndereco.Text = condominio.Endereco;
            condominioEstado.Text = condominio.Estado;
            condominioInicio.Text = condominio.InicioExercicio;
            condominioFim.Text = condominio.FimExercicio;
            condominioNumContribuinte.Text = condominio.NumContribuinte;
            condominioNumRegistro.Text = condominio.NumRegistro;
            condominioSaldo.Text = condominio.Saldo;

        }

        private void attDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            String selection = (String) attDropdown.SelectedItem;

            // esconder todas as caixas de texto, para então mostrar a correta
            hideParameters();
            attListBox.Items.Clear();
            Condominio condominio = (Condominio) condominioListBox.SelectedItem;
            String numContribuinte = condominio.NumContribuinte;
            attListBox.Visible = true;
            switch (selection)
            {
                case "Condomínio":
                    condominioPainel.Show();
                    removeButton.Show();
                    editButton.Show();
                    attListBox.Visible = false;
                    currentAtt = "Condomínio";
                    break;
                case "Fração":
                    ShowFracoes(numContribuinte);
                    currentAtt = "Fração";
                    break;
                default:
                    break;
            }
        }

        private void ShowFracoes(String numContribuinte) {
            if (!verifySGBDConnection()) return;

            String query =
                "SELECT identificador, area, localizacao FROM " +
                "gestaoCondominio.condominio AS C JOIN gestaoCondominio.fracao AS F " +
                "ON C.numContribuinte = F.FK_Condominio " +
                "AND C.numContribuinte = " + numContribuinte;
            Debug.WriteLine(query);

            SqlCommand cmd = new SqlCommand(query, cn);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Fracao F = new Fracao();
                F.Identificador = reader["identificador"].ToString();
                F.Area = reader["area"].ToString();
                F.Localizacao = reader["localizacao"].ToString();
                Debug.WriteLine(F.Identificador);
                attListBox.Items.Add(F);
            }

            reader.Close();

        }

        private void attListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
        
            removeButton.Show();
            editButton.Show();
            switch (currentAtt) {
                case "Fração":
                    Fracao F = (Fracao) attListBox.SelectedItem;
                    showFracao(F);
                    break;
                default:
                    break;
              }
        }

        private void showFracao(Fracao F) {
            fracaoPainel.Show();
            //fracaoArea.Visible = true;
            //fracaoAreaText.Visible = true;
            //fracaoEndereco.Visible = true;
            //fracaoEnderecoText.Visible = true;
            //fracaoIdentificador.Visible = true;
            //fracaoIdentificadorText.Visible = true;
            fracaoIdentificador.Text = F.Identificador;
            fracaoArea.Text = F.Area;
            fracaoEndereco.Text = F.Localizacao;
        }

        private void removeButton_Click(object sender, EventArgs e)
        {
            String message = "Tem certeza que deseja apagar da base de dados? (Não poderá refazer)";
            String title = "Remover";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons);

            if (result == DialogResult.Yes)
            {
                Debug.WriteLine("Apagado >:(");
            }
 
        }

        private void editButton_Click(object sender, EventArgs e)
        {
            attDropdown.Enabled = false;
            condominioListBox.Enabled = false;
            attListBox.Enabled = false;
            removeButton.Hide();
            editButton.Hide();
            saveButton.Show();
            switch (currentAtt) {
                case "Condomínio":
                    editCondominio(true);
                    break;
                default:
                    break;
            }
        }

        private void saveButton_Click(object sender, EventArgs e)
        {
            String message = "Tem certeza que deseja atualizar?";
            String title = "Salvar";
            MessageBoxButtons buttons = MessageBoxButtons.YesNoCancel;
            DialogResult result = MessageBox.Show(message, title, buttons);

            if (result == DialogResult.Yes)
            {
                Debug.WriteLine("Salvo :)");

            }
            else if (result == DialogResult.No) {
                // Alterar os inputs para o valor original do condominio
                ShowCondominio();
            }
            if (result == DialogResult.Yes || result == DialogResult.No) {
                attDropdown.Enabled = true;
                condominioListBox.Enabled = true;
                attListBox.Enabled = true;
                removeButton.Show();
                editButton.Show();
                saveButton.Hide();
                switch (currentAtt)
                {
                    case "Condomínio":
                        editCondominio(false);
                        break;
                    default:
                        break;
                }
            }
        }
        private void editCondominio(bool value) {
            condominioEndereco.Enabled = value;
            condominioEstado.Enabled = value;
            condominioFim.Enabled = value;
            condominioInicio.Enabled = value;
            condominioNome.Enabled = value;
            condominioNumContribuinte.Enabled = value;
            condominioNumRegistro.Enabled = value;
            condominioSaldo.Enabled = value;
        }


    }
}
