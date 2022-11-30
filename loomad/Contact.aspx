<%@ Page Title="Loomade lisamine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="loomad.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Lisa loom</h3>
    <p> 
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="loomID" DataSourceID="loom" ForeColor="Black" GridLines="Vertical" Height="16px" Width="206px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:TemplateField HeaderText="loomID" InsertVisible="False" SortExpression="loomID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("loomID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("loomID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="loomanimi" HeaderText="loomanimi" SortExpression="loomanimi" />
                <asp:TemplateField HeaderText="sunniaeg" SortExpression="sunniaeg">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("sunniaeg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sunniaeg") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("sunniaeg") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="omanikID" SortExpression="omanikID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("omanikID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="omanik" DataTextField="nimi" DataValueField="omanikID" SelectedValue='<%# Bind("omanikID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="omanik" runat="server" ConnectionString="<%$ ConnectionStrings:lilled_tulusaConnectionString1 %>" SelectCommand="SELECT [nimi], [omanikID] FROM [omanik]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("omanikID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="loom" runat="server" ConnectionString="<%$ ConnectionStrings:lilled_tulusaConnectionString1 %>" DeleteCommand="DELETE FROM [loomad] WHERE [loomID] = @loomID" InsertCommand="INSERT INTO [loomad] ([loomanimi], [sunniaeg], [omanikID]) VALUES (@loomanimi, @sunniaeg, @omanikID)" SelectCommand="SELECT * FROM [loomad]" UpdateCommand="UPDATE [loomad] SET [loomanimi] = @loomanimi, [sunniaeg] = @sunniaeg, [omanikID] = @omanikID WHERE [loomID] = @loomID">
            <DeleteParameters>
                <asp:Parameter Name="loomID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="loomanimi" Type="String" />
                <asp:Parameter DbType="Date" Name="sunniaeg" />
                <asp:Parameter Name="omanikID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="loomanimi" Type="String" />
                <asp:Parameter DbType="Date" Name="sunniaeg" />
                <asp:Parameter Name="omanikID" Type="Int32" />
                <asp:Parameter Name="loomID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    </asp:Content>
