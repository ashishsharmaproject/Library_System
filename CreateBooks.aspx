<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CreateBooks.aspx.cs" Inherits="Library_System.CreateBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Author Name:</td>
            <td><asp:DropDownList ID="txtauthor" runat="server"></asp:DropDownList></td>
        </tr>

        <tr>
            <td>Book Name:</td>
            <td><asp:TextBox ID="txtbookname" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Book Description:</td>
            <td><asp:TextBox ID="txtbookDescription" Width="400px" Height="200px" TextMode="MultiLine" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Book Image:</td>
            <td><asp:FileUpload id="txtbookimg" runat="server"/></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button id="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"/></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
