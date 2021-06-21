using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_User_Product
{
    public partial class Adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            //Bcrypt
            var senhaEncriptada = BCrypt.Net.BCrypt.HashPassword(txtSenha.Text);

            MySqlCommand cmd = new MySqlCommand();
            try
            {
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"insert into usuario
                                    (nome_us, login_us, senha_us, nivel_us)
                                    values
                                    (@nome, @login, @senha, @nivel)";

                cmd.Parameters.AddWithValue("@nome", txtNome.Text);
                cmd.Parameters.AddWithValue("@login", txtLogin.Text);
                cmd.Parameters.AddWithValue("@senha", senhaEncriptada);
                cmd.Parameters.AddWithValue("@nivel", ddlNivel.Text);

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