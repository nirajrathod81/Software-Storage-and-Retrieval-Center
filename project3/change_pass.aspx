<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="change_pass.aspx.cs" Inherits="project3.change_passspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 333px" background="light-blue-canvas-texture-abstract-1024x600.jpg">
    <form id="form1" runat="server">
    <div align="right">
    
        &nbsp;<asp:Button 
            ID="home_btn" runat="server" onclick="home_btn_Click" 
            Text="Home" BackColor="#88C4FF" BorderStyle="Outset" Height="31px" 
            Width="82px" />
        &nbsp;&nbsp;
        <asp:Button ID="logOut_btn" runat="server" onclick="logOut_btn_Click" 
            Text="Log Out" BackColor="#88C4FF" BorderStyle="Outset" Height="31px" 
            Width="82px" />
        <br />
        <br />
    
    </div>
    <div style="margin-left: 480px">
        <asp:Panel ID="Panel1" runat="server" Height="221px" Width="459px" 
            BorderColor="Black" BorderStyle="Ridge" HorizontalAlign="Center" 
            style="margin-left: 1px; margin-top: 41px">
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Change Password" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Current Password:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="current_pass" runat="server" Width="176px" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="new_pass" runat="server" TextMode="Password" Width="176px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Confirm Password:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="confrm_pass" runat="server" Width="177px" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="save_btn" runat="server" onclick="save_btn_Click" Text="Save" 
                Width="103px" BackColor="#88C4FF" BorderStyle="Outset" Height="33px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="cancel_btn" runat="server" Text="Cancel" Width="103px" 
                BackColor="#88C4FF" BorderStyle="Outset" Height="33px" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
        </asp:Panel>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
