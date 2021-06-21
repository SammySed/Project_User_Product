using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_User_Product
{
    public partial class AdicionarProd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            MySqlCommand cmd = new MySqlCommand();
            try
            {
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"insert into produto
                                    (nom_prod, qtd_prod, prec_prod)
                                    values
                                    (@nom_prod, @qtd_prod, @prec_prod)";

                cmd.Parameters.AddWithValue("@nom_prod", txtNome.Text);
                cmd.Parameters.AddWithValue("@qtd_prod", txtQtd.Text);
                cmd.Parameters.AddWithValue("@prec_prod", txtPreco.Text);



                Conexao.Conectar();
                cmd.ExecuteNonQuery();
                Response.Redirect("Listar.aspx");
            }
            catch (Exception ex)
            {
                lblResultado.Text = $"Erro: {ex.Message}";
            }
            finally
            {
                Conexao.Desconectar();
            }
        }
    }
}