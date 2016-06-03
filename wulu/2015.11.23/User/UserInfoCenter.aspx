<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfoCenter.aspx.cs" Inherits="Game.Web.User.UserInfoCenter" %>

<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/User_Sidebar.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>789游戏中心</title>
    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/base.css" />
    <link rel="stylesheet" href="/templets/New/css/user.css" />
    <script src="/js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="/js/jquery.divbox.js" type="text/javascript"></script>

    <script type="text/javascript">
        function openDiv() {
            $("#div_regOk").OpenDiv();
        }

        function closeDiv() {
            $("#div_regOk").CloseDiv();
        }
        $(document).ready(function () {
            $("#UserInfoCenter").addClass("lanmu-list_hover");

            var Request = new Object();
            Request = GetRequest();
            var accounts = Request['accounts'];
            var flag = Request["regfirst"];
            if (flag == "1") {

                openDiv();
            }
        });
        //获取url参数
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--导航栏  start-->
        <game:Header ID="header" runat="server" />
        <!--导航栏  end-->
        <div id="content">
            <div class="sidebar_right">
                <div class="right_content_top">
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;用户中心 </p>
                    <div class="kf">
                        <img src="/templets/New/images/userinfo.jpg" alt="图片加载不出来" />
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
                                <td align="right">游&nbsp;&nbsp;&nbsp;戏&nbsp;&nbsp;ID：
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
                                        <asp:Label ID="lblLuckMoney" runat="server"></asp:Label></span>
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
                            <a href="/xinshoubangzhu.html" class="help" target="_blank"></a>
                        </div>
                        <div>
                            <a href="http://down.789game.net/Download/789GameCenter.exe" class="game" target="_blank"></a>
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
           <div id="div_regOk" style="display: none;">
                <div class="win_box">
                    <div class="win_box_t">

                        <div class="t_c" style="background: url('/templets/new/images/hbg.png')">
                            注册成功
                        </div>
                        <div class="t_r">
                            <strong onclick="closeDiv()"></strong>
                        </div>
                    </div>
                    <div class="win_box_m" style="height: 330px;">
                        <div class="win_con">
                            <p class="i_ok" style="height: 70px;">
                                恭喜，注册成功<br />
                                你注册的帐号为<strong class="f_red"><%=accounts %></strong><br />
                                请妥善保管您的帐号密码以便下次登录使用。<br />
                                <b>使用绑定机器功能，必须先<a href="/user/UpdateLoginPass.aspx" style="color:red;">修改保险柜密码</a>,否则无法解绑</b><br />
                            </p>
                            <span  class="spanStyle" style=" margin-top:30px"><a class="btn_form01" href="http://down.789game.net/Download/789GameCenter.exe"></a></span>
                        </div>
                        <div class="sub_safe" style="padding-left: 60px;">
                            <p>
                                请完成帐户安全验证<br />
                                验证邮箱，设置密保问题帮助你快速找回密码，并提高您帐号的安全系数。
                            </p>
                            <ul>
                                <li class="pass"><span class="spanStyle"><b><a href="/user/BingUserEmail.aspx">邮箱验证</a></b></span></li>
                                <li class="email"><span class="spanStyle"><b><a href="/user/ApplyPassProtect.aspx">密保设置</a></b></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hidAccounts" runat="server" />
        </div>
        <!--footer-->
        <game:Footer ID="Footer" runat="server" />
        <!--footer  end-->
    </form>
</body>
</html>
