using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_User_Product
{
    public partial class RemoverProd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CapturaID())
            {
                DadosConsulta();
            }
        }
        private bool CapturaID()
        {
            return Request.QueryString.AllKeys.Contains("id");
        }
        private void DadosConsulta()
        {
            int IDProduto = ObterIDProduto();
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select * from produto
                                    where id_prod = @IDProduto";

                cmd.Parameters.AddWithValue("@IDProduto", IDProduto);

                Conexao.Conectar();

                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    txtID.Text = reader["id_prod"].ToString();
                    txtNome.Text = reader["nom_prod"].ToString();
                    txtQuantidade.Text = reader["qtd_prod"].ToString();
                    txtPreco.Text = reader["prec_prod"].ToString();
                    //txtImagem.Text = reader["img_prod"].ToString();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                Conexao.Desconectar();
            }
        }
        private int ObterIDProduto()
        {
            int id = 0;
            var idURL = Request.QueryString["id"];
            if (!int.TryParse(idURL, out id))
            {
                throw new Exception("ID Inválido");
            }
            if (id <= 0)
            {
                throw new Exception("ID Inválido");
            }
            return id;
        }
        protected void btnRemover_Click(object sender, EventArgs e)
        {
            int IDProduto = ObterIDProduto();
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"delete from produto
                                    where id_prod = @IDProduto";

                cmd.Parameters.AddWithValue("@IDProduto", IDProduto);

                Conexao.Conectar();
                cmd.ExecuteNonQuery();

                Response.Redirect("listar.aspx");
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                Conexao.Desconectar();
            }
        }
        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listar.aspx");
        }
       
    }
}