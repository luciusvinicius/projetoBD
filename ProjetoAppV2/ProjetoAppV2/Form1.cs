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
            loadCondominios(sender, e, "");
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

        private void loadCondominios(object sender, EventArgs e, String filter) {
            condominioListBox.Items.Clear();
            if (!verifySGBDConnection()) return;

            String query;

            if (filter.Equals(""))
                query = "SELECT * FROM gestaoCondominio.condominio " +
                    "ORDER BY nome";
            else
                query = "SELECT * FROM gestaoCondominio.condominio " +
                    "WHERE nome LIKE '%" + filter + "%' " +
                    "ORDER BY nome";

            SqlCommand cmd = new SqlCommand(query, cn);
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
            attSearch.Hide();
            //fracaoArea.Visible = false;
            //fracaoAreaText.Visible = false;
            //fracaoEndereco.Visible = false;
            //fracaoEnderecoText.Visible = false;
            //fracaoIdentificador.Visible = false;
            //fracaoIdentificadorText.Visible = false;
            fracaoPainel.Hide();
            condominioPainel.Hide();
            secAttListBox.Hide();
            secAttDropdown.Hide();
            secAttSearch.Hide();
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
            attSearch.Show();

            attListBox.Items.Clear();
            Condominio condominio = (Condominio) condominioListBox.SelectedItem;
            String numContribuinte = condominio.NumContribuinte;
            attListBox.Visible = true;
            attSearch.Text = "";

            switch (selection)
            {
                case "Condomínio":
                    condominioPainel.Show();
                    removeButton.Show();
                    editButton.Show();
                    attSearch.Hide();
                    attListBox.Visible = false;
                    currentAtt = "Condomínio";
                    break;
                case "Fração":
                    ShowFracoes(numContribuinte, "");
                    currentAtt = "Fração";
                    break;
                default:
                    break;
            }
        }

        private void ShowFracoes(String numContribuinte, String filter) {
            if (!verifySGBDConnection()) return;

            String query =
                "SELECT identificador, area, localizacao FROM " +
                "gestaoCondominio.condominio AS C JOIN gestaoCondominio.fracao AS F " +
                "ON C.numContribuinte = F.FK_Condominio " +
                "AND C.numContribuinte = " + numContribuinte;
            if (!filter.Equals(""))
                query += " WHERE identificador like '%" + filter + "%'";

            SqlCommand cmd = new SqlCommand(query, cn);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Fracao F = new Fracao();
                F.Identificador = reader["identificador"].ToString();
                F.Area = reader["area"].ToString();
                F.Localizacao = reader["localizacao"].ToString();
                attListBox.Items.Add(F);
            }

            reader.Close();

        }

        private void attListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            secAttDropdown.Items.Clear();
            secAttListBox.Items.Clear();
            removeButton.Show();
            editButton.Show();
            switch (currentAtt) {
                case "Fração":
                    secAttDropdown.Show();
                    secAttDropdown.Items.Add("Fração");
                    secAttDropdown.Items.Add("Proprietários Pessoas");
                    secAttDropdown.Items.Add("Proprietários Empresa");
                    secAttDropdown.Items.Add("Condominos Pessoas");
                    secAttDropdown.Items.Add("Condominos Empresa");
                    secAttDropdown.SelectedIndex = 0;
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
            cancelButton.Show();
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
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons);

            if (result == DialogResult.Yes)
            {
                Debug.WriteLine("Salvo :)");
                attDropdown.Enabled = true;
                condominioListBox.Enabled = true;
                attListBox.Enabled = true;
                removeButton.Show();
                editButton.Show();
                saveButton.Hide();
                cancelButton.Hide();
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


        private void cancelButton_Click(object sender, EventArgs e)
        {
            attDropdown.Items.Clear();
            ShowCondominio();
            attDropdown.Enabled = true;
            condominioListBox.Enabled = true;
            attListBox.Enabled = true;
            removeButton.Show();
            editButton.Show();
            saveButton.Hide();
            cancelButton.Hide();
            switch (currentAtt)
            {
                case "Condomínio":
                    editCondominio(false);
                    break;
                default:
                    break;
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

        private void condominioSearch_TextChanged(object sender, EventArgs e)
        {
            loadCondominios(sender, e, condominioSearch.Text);
        }

        private void attSearch_TextChanged(object sender, EventArgs e)
        {
            attListBox.Items.Clear();
            switch (currentAtt) {
                case "Fração":
                    Condominio condominio = (Condominio)condominioListBox.SelectedItem;
                    String numContribuinte = condominio.NumContribuinte;
                    ShowFracoes(numContribuinte, attSearch.Text);
                    break;

                default:
                    break;
            }
        }

        private void showProprietariosPessoas(String condominio, String fracao, String filter, bool isSub)
        {
            if (!verifySGBDConnection()) return;

            String query = "SELECT c.nome AS condominio, e.nome AS pessoa, " +
                "pes.genero, f.identificador " +
                "FROM gestaoCondominio.condominio AS c " +
                "JOIN gestaoCondominio.fracao AS f " +
                "ON c.numContribuinte = " + condominio + " " +
                "AND f.FK_Condominio = c.numContribuinte " +
                "JOIN gestaoCondominio.proprietario AS p " +
                "ON p.FK_Fracao = f.identificador " +
                "AND p.FK_Condominio = f.FK_Condominio ";

            if (!fracao.Equals(""))
                query += "AND f.identificador = '"+fracao+"' ";

            query += "JOIN gestaoCondominio.entidade AS e " +
                "ON p.FK_Entidade = e.identificador " +
                "JOIN gestaoCondominio.pessoa AS pes " +
                "ON pes.identificador = e.identificador";

            if (!filter.Equals(""))
                query += " WHERE e.nome like '%" + filter + "%'";
            Debug.WriteLine(query);

            SqlCommand cmd = new SqlCommand(query, cn);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Debug.WriteLine(reader["condominio"]);
                Debug.WriteLine(reader["pessoa"]);
                //Fracao F = new Fracao();
                //F.Identificador = reader["identificador"].ToString();
                //F.Area = reader["area"].ToString();
                //F.Localizacao = reader["localizacao"].ToString();
                //Debug.WriteLine(F.Identificador);
                if (isSub) {
                    // se deve alterar a listbox interna ou externa
                 }
                else { }
                //attListBox.Items.Add(F);
            }

            reader.Close();

        }

        private void secAttDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            Condominio c = (Condominio)condominioListBox.SelectedItem;
            switch (currentAtt)
            {
                case "Fração":
                    secAttListBox.Show();
                    secAttSearch.Show();
                    Fracao f = (Fracao)attListBox.SelectedItem;
                    switch (secAttDropdown.SelectedItem) {
                        case "Fração":
                            secAttListBox.Hide();
                            break;
                        case "Proprietários Pessoas":
                            Debug.WriteLine("amogus");
                            showProprietariosPessoas(c.NumContribuinte, f.Identificador, secAttSearch.Text, true);
                            break;

                        default:
                            break;
                    }
                    break;

                default:
                    break;
            }
        }
    }
}
