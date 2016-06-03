<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfoCenter.aspx.cs" Inherits="Game.Web.NewUser.UserInfoCenter" %>

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
    <style type="text/css">
        .info_news li a {
            text-align: left;
            display: block;
            width: 260px;
            float: left;
        }
    </style>
    <script type="text/javascript">
        function load() {
            document.getElementById("UserInfoCenter").className = "lanmu-list_default";
        }
    </script>
</head>
<body onload="load();">
    <form id="form1" runat="server">
        <!--导航栏  start-->
        <game:Header ID="header" runat="server" />
        <!--导航栏  end-->
        <div id="content">
            <div class="sidebar_right">
                <div class="right_content_top">
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;用户中心 </p>
                    <div class="kf">
                        <img src="/templets/New/images/kefu1.png" alt="图片加载不出来" />
                    </div>
                </div>
                <div class="wfjs" style="overflow: hidden;">
                    <table width="620px" border="0px;" align="center" cellpadding="0" cellspacing="0"
                        style="height: 300px; overflow: hidden;">
                        <tbody>
                            <tr>
                                <td colspan="4" class="userTitle">尊敬的 <span class="lv bold" style="color: #FF6600; font-size: 14px;">[<asp:Label ID="lblAccounts"
                                    runat="server"></asp:Label>]</span>欢迎来到用户中心
                                </td>
                            </tr>
                            <tr>
                                <td width="14%" align="right">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：
                                </td>
                                <td width="29%">
                                    <span id="ctl00_ctl00_cnpMain_cnpMain_lblNickName">
                                        <asp:Label ID="lblNickName" runat="server"></asp:Label></span>
                                </td>
                                <td width="14%" align="right">性&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;别：
                                </td>
                                <td width="37%">
                                    <span id="ctl00_ctl00_cnpMain_cnpMain_lblGender">
                                        <asp:Label ID="lblGender" runat="server"></asp:Label></span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">会&nbsp;员&nbsp;等&nbsp;级：
                                </td>
                                <td>
                                    <span id="ctl00_ctl00_cnpMain_cnpMain_lblMember">
                                        <asp:Label ID="lblMember" runat="server"></asp:Label></span>
                                </td>
                                <td align="right">经&nbsp;&nbsp;验&nbsp;&nbsp;值：
                                </td>
                                <td>
                                    <span id="ctl00_ctl00_cnpMain_cnpMain_lblExperience">
                                        <asp:Label ID="lblExperience" runat="server"></asp:Label></span>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;ID：
                                </td>
                                <td>
                                    <span id="Span3">
                                        <asp:Label ID="lblUserId" runat="server"></asp:Label></span>
                                </td>
                                <td width="12%" align="right">保险柜存款：
                                </td>
                                <td width="37%">
                                    <span id="Span2">
                                        <asp:Label ID="lblInsureMoney" runat="server"></asp:Label></span>
                                </td>
                            </tr>


                            <tr>
                                <td width="12%" align="right">幸&nbsp;&nbsp;&nbsp;运&nbsp;&nbsp;豆：
                                </td>
                                <td width="29%">
                                    <span id="Span1">
                                        <asp:Label ID="lblLuckMoney" runat="server"></asp:Label>></span>
                                </td>

                            </tr>
                            <tr>
                                <td align="right">绑&nbsp;定&nbsp;邮&nbsp;箱：
                                </td>
                                <td colspan="3">绑定就<label style="color: red; font-size: 15px;">送10000</label>幸运豆,<a href="BingUserEmail.aspx" style="color: green;">【立即绑定】</a>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">绑&nbsp;定&nbsp;手&nbsp;机：
                                </td>
                                <td colspan="3">绑定就<label style="color: red; font-size: 15px;">送20000</label>幸运豆,<a href="BingUserPhone.aspx" style="color: green;">【立即绑定】</a>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">推&nbsp;广&nbsp;系&nbsp;统：
                                </td>
                                <td colspan="3">推广789游戏,用户注册即<label style="color: red; font-size: 15px;">送10000</label>幸运豆,<a href="Spread.aspx" style="color: green;">【立即推广】</a>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td align="right">个&nbsp;性&nbsp;签&nbsp;名：
                                </td>
                                <td colspan="3">
                                    <span id="ctl00_ctl00_cnpMain_cnpMain_lblUnderWrite">
                                        <span id="lblUnderWrite"></span></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="fast_9l" style="width: auto; text-align: center; height: auto;">
                        <div>
                            <a href="/kefuzhongxin" class="help" target="_blank"></a>
                        </div>
                        <div>
                            <a href="/DownSoft.aspx" class="game" target="_blank"></a>
                        </div>
                        <div>
                            <a href="ApplyPassProtect.aspx" class="protect" target="_blank"></a>
                        </div>
                        <div>
                            <a href="UpdateLoginPass.aspx" class="pass" target="_blank"></a>
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
    </form>
</body>
</html>
