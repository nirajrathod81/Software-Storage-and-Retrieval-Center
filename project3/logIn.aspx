<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logIn.aspx.cs" Inherits="project3.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body style="height: 625px; width: 1266px;" background="light-blue-canvas-texture-abstract-1024x600.jpg">
    <form id="form1" runat="server" 
    
    
    style="background-color: #6ab5ff; height: 641px; width: 1299px; background-image: url('light-blue-canvas-texture-abstract-1024x600.jpg');">
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <div style="width: 711px; margin-left: 273px" align="center" >
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Size="1.5cm" 
            Text="Bharat Electronics Ltd."></asp:Label>
    &nbsp;</div>
    <p>
        &nbsp;</p>
    &nbsp;&nbsp;
    <br />
    <div style="margin-left: 440px">
        <asp:Panel ID="Panel1" runat="server" Height="202px" Width="387px" 
            BorderColor="Black" BorderStyle="Ridge" HorizontalAlign="Center" 
             background="light-blue-canvas-texture-abstract-1024x600.jpg">
            &nbsp;
            <br />
            &nbsp;User ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="user_id" runat="server" Width="182px"></asp:TextBox>
            <br />
            <br style="background-color: #6ab5ff" />
            <br />
            &nbsp;Password:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="pass" runat="server" Width="182px" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="log_in" runat="server" BackColor="#CCCCCC" Font-Bold="False" 
                Height="31px" onclick="log_in_Click" Text="Log In" Width="82px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="cancel" runat="server" Text="Cancel" Width="82px" 
                BackColor="#CCCCCC" onclick="cancel_Click" Font-Bold="False" 
                Height="31px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </asp:Panel>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
