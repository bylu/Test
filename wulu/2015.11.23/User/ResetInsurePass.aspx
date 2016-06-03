<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetInsurePass.aspx.cs" Inherits="Game.Web.User.ResetInsurePass" %>

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
    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>

    <script type="text/javascript">
        function checkAnswer() {
            if ($("#txtAnswer11").val() == "" || $("#txtAnswer12").val() == "" || $("#txtAnswer13").val() == "") {
                alert("请输入您的密保答案");
                return false;
            }
            return true;
        }

        function hintMessage(hintObj, error, message) {
            //删除样式
            if (error == "error") {
                $("#" + hintObj + "").removeClass("rightTips");
                $("#" + hintObj + "").addClass("wrongTips");
            } else {
                $("#" + hintObj + "").removeClass("wrongTips");
                $("#" + hintObj + "").addClass("rightTips");
            }

            $("#" + hintObj + "").html(message);
        }

        function checkNewPass() {
            if ($("#txtNewPass").val() == "") {
                hintMessage("lblNewsPass", "error", "请输入您的新密码!");
                return false;
            }
            if ($("#txtNewPass").val().length > 32 || $("#txtNewPass").val().length < 6) {
                hintMessage("lblNewsPass", "error", "新密码长度为6到32个字符!");
                return false;
            }
            hintMessage("lblNewsPass", "right", "");
            return true;
        }

        function checkConPass() {
            if ($("#txtConPass").val() == "") {
                hintMessage("lblConPass", "error", "请输入您的确认密码!");
                return false;
            }
            if ($("#txtConPass").val() != $("#txtNewPass").val()) {
                hintMessage("lblConPass", "error", "确认密码与新密码不一致，请重新输入!");
                return false;
            }
            hintMessage("lblConPass", "right", "");
            return true;
        }

        function checkInput() {
            if (!checkAnswer()) { return false; }
            if (!checkNewPass()) { $("#txtNewPass").focus(); return false; }
            if (!checkConPass()) { $("#txtConPass").focus(); return false; }
        }

        $(document).ready(function () {
            $("#txtNewPass").blur(function () { checkNewPass(); });
            $("#txtConPass").blur(function () { checkConPass(); });
            $("#ResetLoginPass").addClass("lanmu-list_hover");
        });
    </script>
</head>
<body>
    <form id="Form1" runat="server">
        <!--导航栏  start-->
        <game:Header ID="header" runat="server" />
        <!--导航栏  end-->
        <div id="content">
            <div class="sidebar_right">
                <div class="right_content_top">
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;找回保险柜密码 </p>
                    <div class="kf">
                        <img src="/templets/New/images/userinfo.jpg" alt="图片加载不出来" />
                    </div>
                </div>

                <div class="wfjs" style="overflow: hidden;">
                    <div id="divRight" runat="server" style="border: 1px dashed red; height: 40px; padding-top: 12px; text-align: center; font-size: 15px;">
                    </div>
                    <div id="fmStep2" runat="server">
                        <div class="formbox">
                            <h3>找回密码</h3>
                            <div class="item">
                                <span class="label">问题一：</span>
                                <div class="fl">
                                    <asp:Label ID="lblQuestion11" runat="server"></asp:Label>

                                </div>
                            </div>
                            <div class="item">
                                <span class="label">答案</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtAnswer11" runat="server"></asp:TextBox>
                                    <span class="clear"></span>

                                </div>
                            </div>
                            <div class="item">
                                <span class="label">问题二：</span>
                                <div class="fl">
                                    <asp:Label ID="lblQuestion12" runat="server"></asp:Label>
                                    <span class="clear"></span>

                                </div>
                            </div>
                            <div class="item">
                                <span class="label">答案</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtAnswer12" runat="server"></asp:TextBox>
                                    <span class="clear"></span>

                                </div>
                            </div>
                            <div class="item">
                                <span class="label">问题三：</span>
                                <div class="fl">
                                    <asp:Label ID="lblQuestion13" runat="server"></asp:Label>
                                    <span class="clear"></span>

                                </div>
                            </div>
                            <div class="item">
                                <span class="label">答案</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtAnswer13" runat="server"></asp:TextBox>
                                    <span class="clear"></span>

                                </div>
                            </div>
                            <div class="item">
                                <span class="label">新密码：</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtNewPass" TextMode="Password" runat="server"></asp:TextBox>
                                    <span id="lblNewsPass"></span>
                                    <span class="clear"></span>

                                </div>
                            </div>

                            <div class="item">
                                <span class="label">确认新密码：</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtConPass" runat="server" TextMode="Password"></asp:TextBox>
                                    <span id="lblConPass"></span>
                                    <span class="clear"></span>

                                </div>
                            </div>
                            <!--item end-->
                            <div class="item">
                                <span class="label"></span>
                                <div class="fl" style="padding-left: 100px;">
                                    <asp:Button ID="btnConfirm2" OnClientClick="return checkInput();" runat="server" Style="background-image: url('/templets/New/images/qd.png'); width: 91px; height: 35px;"
                                        Text="" CssClass="btn" OnClick="btnConfirm2_Click" Width="91px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="reset" name="Submit22" value="" class="btn" style="background-image: url('/templets/New/images/qx.png'); width: 91px; height: 35px;" />
                                    <span class="clear"></span>
                                </div>
                            </div>

                            <!--item end-->
                        </div>

                    </div>
                    <!-- 按钮滚动图片和文字 -->
                    <!--合作媒体友情链接-->
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
