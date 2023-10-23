<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Library_System.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Username:</td>
            <td><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Password:</td>
            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button id="btnlogin" runat="server" Text="Login" OnClick="btnlogin_Click"/></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:LinkButton ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click"></asp:LinkButton></td>
                </tr>
    </table>
</asp:Content>
