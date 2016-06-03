<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="Game.Facade" %>
<script type="text/C#" runat="server">
    protected override void OnInit( EventArgs e )
    {
        base.OnInit( e );
        AccountsFacade accountsfacade=new AccountsFacade();
        string sqlQuery = string.Format("select top 1 userid from qpaccountsdb.dbo.accountsinfo");
        string returnResult = Convert.ToString(accountsfacade.GetObjectBySql(sqlQuery));
        if (!string.IsNullOrEmpty(returnResult))
        {
            Response.Write("success");
        }
        else
        {
            Response.Write("error");
        }
    }
</script>
