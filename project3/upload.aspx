<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="project3.upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #TextArea1
        {
            width: 287px;
            height: 46px;
        }
        #desc
        {
            margin-left: 31px;
        }
    </style>
</head>
<body background="light-blue-canvas-texture-abstract-1024x600.jpg">
    <form id="form1" runat="server">
    <div align="right">
    
        <br />
        <asp:Button ID="home_btn" runat="server" onclick="home_btn_Click" Text="Home" 
            BackColor="#88C4FF" BorderStyle="Outset" Height="31px" Width="82px" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="logOut_btn" runat="server" onclick="logOut_btn_Click" 
            Text="Log Out" BackColor="#88C4FF" BorderStyle="Outset" Height="31px" 
            Width="82px" />
        <br />
    
        <br />
        <br />
    
    </div>
    <div style="margin-left: 320px">
        <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BorderStyle="Solid" 
            Height="388px" Width="625px" Font-Size="Medium" HorizontalAlign="Left">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Project Name:&nbsp;&nbsp;
            <asp:TextBox ID="project_name" runat="server" Height="23px" 
                style="margin-left: 19px" Width="317px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name of the File:&nbsp;&nbsp;
            <asp:TextBox ID="file_name" runat="server" Height="23px" 
                style="margin-left: 4px" Width="317px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Version:"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="version" runat="server" Font-Underline="False" Height="25px" 
                style="margin-left: 60px" Width="76px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:FileUpload ID="file_upload" runat="server" Width="211px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="StatusLabel" 
                runat="server" Enabled="False" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Enabled="False" Visible="False"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Description:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="desc" runat="server" Rows="3" 
                TextMode="MultiLine" Width="311px"></asp:TextBox>
            <br />
            &nbsp; &nbsp;<br /><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="save_button" runat="server" BackColor="#88C4FF" 
                BorderStyle="Outset" Height="31px" onclick="save_button_Click" Text="Save" 
                Width="87px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Button ID="cancel_button" runat="server" Text="Cancel" 
                onclick="cancel_button_Click" BackColor="#88C4FF" BorderStyle="Outset" 
                Height="31px" Width="82px" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Panel>
    </div>
    </form>
</body>
</html>
