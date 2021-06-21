<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Editar.aspx.cs" Inherits="Project_User_Product.Editar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link  rel="shortcut icon" href="img/icon (1).ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="cold-md-12">
        <div class="text-center text-black">
             <h2>Editar Usuário</h2>
        </div>
    </div>

    <div class="row" style="margin-top:15px">
         <div class="col-md-4">
            <label>ID:</label>
            <asp:TextBox ID="txtID" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>        
             </div>
        <div class="col-md-8">
            <label>Nome:</label>           
            <asp:TextBox ID="txtNome" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <div class="row" style="margin-top:15px">
        <div class="col-md-7">
            <label>Login:</label>           
            <asp:TextBox ID="txtLogin" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <label>Senha:</label>            
            <asp:TextBox ID="txtSenha" TextMode="Password" runat="server" MaxLength="8" 
                CssClass="form-control"></asp:TextBox>
        </div>


        <div class="col-md-3">
            <label>Nível:</label>            
            <asp:DropDownList ID="ddlNivel" runat="server" CssClass="form-control">
                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                <asp:ListItem Value="A">Administrador</asp:ListItem>
                <asp:ListItem Value="O">Operador</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>


    <div class="row" style="margin-top:15px">
        <div class="col-md-12 text-right">
            <asp:Button ID="btnVoltar" class="btn btn-dark" runat="server" Text="Voltar" OnClick="btnVoltar_Click" />
             <asp:Button ID="btnAterar" class="btn btn-warning" runat="server" Text="Alterar" OnClick="btnAterar_Click"/>
        </div>
    </div> 

    <div class="row" style="margin-top:15px">
        <div class="col-md-12 text-right">
            <asp:Label ID="lblResultado" CssClass="text-danger" runat="server"></asp:Label>
        </div>

    </div>

</asp:Content>

