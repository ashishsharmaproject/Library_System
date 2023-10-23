<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="Library_System.CreateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Name:</td>
            <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Email:</td>
            <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>User Name:</td>
            <td><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Enter Password:</td>
            <td><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Account Type:</td>
            <td><asp:DropDownList ID="txtaccountType" runat="server"></asp:DropDownList></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button id="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"/></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:LinkButton ID="btnLoginBack" runat="server" Text="< Back to Login" OnClick="btnLoginBack_Click"></asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>
