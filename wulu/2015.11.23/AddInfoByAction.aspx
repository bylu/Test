<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Import Namespace="System.Text" %>
<%@ Import Namespace=" Game.Utils" %>
<script type="text/C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Game.Facade.AccountsFacade accountsfacade = new Game.Facade.AccountsFacade();
        string TempId = Request["TempId"] == null ? "" : Request["TempId"].ToString();
        string Action = Request["Action"] == null ? "" : Request["Action"].ToString();
        string checkVal = TextEncrypt.EncryptPassword(TempId + Action);
        
        if (!string.IsNullOrEmpty(TempId) && !string.IsNullOrEmpty(Action))
        {
            try
            {
                int v = Convert.ToInt32(Action);
            }
            catch (Exception ex)
            {
                Response.Write("Error! this Action is not true");
                return;
            }
            accountsfacade.RunProcByParam(TempId, Convert.ToInt32(Action));
        }
        else
        {
            Response.Write("Error! the both param is not valid");
        }
    }
</script>