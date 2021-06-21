<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdicionarProd.aspx.cs" Inherits="Project_User_Product.AdicionarProd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link  rel="shortcut icon" href="img/icon (1).ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="text-center text-primary">
        <h2>Cadastro de Produtos</h2>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-md-12">
            <label>Nome do Produto:</label>
            <asp:RequiredFieldValidator ID="rfvNome" ControlToValidate="txtNome"
                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtNome" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
        </div>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-md-7">
            <label>Quantidade do Produto:</label>
            <asp:RequiredFieldValidator ID="rfvQtd" ControlToValidate="txtQtd"
                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtQtd" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="col-md-5">
            <label>Preço do Produto:</label>
            <asp:RequiredFieldValidator ID="rfvPreco" ControlToValidate="txtPreco"
                ErrorMessage="*" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtPreco" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <%--<div class="row">
        <div class="col-md-6">
            <label>Imagem do Produto:</label>
            <asp:FileUpload ID="FileUploadControl" runat="server" class="multi" AllowMultiple="true" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload Imagem" OnClick="btnUpload_Click" />
        </div>
        <div class="col-md-6">
            <asp:Label ID="lblMessageError" runat="server"></asp:Label>
        </div>
    </div>--%>




    <div class="row" style="margin-top: 15px">
        <div class="col-md-12 text-right">
            <asp:Button ID="btnSalvar" CssClass="btn btn-primary" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
        </div>
    </div>

    <div class="row" style="margin-top: 15px">
        <div class="col-md-12 text-right">
            <asp:Label ID="lblResultado" CssClass="text-danger" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
