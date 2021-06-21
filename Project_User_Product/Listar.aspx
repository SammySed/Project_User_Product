<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Listar.aspx.cs" Inherits="Project_User_Product.Listar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />


    <script src="Scripts/jquery-3.0.0.js"></script>

    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.css"></script>

    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <link rel="shortcut icon" href="img/icon.ico" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="text-center text-primary">
            <h2>Listagem de usuários e Produtos</h2>
        </div>
        <br />
        <div class="text-left text-secondary">
            <h5>Usuários</h5>
        </div>

        <p>
            <asp:Repeater ID="rptUsuarios" runat="server" OnItemDataBound="rptUsuarios_ItemDataBound">
                <HeaderTemplate>
                    <table class="table table-hover" id="sisDataTable">
                        <thead>
                            <tr>
                                <td><strong>ID</strong></td>
                                <td><strong>Nome</strong></td>
                                <td><strong>Nível</strong></td>
                                <td><strong>Função</strong></td>
                            </tr>
                        </thead>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "id_us") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "nome_us") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "nivel_us") %>
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkDetalhes" runat="server">
                                <a href='<%# Eval("id_us", "detalhes.aspx?id={0}") %>'>
                                    <span class="fas fa-eye"></span>
                                </a>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkEditar" runat="server">
                                <a href='<%# Eval("id_us", "editar.aspx?id={0}") %>'>
                                    <span class="fas fa-pencil-alt"></span>
                                </a>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkRemover" runat="server">
                                <a href='<%# Eval("id_us", "remover.aspx?id={0}") %>'>
                                    <span class="fas fa-trash-alt"></span>
                                </a>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
               
                </FooterTemplate>
            </asp:Repeater>


        </p>
    </div>
    <div class="row" style="margin-top: 15px">
        <div class="col-md-12 text-right">
            <asp:Button ID="btnAdicionar" CssClass="btn btn-primary" runat="server" Text="Adicionar" OnClick="btnAdicionar_Click" />
        </div>
    </div>

    
   
        <div class="text-left text-secondary">
            <h5>Produtos</h5>
        </div>
    <p>
        <asp:Repeater ID="rptProduto" runat="server" OnItemDataBound="rptProduto_ItemDataBound">
            <HeaderTemplate>
                <table class="table table-hover" id="sisDataTableProd">
                    <thead>
                        <tr>
                            <td><strong>ID</strong></td>
                            <td><strong>Nome</strong></td>
                            <td><strong>Quantidade</strong></td>
                            <td><strong>Preço</strong></td>
                            <td><strong>Função</strong></td>
                        </tr>
                    </thead>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "id_prod") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "nom_prod") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "qtd_prod") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem, "prec_prod") %>
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkDetalhesProd" runat="server">
                                <a href='<%# Eval("id_prod", "detalhesProd.aspx?id={0}") %>'>
                                    <span class="fas fa-eye"></span>
                                </a>
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkEditarProd" runat="server">
                                <a href='<%# Eval("id_prod", "editarProd.aspx?id={0}") %>'>
                                    <span class="fas fa-pencil-alt"></span>
                                </a>
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkRemoverProd" runat="server">
                                <a href='<%# Eval("id_prod", "removerProd.aspx?id={0}") %>'>
                                    <span class="fas fa-trash-alt"></span>
                                </a>
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
               
            </FooterTemplate>
        </asp:Repeater>


    </p>
    <div class="row" style="margin-top: 15px">
        <div class="col-md-12 text-right">
            <asp:Button ID="btnAdcionarProd" CssClass="btn btn-primary" runat="server" Text="Adicionar" OnClick="btnAdcionarProd_Click" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:Label runat="server" Text="" ID="lblMsg"></asp:Label>
        </div>
    </div>

    <script>
        $('#sisDataTable').dataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.24/i18n/Portuguese-Brasil.json"
            }
        });
    </script>
    <script>
        $('#sisDataTableProd').dataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.24/i18n/Portuguese-Brasil.json"
            }
        });
    </script>


</asp:Content>


