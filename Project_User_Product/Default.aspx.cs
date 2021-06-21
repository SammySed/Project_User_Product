using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_User_Product
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAcessar_Click(object sender, EventArgs e)
        {
            MySqlCommand cmd = new MySqlCommand();
            try
            {
                string usuario = txtUsuario.Text;
                string senha = txtSenha.Text;

                //Recuperar senha do Usuário que está no BD
                cmd.Connection = Conexao.Connection;
                cmd.CommandText = @"select senha_us 
                                    from usuario
                                    where login_us = @usuario";

                cmd.Parameters.AddWithValue("@usuario", usuario);
                Conexao.Conectar();

                string senhaEncriptada = Convert.ToString(cmd.ExecuteScalar());

                if (string.IsNullOrEmpty(senhaEncriptada))
                {
                    throw new Exception("Usuário ou Senha Inválida");
                }

                if (BCrypt.Net.BCrypt.Verify(senha, senhaEncriptada))
                {                 

                    cmd.CommandText = @"select nome_us, nivel_us
                                        from usuario
                                        where login_us=@login";

                    cmd.Parameters.AddWithValue("@login", usuario);

                    var dr = cmd.ExecuteReader();

                    dr.Read();

                    string nome = dr.GetString("nome_us");
                    string nivel = dr.GetString("nivel_us");


                    //Fazer Redirecionamento
                    FormsAuthentication.RedirectFromLoginPage(nome, false);

                    //Dados da Sessão
                    Session["Perfil"] = nivel;
                    Session["Nome"] = nome;
                }
                else
                {
                    throw new Exception("Usuário ou Senha Inválida");
                }


            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
            finally
            {
                Conexao.Desconectar();
            }
        }
    }
}