<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Remover.aspx.cs" Inherits="Project_User_Product.Remover" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link  rel="shortcut icon" href="img/icon (1).ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="cold-md-12">
        <div class="text-center text-black">
             <h2>Remover Cliente</h2>
        </div>
     </div>

        <div class="row" style="margin-top:15px">
        <div class="col-md-12">
            <label>Nome:</label>            
            <asp:TextBox ID="txtNome" runat="server" MaxLength="50" CssClass="form-control" Enabled="false"></asp:TextBox>
        </div>
    </div>

    <div class="row" style="margin-top:15px">
        <div class="col-md-7">
            <label>Login:</label>            
            <asp:TextBox ID="txtLogin" runat="server" MaxLength="10" CssClass="form-control" Enabled="false"></asp:TextBox>
        </div>


        <div class="col-md-5">
            <label>Nível:</label>            
            <asp:DropDownList ID="ddlNivel" runat="server" CssClass="form-control" Enabled="false">
                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                <asp:ListItem Value="A">Administrador</asp:ListItem>
                <asp:ListItem Value="O">Operador</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>



    <div class="row" style="margin-top: 15px">
        <div class="text-right col-md-12">            
            <asp:Button ID="btnVoltar" CssClass="btn btn-info" runat="server" text="Voltar" OnClick="btnVoltar_Click"  />     
            <asp:Button ID="btnDeletar" class="btn btn-dark" runat="server" Text="Deletar" OnClick="btnDeletar_Click"  />
        </div>
    </div>

</asp:Content>

