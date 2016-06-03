<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsTop5.aspx.cs" Inherits="Game.Web.NewsTop5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/base.css" />
    <link rel="stylesheet" href="/templets/New/css/index.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="content_allInfo">
            <div class="info_news">
                <h3><a href="NewsList.aspx">更多>></a></h3>
                <ul>
                    <asp:Repeater ID="rptNoticesList" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href='NewsShow.aspx?XID=<%# Eval("NewsID") %>' title='<%# Eval("Subject")%>'><%# Eval("Subject")%></a>
                                <span><%# Eval("IssueDate","{0:yyyy-MM-dd}")%></span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <div class="info_question">
                <h3><a href="QuestionList.aspx">更多>></a></h3>
                <ul>
                    <asp:Repeater ID="rptQuestion" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href='QuestionView.aspx?XID=<%# Eval("IssueID") %>' title='<%# Eval("IssueTitle")%>'><%# Eval("IssueTitle")%></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
