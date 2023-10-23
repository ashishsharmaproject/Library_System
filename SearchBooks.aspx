<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SearchBooks.aspx.cs" Inherits="Library_System.SearchBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <table>
       <tr>
           <td><asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Search By Author/Book Name" Width="200px"></asp:TextBox></td>
           <td><asp:Button id="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click1"/></td>
       </tr>
   </table>

    <p style="color:blue">'or'</p>
    
    <table>
        <tr>
           <td>Author:</td>
           <td><asp:DropDownList ID="txtAuthorList" runat="server" OnSelectedIndexChanged="txtAuthorList_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
       </tr>

       <tr>
           <td>Book:</td>
           <td><asp:DropDownList ID="txtBookList" runat="server"></asp:DropDownList></td>
       </tr>

        <tr>
            <td></td>
            <td><asp:Button id="btnSearchDD" runat="server" Text="Search" OnClick="btnSearchDD_Click"/></td>
        </tr>

       <tr>
           <td></td>
           <td> 
               <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
           </td>
       </tr>
   </table>
    <br />
    <table>
       <tr>
           <td><asp:GridView ID="gvSearchResult" runat="server" AutoGenerateColumns="false">
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

                   <asp:TemplateField HeaderText="Descriptin">
                       <ItemTemplate>
                           <%#Eval("booksDes") %>
                       </ItemTemplate>
                   </asp:TemplateField>

                   <asp:TemplateField HeaderText="Author">
                       <ItemTemplate>
                           <asp:Image id="bookImg" runat="server" Width="100px" ImageUrl='<%#Eval("authorImg","~/AuthorIMG/{0}") %>'/>
                       </ItemTemplate>
                   </asp:TemplateField>

                   <asp:TemplateField HeaderText="Author">
                       <ItemTemplate>
                           <%#Eval("author") %>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
               </asp:GridView></td>
       </tr>
   </table>
</asp:Content>
