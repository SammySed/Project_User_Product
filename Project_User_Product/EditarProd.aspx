<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditarProd.aspx.cs" Inherits="Project_User_Product.EditarPro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link  rel="shortcut icon" href="img/icon (1).ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="text-center text-primary">
        <h2>Editar Dados do Produto</h2>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-md-2">
            <label>ID:</label>
            <asp:TextBox ID="txtID" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
        </div>
        <div class="col-md-10">
            <label>Nome:</label>
            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-md-7">
            <label>Quantidade:</label>
            <asp:TextBox ID="txtQuantidade" runat="server" CssClass="form-control"></asp:TextBox>            
        </div>
        <div class="col-md-5">
            <label>Preço:</label>
            <asp:TextBox ID="txtPreco" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
       <%-- <div class="col-md-3">
            <label>Imagem:</label>            
            <asp:TextBox ID="txtImagem" runat="server" CssClass="form-control"></asp:TextBox>
        </div>--%>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="text-right col-md-12">
            <asp:Button ID="btnVoltar" CssClass="btn btn-info" runat="server" Text="Voltar" OnClick="btnVoltar_Click" />
            <asp:Button ID="btnAlterar" CssClass="btn btn-warning" runat="server" Text="Alterar" OnClick="btnAlterar_Click" />
        </div>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="text-rigth col-md-12">            
            <asp:Label ID="lblResultado" CssClass="text-sucess" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
