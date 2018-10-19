<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log_user.aspx.cs" Inherits="project3.log_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body background="light-blue-canvas-texture-abstract-1024x600.jpg">
    <form id="form1" runat="server">
    <div align="right">
    
        <asp:Button ID="home_btn" runat="server" onclick="home_btn_Click" Text="Home" 
            Width="82px" BackColor="#88C4FF" BorderStyle="Outset" Height="31px" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="logOut_btn" runat="server" onclick="logOut_btn_Click" 
            Text="Log Out" BackColor="#88C4FF" BorderStyle="Outset" Height="31px" 
            Width="82px" />
    </div>
    <p>
        &nbsp;</p>
    <p align="center" style="margin-left: 120px">
        &nbsp;</p>
    <div align="center" style="margin-left: 80px">
        <asp:GridView ID="loguser_view" runat="server" Width="784px" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="AccessDataSource1" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="project_name" HeaderText="project_name" 
                    SortExpression="project_name" />
                <asp:BoundField DataField="file_name" HeaderText="file_name" 
                    SortExpression="file_name" />
                <asp:BoundField DataField="version" HeaderText="version" 
                    SortExpression="version" />
                <asp:BoundField DataField="dt1" HeaderText="dt1" SortExpression="dt1" />
                <asp:BoundField DataField="creator" HeaderText="creator" 
                    SortExpression="creator" />
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
            SelectCommand="SELECT project_details.project_name, project_details.file_name, project_details.version, log.dt1, log.creator FROM ((emp_details INNER JOIN log ON emp_details.emp_id = log.emp_id) INNER JOIN project_details ON log.file_ID = project_details.file_ID AND log.creator = project_details.creator) WHERE (log.emp_id = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="?" SessionField="userlogin" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
