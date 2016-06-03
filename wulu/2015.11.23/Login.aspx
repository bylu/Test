<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Game.Web.Login" %>

<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/Common_Left.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=gb2312" />
      <title>会员用户登录注册-789棋牌游戏中心</title>
    <meta name="keywords" content="789游戏中心，棋牌游戏，789棋牌游戏，捕鱼游戏中心,金蟾捕鱼,李逵劈鱼,悟空闹海，四人牛牛" />
    <meta name="description" content="789游戏中心，提供多种捕鱼游戏和牛牛游戏，电玩厅捕鱼游戏金蟾捕鱼，悟空闹海，李逵劈鱼等捕鱼游戏，同时提供至尊斗牛,至尊两张，通比牛牛等热门棋牌游戏下载。789game游戏大厅，捕鱼游戏官方大厅，是你娱乐休闲的最佳选择。" />

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
            $("#lblAccounts").text(accounts);
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
    <script type="text/javascript">
        function load() {
            //document.getElementById("txtAccounts").focus();

        }
        function checkInput() {

            if (document.getElementById("txtAccounts").value == "") {
                alert("请输入您的用户名！");
                document.getElementById("txtAccounts").focus();
                return false;
            }
            if (document.getElementById("txtPass").value == "") {
                alert("请输入您的密码！");
                document.getElementById("txtPass").focus();
                return false;
            }
            if (document.getElementById("txtVerifyCode").value == "") {
                alert("请输入您的验证码！");
                document.getElementById("txtVerifyCode").focus();
                return false;
            }
            return true;
        }

        function UpdateImage() {
            document.getElementById("picVerifyCode").src = "../../ValidateImage.aspx?r=" + Math.random();
        }
    </script>

</head>
<body onload="load();">
    <!--导航栏  start-->
    <game:Header ID="header" runat="server" />
    <!--导航栏  end-->
    <div id="content">
        <div class="sidebar_right">
            <div class="right_content_top">

                <p>&nbsp;&nbsp;当前位置：<a href="Index.aspx">首页&nbsp;</a>>&nbsp;登录</p>

                <div class="kf">
                    <img src="/templets/New/images/userinfo.jpg" alt="789游戏用户中心" />
                </div>
            </div>

            <form id="formfoo" name="formbar" runat="server">
                <div class="formbox">
                    <h3>登录</h3>
                    <div class="item">
                        <span class="label">用户名：</span>
                        <div class="fl">
                            <asp:TextBox ID="txtAccounts" runat="server" CssClass="text"></asp:TextBox>
                        </div>
                    </div>
                    <!--item end-->
                    <div id="o-password">
                        <div class="item">
                            <span class="label">密码：</span>
                            <div class="fl">
                                <asp:TextBox ID="txtPass" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!--item end-->
                    <div class="item">
                        <span class="label">验证码：</span>
                        <div class="fl">
                            <asp:TextBox ID="txtVerifyCode" runat="server" CssClass="text w120" Width="100"></asp:TextBox>
                            <label class="img">
                                <img id="JD_Verification1" ver_colorofnoisepoint="#888888" src="/ValidateImage.aspx" onclick="this.src='/ValidateImage.aspx?r='+Math.random();" alt="" style="cursor: pointer; width: 60px; height: 28px;" />
                            </label>
                            <label>&nbsp;看不清?点击图片更换</label>
                        </div>
                    </div>
                    <div class="item">
                        <span class="label">&nbsp;</span>
                        <asp:Button ID="btnLogin" runat="server" OnClientClick="return checkInput();"
                            CssClass="yellow_button disabled" OnClick="btnLogin_Click" Style="width: 90px; height: 35px; background-image: url('/templets/new/images/dl.png');" />
                        <a href="/register.html" style="margin-left: 5px; color: gray;">点击注册</a><a href="/ResetLoginPass.aspx" style="margin-left: 5px; color: gray;">忘记密码</a>
                    </div>
                </div>
            </form>
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
                        <p class="i_ok" style="height: 100px;">
                            恭喜，注册成功!<br />
							
                            你注册的帐号为<strong class="f_red"><asp:Label ID="lblAccounts" runat="server"></asp:Label></strong>
                            <br />请妥善保管您的帐号密码以便下次登录使用。<br/>
							 <b>使用绑定机器功能，必须先<a href="/user/UpdateLoginPass.aspx" style="color:red;">修改保险柜密码</a>,否则无法解绑</b><br />
                        </p>
                        <span class="spanStyle"><a class="btn_form01" href="/down.aspx"></a></span>
                    </div>
                    <div class="sub_safe" style="padding-left: 60px;">
                        <p>
                            请登录完个人账户之后对帐户进行安全验证<br />
                            验证邮箱，设置密保问题帮助你快速找回密码，并提高您帐号的安全系数。
                        </p>
                       
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="hidAccounts" runat="server" />
    </div>
    <!--footer-->
    <game:Footer ID="Footer" runat="server" />
    <!--footer  end-->
</body>
</html>
