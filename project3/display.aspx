<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="display.aspx.cs" Inherits="project3.display" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body background="light-blue-canvas-texture-abstract-1024x600.jpg">
    <form id="form1" runat="server">
    <div align="right">
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="home_btn" runat="server" onclick="home_btn_Click" 
            Text="Home" BackColor="#88C4FF" BorderStyle="Outset" Height="31px" 
            Width="82px" />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="logOut_btn" runat="server" onclick="logOut_btn_Click" 
            Text="Log Out" BackColor="#88C4FF" BorderStyle="Outset" Height="31px" 
            Width="82px" />
        <br />
        <br />
    
    </div>
    
    <p align="center">
        &nbsp;</p>
    <p align="center">
        &nbsp;</p>
    
        <asp:GridView ID="display_view" runat="server" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
            Width="1058px" DataKeyNames="file_ID" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="project_name" HeaderText="project_name" 
                    SortExpression="project_name" >
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="file_name" HeaderText="file_name" 
                    SortExpression="file_name" />
                <asp:BoundField DataField="version" HeaderText="version" 
                    SortExpression="version" />
                <asp:BoundField DataField="dt" HeaderText="dt" SortExpression="dt" 
                    ReadOnly="True" />
                <asp:BoundField DataField="description" HeaderText="description" 
                    SortExpression="description" />
                <asp:CommandField ButtonType="Button" 
                    ShowEditButton="True" >

                <ControlStyle Height="26px" Width="68px" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CommandField>

               <asp:TemplateField>
                    
                    <ItemTemplate>
                        <asp:Button ID="delbtnid" runat="server" onclick="lnkDelete_Click" Text="Delete" />
                    </ItemTemplate>
                    </asp:TemplateField>

               <asp:TemplateField>
                    
                    <ItemTemplate>
                         <asp:Button ID="buttonid" runat="server" onclick="authenticate_Click" Text="Authenticate" />
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
            
            
            
            SelectCommand="SELECT [project_name], [file_name], [version], [dt], [description], [file_ID] FROM [project_details]" 
            DeleteCommand="DELETE FROM [project_details] WHERE [file_ID] = ?" 
            InsertCommand="INSERT INTO [project_details] ([project_name], [file_name], [version], [dt], [description], [file_ID]) VALUES (?, ?, ?, ?, ?, ?)" 
            UpdateCommand="UPDATE [project_details] SET [project_name] = ?, [file_name] = ?, [version] = ?, [dt] = ?, [description] = ? WHERE [file_ID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="file_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="project_name" Type="String" />
                <asp:Parameter Name="file_name" Type="String" />
                <asp:Parameter Name="version" Type="String" />
                <asp:Parameter Name="dt" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="file_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="project_name" Type="String" />
                <asp:Parameter Name="file_name" Type="String" />
                <asp:Parameter Name="version" Type="String" />
                <asp:Parameter Name="dt" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="file_ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
   
    <p align="center">
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <div style="margin-left: 120px">
    </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>
