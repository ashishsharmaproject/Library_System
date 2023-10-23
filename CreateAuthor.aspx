<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CreateAuthor.aspx.cs" Inherits="Library_System.CreateAuthor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Author Name:</td>
            <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Profile Picture:</td>
            <td><asp:FileUpload id="txtAuthorimg" runat="server"/></td>
        </tr>

        <tr>
            <td>Author Bio:</td>
            <td><asp:TextBox ID="txtAuthorBio" runat="server" Width="400px" Height="200px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button id="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"/></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Label ID="lblMgs" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
