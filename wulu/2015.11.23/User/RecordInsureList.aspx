<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecordInsureList.aspx.cs" Inherits="Game.Web.User.RecordInsureList" %>

<%@ Register TagPrefix="skm" Namespace="ActionlessForm" Assembly="ActionlessForm" %>
<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/User_Sidebar.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>789游戏中心</title>
    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/base.css" />
    <link rel="stylesheet" href="/templets/New/css/user.css" />
    <script src="/templets/images/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        function load() {
            document.getElementById("RecordInsureList").className = "lanmu-list_hover";
        }
    </script>
</head>
<body onload="load()">
    <skm:Form ID="form2" runat="server">
        <!--导航栏  start-->
        <game:Header ID="header" runat="server" />
        <!--导航栏  end-->
        <div id="content">
            <div class="sidebar_right">
                <div class="right_content_top">
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;交易明细 </p>
                    <div class="kf">
                        <img src="/templets/New/images/userinfo.jpg" alt="图片加载不出来" />
                    </div>
                </div>
                <div class="wfjs" style="overflow: hidden;">

                    <div class="box">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr style="line-height: 33px;">
                                <td width="12%" align="right">日期查询：
                                </td>
                                <td width="10%">
                                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="text" Width="90" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                                </td>
                                <td width="6%">
                                    <img src="/templets/new/images/btn_calendar.gif" onclick="WdatePicker({el:'txtStartDate',skin:'whyGreen',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"
                                        style="cursor: pointer; vertical-align: middle" />
                                </td>
                                <td width="3%">至
                                </td>
                                <td width="10%">
                                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="text" Width="90" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                                </td>
                                <td width="7%">
                                    <img src="/templets/new/images/btn_calendar.gif" onclick="WdatePicker({el:'txtEndDate',skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"
                                        style="cursor: pointer; vertical-align: middle" />
                                </td>
                                <td width="10%">
                                    <asp:DropDownList ID="ddlTransferType" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btnQuery" runat="server" Text="" CssClass="btn" OnClick="btnQuery_Click" Style="width: 91px; height: 35px; background-image: url('/templets/New/images/xc.png'); border: 0px;" />
                                    <input type="button" name="btnRefresh" value="" class="btn" onclick="window.location.href = location.href;" style="width: 91px; height: 35px; background-image: url('/templets/New/images/sx.png'); border: 0px;" />
                                </td>
                            </tr>
                        </table>
                        <table width="100%" align="center" cellpadding="0" cellspacing="1">
                            <tr align="center" style="background-color: #fffebf; line-height: 32px;">
                                <td class="bg">交易日期
                                </td>
                                <td class="bg">汇款人
                                </td>
                                <td class="bg">收款人
                                </td>
                                <td class="bg">交易类别
                                </td>
                                <td class="bg">交易金额
                                </td>
                                <td class="bg">服务费
                                </td>
                                <td class="bg">备注
                                </td>
                            </tr>
                            <asp:Repeater ID="rptDataList" runat="server">
                                <ItemTemplate>
                                    <tr style="text-align: center; line-height: 40px;">
                                        <td>
                                            <%#Eval( "CollectDate","{0:yyyy-MM-dd HH:mm:ss}" ).ToString( )%>
                                        </td>
                                        <td>
                                            <%#GetNickNameByUserID(int.Parse(Eval("SourceUserID").ToString()))%>
                                        </td>
                                        <td>
                                            <%#GetNickNameByUserID(int.Parse(Eval("TargetUserID").ToString()))%>
                                        </td>
                                        <td>
                                            <%# GetTransferType(int.Parse( Eval( "TargetUserID" ).ToString( ) ) == userTicket.UserID ? 4 : int.Parse( Eval( "TradeType" ).ToString( ) ))%>
                                        </td>
                                        <td>
                                            <%# (int.Parse(Eval("TradeType").ToString()) == 3 && int.Parse(Eval("TargetUserID").ToString()) != userTicket.UserID) ? (0 - double.Parse(Eval("SwapScore").ToString())) : double.Parse(Eval("SwapScore").ToString())%>
                                        </td>
                                        <td>
                                            <%# int.Parse(Eval("TargetUserID").ToString()) == userTicket.UserID ? 0 : double.Parse(Eval("Revenue").ToString())%>
                                        </td>
                                        <td>
                                            <%#Eval( "CollectNote" ).ToString( )%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg' bgcolor='#ccc'><td colspan='8' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                        </table>
                        <table border="0" cellspacing="0" cellpadding="0" width="96%" align="center">
                            <tbody>
                                <tr>
                                    <td align="right">
                                        <webdiyer:AspNetPager ID="anpPage" runat="server" AlwaysShow="true" FirstPageText="首页"
                                            LastPageText="末页" PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left"
                                            LayoutType="Table" NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%"
                                            UrlPaging="false" OnPageChanging="anpPage_PageChanging">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
            <game:User_Left ID="user_left" runat="server" />
            <div class="clear"></div>
        </div>
        <!--footer-->
        <game:Footer ID="Footer" runat="server" />
        <!--footer  end-->
    </skm:Form>
</body>
</html>
