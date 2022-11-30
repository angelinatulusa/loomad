<%@ Page Title="Loomade tabel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="loomad.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Sisestatud loomade andmed</h3>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="loomID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="Black" GridLines="Vertical" Width="479px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="loomID" HeaderText="loomID" InsertVisible="False" ReadOnly="True" SortExpression="loomID" />
                <asp:BoundField DataField="loomanimi" HeaderText="loomanimi" SortExpression="loomanimi" />
                <asp:BoundField DataField="sunniaeg" HeaderText="sunniaeg" SortExpression="sunniaeg" />
                <asp:BoundField DataField="nimi" HeaderText="nimi" SortExpression="nimi" />
                <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lilled_tulusaConnectionString1 %>" DeleteCommand="DELETE FROM [loomad] WHERE [loomID] = @loomID" InsertCommand="INSERT INTO [loomad] ([loomanimi], [sunniaeg], [omanikID]) VALUES (@loomanimi, @sunniaeg, @omanikID)" SelectCommand="SELECT loomad.loomID, loomad.loomanimi, loomad.sunniaeg, omanik.nimi, omanik.telefon FROM loomad INNER JOIN omanik ON loomad.omanikID = omanik.omanikID" UpdateCommand="UPDATE [loomad] SET [loomanimi] = @loomanimi, [sunniaeg] = @sunniaeg, [omanikID] = @omanikID WHERE [loomID] = @loomID">
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
