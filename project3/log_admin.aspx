<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log_admin.aspx.cs" Inherits="project3.log_admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body background="light-blue-canvas-texture-abstract-1024x600.jpg">
    <form id="form1" runat="server">
    <div align="right">
    
        <asp:Button ID="home_btn" runat="server" onclick="home_btn_Click" 
            style="margin-left: 0px" Text="Home" Width="82px" BackColor="#88C4FF" 
            BorderStyle="Outset" Height="31px" />
    
    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="logOut_btn" runat="server" onclick="logOut_btn_Click" 
            style="margin-left: 0px" Text="Log Out" BackColor="#88C4FF" 
            BorderStyle="Outset" Height="31px" Width="82px" />
    </div>
    <div style="margin-left: 80px" align="center">
        <br />
        <br />
    </div>
    <div style="margin-left: 320px">
        <asp:GridView ID="logAdmin_view" runat="server" AutoGenerateColumns="False" 
            DataSourceID="AccessDataSource1" AllowPaging="True" CellPadding="4" 
            ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
            Width="651px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="project_name" HeaderText="project_name" 
                    SortExpression="project_name" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="file_name" HeaderText="file_name" 
                    SortExpression="file_name" />
                <asp:BoundField DataField="version" HeaderText="version" 
                    SortExpression="version" />
                <asp:BoundField DataField="emp_name" HeaderText="emp_name" 
                    SortExpression="emp_name" />
                <asp:BoundField DataField="emp_id" HeaderText="emp_id" 
                    SortExpression="emp_id" />
                <asp:BoundField DataField="dt1" HeaderText="dt1" SortExpression="dt1" />
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
    </div>
    <div style="margin-left: 280px">
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="C:\Users\Siddharth\Documents\Database1.accdb" 
            
            SelectCommand="SELECT project_details.project_name, project_details.file_name, project_details.version, emp_details.emp_name, emp_details.emp_id, log.dt1 FROM ((emp_details INNER JOIN log ON emp_details.emp_id = log.emp_id) INNER JOIN project_details ON log.file_ID = project_details.file_ID AND log.creator = project_details.creator) WHERE (log.creator = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="creator" SessionField="userlogin" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
