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
            Debug.WriteLine(condominioListBox.SelectedIndex);
            attDropdown.Items.Clear();
            if (condominioListBox.SelectedIndex >= 0)
            {
                currentCondominio = condominioListBox.SelectedIndex;
                ShowCondominio();
            }

        }

        private void hideParameters() {
            fracaoArea.Visible = false;
            fracaoAreaText.Visible = false;
            fracaoEndereco.Visible = false;
            fracaoEnderecoText.Visible = false;
            fracaoIdentificador.Visible = false;
            fracaoIdentificadorText.Visible = false;
        }

        private void ShowCondominio()
        {
            if (condominioListBox.Items.Count == 0 | currentCondominio < 0) {
                return;
            }
                
            Condominio condominio = (Condominio)condominioListBox.Items[currentCondominio];
            //txtID.Text = contact.CustomerID;
            //txtCompany.Text = contact.CompanyName;
            //txtContact.Text = contact.ContactName;
            //txtAddress1.Text = contact.Address1;
            //txtCity.Text = contact.City;
            //txtState.Text = contact.State;
            //txtZIP.Text = contact.ZIP;
            //txtCountry.Text = contact.Country;
            //txtTel.Text = contact.tel;
            //txtFax.Text = contact.FAX;

            attDropdown.Items.Add("Fração");
            attDropdown.Items.Add("Pessoas");
        }

        private void attDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            String selection = (String) attDropdown.SelectedItem;

            // esconder todas as caixas de texto, para então mostrar a correta
            hideParameters();
            attListBox.Items.Clear();
            Condominio condominio = (Condominio) condominioListBox.SelectedItem;
            String numContribuinte = condominio.NumContribuinte;
            switch (selection)
            {
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

        }

        private void attListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            Debug.WriteLine("hm: "+attListBox.SelectedItem);
        }
    }
}
