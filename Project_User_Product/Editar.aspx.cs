using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_User_Product
{
    public partial class Editar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (CapturaID())
                {
                    DadosConsulta();
                }
            }
        }
        private bool CapturaID()
        {
            return Request.QueryString.AllKeys.Contains("id");
        }
        private void DadosConsulta()
        {


            //Bcrypt
            //var senhaEncriptada = BCrypt.Net.BCrypt.HashPassword(txtSenha.Text);
           
            int IDUsuario = ObterIDUsuario();
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select * from usuario
                                    where id_us = @IDUsuario";

                cmd.Parameters.AddWithValue("@IDUsuario", IDUsuario);

                Conexao.Conectar();

                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    txtID.Text = reader["id_us"].ToString();
                    txtNome.Text = reader["nome_us"].ToString();
                    txtLogin.Text = reader["login_us"].ToString();
                    //txtSenha.Text = reader["senha_us"].ToString();
                    ddlNivel.Text = reader["nivel_us"].ToString();

                }
            }
            catch (Exception ex)
            {
                //throw ;
                lblResultado.Text = $"Erro: {ex.Message}";
            }
            finally
            {
                Conexao.Desconectar();
            }
        }
        private int ObterIDUsuario()
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
        protected void btnAterar_Click(object sender, EventArgs e)
        {
            //Bcrypt

            var senhaEncriptada = BCrypt.Net.BCrypt.HashPassword(txtSenha.Text);

            MySqlCommand cmd = new MySqlCommand();
            try
            {
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"update usuario
                                    set nome_us = @nome,
                                    login_us    = @login,
                                    senha_us    = @senha,
                                    nivel_us    = @nivel
                                    where id_us = @id";
                cmd.Parameters.AddWithValue("@id", txtID.Text);
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
                lblResultado.Text = $"Error: {ex.Message}";
            }
            finally
            {
                Conexao.Desconectar();
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Listar.aspx");
        }
    }
}