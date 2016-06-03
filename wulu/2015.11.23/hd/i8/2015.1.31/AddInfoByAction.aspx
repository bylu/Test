<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Import Namespace="System.Text" %>
<%@ Import Namespace=" Game.Utils" %>

<script type="text/C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        Game.Facade.AccountsFacade accountsfacade = new Game.Facade.AccountsFacade();
        string Action = Request["Action"]==null? "" : Request["Action"].ToString();
        string TempId = Request["TempId"] == null ? "" : Request["TempId"].ToString();
        string sql = "";
        if (!string.IsNullOrEmpty(Action) && !string.IsNullOrEmpty(TempId))
        {
            switch (Action)
            {
                case "1":  //安装记录
                    sql = string.Format("insert into tongji.dbo.setuplog (TempId,InsertTime) values({0},default)", TempId);
                    break;
                case "2":  //卸载记录
                    sql = string.Format("insert into tongji.dbo.uninstalllog (TempId,InsertTime) values({0},default)", TempId);
                    break;
                default: //其他
                    sql = "";
                    break;
            }
            if (!string.IsNullOrEmpty(sql))
            {
                int i = accountsfacade.InsertValBySql(sql.ToString());
                Response.Write(i.ToString());

            }
        }
        else
        {
            Response.Write("error");
        }

    }
</script>

