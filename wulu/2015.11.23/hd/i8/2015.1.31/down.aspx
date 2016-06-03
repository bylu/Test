<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace=" Game.Utils" %>
<%@ Import Namespace=" Game.Facade" %>
<script type="text/C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Game.Facade.AccountsFacade accountsfacade = new Game.Facade.AccountsFacade();
        if (Request.Cookies["789gameTempUid"] != null)
        {
              
	    HttpCookie hc=Request.Cookies["789gameTempUid"];
            string createdFileName = "789GameCenter_" +  hc.Value.ToString()+".exe";
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Server.UrlPathEncode(createdFileName));

             string stbprpFilePath = @"D:/www/www.789qp.net/download/789GameCenter.exe";
            try
            {
                accountsfacade.RunProcByParam(hc.Value.ToString(), 1);
                Response.TransmitFile(stbprpFilePath);
                Response.End();
              
            }
            catch (System.Threading.ThreadAbortException ex)
            {

                //Response.Redirect("http://down.789game.net/download/789gameCenter.exe");
               Console.Write(ex.Message);
            }
        }
        else
        {

            Response.Redirect("http://down.789game.net/download/789gameCenter.exe");
        }

    }
</script>

