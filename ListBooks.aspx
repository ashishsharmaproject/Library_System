<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ListBooks.aspx.cs" Inherits="Library_System.ListBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td style="width:1500px">
                <asp:GridView ID="gvBookReport" runat="server" AutoGenerateColumns="false" OnRowCommand="gvBookReport_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Book Cover">
                            <ItemTemplate>
                                <asp:Image id="bookImg" runat="server" Width="100px" ImageUrl='<%#Eval("booksImg","~/BooksIMG/{0}") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Book Name">
                            <ItemTemplate>
                                <%#Eval("books") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Book Descriptin">
                            <ItemTemplate>
                                <%#Eval("booksDes") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Writer">
                            <ItemTemplate>
                                <%#Eval("author") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="A" CommandArgument=<%#Eval("bid") %>></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="B" CommandArgument=<%#Eval("bid") %>></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td><asp:LinkButton ID="btnHomePageBack" runat="server" Text="< Back to Home Page" OnClick="btnHomePageBack_Click"></asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>
