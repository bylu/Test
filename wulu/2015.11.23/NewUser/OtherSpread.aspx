<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherSpread.aspx.cs" Inherits="Game.Web.NewUser.OtherSpread" %>

<%@ Register TagPrefix="skm" Namespace="ActionlessForm" Assembly="ActionlessForm" %>
<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/User_Sidebar.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>789游戏中心</title>
    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/789.css" />
    <link rel="stylesheet" href="/templets/New/css/home.css" />
    <link rel="stylesheet" href="/templets/New/css/user.css" />
    <link rel="stylesheet" href="/templets/New/css/page.css" />
    <script src="/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        function load() {
            document.getElementById("SpreadInfo").className = "lanmu-list_default";
        }
    </script>
</head>
<body onload="load()">

    <!--导航栏  start-->
    <game:Header ID="header" runat="server" />
    <!--导航栏  end-->
    <div id="content">
        <div class="sidebar_right">
            <div class="right_content_top">
                <p>&nbsp;&nbsp;当前位置：首页>&nbsp;推广下线收益查看 </p>
                <div class="kf">
                    <img src="/templets/New/images/kefu1.png" alt="图片加载不出来" />
                </div>
            </div>
            <div class="wfjs" style="overflow: hidden; min-height: 650px;">
                <skm:Form ID="form2" runat="server">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 15px;">
                        <tr>
                            <td style="width: 10%;">日期查询：</td>
                            <td align="left">
                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="text" Width="70" MaxLength="10" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                                <img src="/templets/images/btn_calendar.gif" onclick="WdatePicker({el:'txtStartDate',skin:'whyGreen',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})" style="cursor: pointer; vertical-align: text-bottom" />

                                至
                            
                            <asp:TextBox ID="txtEndDate" runat="server" Width="70" MaxLength="10" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                                <img src="/templets/images/btn_calendar.gif" onclick="WdatePicker({el:'txtEndDate',skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})" style="cursor: pointer; vertical-align: text-bottom" />

                                <asp:Button ID="btnSelect" Text="查 询" runat="server"
                                    OnClick="btnSelect_Click" />
                            </td>
                        </tr>
                    </table>

                    <table width="100%" style="height: auto;" cellpadding="0">
                        <tr align="center" style="background-color: #fffebf; line-height: 40px;">
                            <td>日期</td>
                            <td>提成</td>
                            <td>类别</td>
                            <td>被推荐人</td>
                            <td>备注</td>
                            <td>推广查看</td>
                        </tr>

                        <asp:Repeater ID="rptSpreaderList" runat="server">
                            <ItemTemplate>
                                <tr align="center" style="line-height: 30px;">
                                    <td><%# Eval("CollectDate")%></td>
                                    <td><%# Eval("Score","{0:N}") %></td>
                                    <td><%# (Convert.ToInt32(Eval("TypeID")) == 1 ? "注册" : Convert.ToInt32(Eval("TypeID")) == 2 ? "游戏时长30小时" : "结算")%></td>
                                    <td><%# Game.Facade.Fetch.GetAccountsByUserID(Convert.ToInt32(Eval("ChildrenID"))) %></td>
                                    <td><%# Eval("CollectNote")%></td>
                                    <td><a href="OtherSpread.aspx?UID=<%# Eval("ChildrenID")%>" style="color: red;">点击查看</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                        <tr id="divTotal" runat="server" align="center">
                            <td style="color: Red;">合计：</td>
                            <td style="color: Red;"><%= total %></td>
                            <td colspan="4"></td>
                        </tr>
                        <tr id="trNoData" runat="server">
                            <td bgcolor='#ccc' colspan='6' align='center'>
                                <br>
                                没有任何信息!<br>
                                <br>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="page2" align="right">
                                <webdiyer:AspNetPager ID="anpPage" runat="server" AlwaysShow="true" FirstPageText="首页"
                                    LastPageText="末页" PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left"
                                    LayoutType="Table" NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%"
                                    UrlPaging="false" OnPageChanging="anpPage_PageChanging">
                                </webdiyer:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </skm:Form>
            </div>
        </div>
        <game:User_Left ID="user_left" runat="server" />
        <div class="clear"></div>
    </div>
    <!--footer-->
    <game:Footer ID="Footer" runat="server" />
    <!--footer  end-->
</body>
</html>
