<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home_user.aspx.cs" Inherits="project3.home_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body background="light-blue-canvas-texture-abstract-1024x600.jpg">
    <form id="form1" runat="server">
    <div align="center" style="font-size: xx-large; color: #0000FF">
    
        <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Home Page"></asp:Label>
    </div>
    <p align="right">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
            ID="logOut_btn" runat="server" onclick="logOut_btn_Click" Text="Log Out" 
            BackColor="#88C4FF" BorderStyle="Outset" Font-Size="Medium" Height="31px" 
            Width="82px" />
&nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="search_button" runat="server" Text="Search" Width="191px" 
            onclick="search_button_Click" BackColor="#88C4FF" BorderStyle="Outset" 
            Font-Size="Medium" Height="58px" />
    </p>
    <p>
        &nbsp;</p>
    <asp:Button ID="log_button" runat="server" Text="Log" Width="191px" 
        onclick="log_button_Click" BackColor="#88C4FF" BorderStyle="Outset" 
        Font-Size="Medium" Height="58px" />
    <br />
    <br />
    <br />
    <br />
    <asp:Button ID="change_pass_button" runat="server" Text="Change Password" 
        onclick="change_pass_button_Click" Width="191px" BackColor="#88C4FF" 
        BorderStyle="Outset" Font-Size="Medium" Height="58px" />
    </form>
</body>
</html>
