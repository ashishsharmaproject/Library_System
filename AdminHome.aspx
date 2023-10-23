<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Library_System.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td><asp:Button id="btnCreateAuthor" runat="server" Width="100px" Height="30px" Text="Create Author" OnClick="btnCreateAuthor_Click"/></td>
        </tr>

         <tr>
            <td><asp:Button id="btnViewAuthors" runat="server" Width="100px" Height="30px" Text="View Author" OnClick="btnViewAuthors_Click"/></td>
        </tr>

         <tr>
            <td><asp:Button id="btnCreateBook" runat="server" Width="100px" Height="30px" Text="Create Book" OnClick="btnCreateBook_Click"/></td>
        </tr>

         <tr>
            <td><asp:Button id="btnViewBookList" runat="server" Width="100px" Height="30px" Text="View Book List" OnClick="btnViewBookList_Click"/></td>
        </tr>
    </table>
</asp:Content>
