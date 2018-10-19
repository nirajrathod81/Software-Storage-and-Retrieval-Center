<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="project3.search_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body background="light-blue-canvas-texture-abstract-1024x600.jpg">
    <form id="form1" runat="server">
    <div align="right">
    
        <asp:Button ID="home_btn" runat="server" onclick="home_btn_Click" Text="Home" 
            BackColor="#88C4FF" BorderStyle="Outset" Height="31px" Width="82px" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="logOut_btn" runat="server" onclick="logOut_btn_Click" 
            Text="Log Out" BackColor="#88C4FF" BorderStyle="Outset" Height="31px" 
            Width="82px" />
    </div>
    <p>
        &nbsp;</p>
    <div style="margin-left: 320px">
        <asp:Panel ID="Panel1" runat="server" Height="72px" Width="643px" 
            BorderColor="Black" BorderStyle="Ridge" HorizontalAlign="Center">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Project Name:&nbsp;&nbsp;
            <asp:TextBox ID="project_name" runat="server" Width="339px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="search" runat="server" onclick="search_Click" 
                style="height: 26px" Text="Search" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </asp:Panel>
    </div>
    <p style="margin-left: 320px">
        &nbsp;</p>
    <p style="margin-left: 240px" align="center">
        &nbsp;&nbsp;&nbsp;
        <asp:GridView ID="search_view" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" AutoGenerateColumns="False" 
            DataSourceID="AccessDataSource1" Width="862px" 
            onselectedindexchanged="search_view_SelectedIndexChanged" 
            HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="project_name" HeaderText="project_name" 
                    SortExpression="project_name" >
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="file_name" HeaderText="file_name" 
                    SortExpression="file_name" />
                <asp:BoundField DataField="version" HeaderText="version" 
                    SortExpression="version" />
                <asp:BoundField DataField="dt" HeaderText="dt" SortExpression="dt" />
                
                <asp:BoundField DataField="description" HeaderText="description" 
                    SortExpression="description" />
                <asp:BoundField DataField="creator" HeaderText="creator" 
                    SortExpression="creator" />
                <asp:TemplateField>
                    
                    <ItemTemplate>
                        <asp:Button ID="buttonid" runat="server" onclick="lnkDownload_Click" Text="Download" />
                    </ItemTemplate>
                    </asp:TemplateField>

            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Center" VerticalAlign="Middle" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Center" VerticalAlign="Middle" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="C:\Users\Siddharth\Documents\Database1.accdb" 
            SelectCommand="SELECT [project_name], [file_name], [version], [dt], [description], [creator] FROM [project_details] WHERE ([project_name] = ?)">
            <SelectParameters>
                <asp:FormParameter FormField="project_name" Name="project_name" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
    <p style="margin-left: 120px">
        &nbsp;</p>
    <p style="margin-left: 120px">
        &nbsp;</p>
    </form>
</body>
</html>
