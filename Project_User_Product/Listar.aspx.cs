using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_User_Product
{
    public partial class Listar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string nivel = Session["Perfil"].ToString();

            if (nivel == "O")
            {
                btnAdicionar.Visible = false;
                btnAdcionarProd.Visible = false;
            }

            CarregarUsuarios();
            CarregarProduto();
        }
        private void CarregarProduto()
        {
            string query = @"select id_prod, nom_prod, qtd_prod, prec_prod from produto";
            DataTable dt = new DataTable();
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                da.Fill(dt);

                rptProduto.DataSource = dt;
                rptProduto.DataBind();
            }
            catch (Exception ex)
            {
                lblMsg.Text = $"Erro: {ex.Message}";
            }
            finally
            {

            }
        }

        private void CarregarUsuarios()
        {
            string query = @"select id_us, nome_us, nivel_us from usuario";
            DataTable dt = new DataTable();
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                MySqlDataAdapter da = new MySqlDataAdapter(query, Conexao.Connection);
                da.Fill(dt);

                rptUsuarios.DataSource = dt;
                rptUsuarios.DataBind();
            }
            catch (Exception ex)
            {
                lblMsg.Text = $"Erro: {ex.Message}";
            }
            finally
            {

            }
        }
        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adicionar.aspx");
        }
        protected void rptUsuarios_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string nivel = Session["Perfil"].ToString();

            var lnkEditar = (LinkButton)e.Item.FindControl("lnkEditar");
            var lnkRemover = (LinkButton)e.Item.FindControl("lnkRemover");

            if (lnkEditar != null && lnkRemover != null && nivel == "O")
            {
                lnkEditar.Visible = false;
                lnkRemover.Visible = false;
            }
        }
        protected void rptProduto_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string nivel = Session["Perfil"].ToString();

            var lnkEditarProd = (LinkButton)e.Item.FindControl("lnkEditarProd");
            var lnkRemoverProd = (LinkButton)e.Item.FindControl("lnkRemoverProd");

            if (lnkEditarProd != null && lnkRemoverProd != null && nivel == "O")
            {
                lnkEditarProd.Visible = false;
                lnkRemoverProd.Visible = false;
            }
        }

        protected void btnAdcionarProd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdicionarProd.aspx");
        }
    }
}