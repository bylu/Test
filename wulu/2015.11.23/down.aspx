<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace=" Game.Utils" %>
<%@ Import Namespace=" Game.Facade" %>
<script type="text/C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);	
       
            Random rnd = new Random();
            int n = rnd.Next(1000, 9999999);
       	    Response.Redirect("http://down.789game.net/download/789GameCenter.exe");

    }
</script>

