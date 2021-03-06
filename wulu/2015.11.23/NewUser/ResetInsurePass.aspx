﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetInsurePass.aspx.cs" Inherits="Game.Web.NewUser.ResetInsurePass" %>

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
        });
    </script>
</head>
<body>
    <!--导航栏  start-->
    <game:Header ID="header" runat="server" />
    <!--导航栏  end-->
    <div id="content">
        <div class="sidebar_right">
            <div class="right_content_top">
                <p>&nbsp;&nbsp;当前位置：首页>&nbsp;找回密码 </p>
                <div class="kf">
                    <img src="/templets/New/images/kefu1.png" alt="图片加载不出来" />
                </div>
            </div>
            <div class="wfjs" style="overflow: hidden;">
                <div id="divRight" runat="server" style="border: 1px dashed red; height: 40px; padding-top: 12px; text-align: center; font-size: 15px;"></div>
                <form id="fmStep2" runat="server">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr style="line-height: 40px; font-size: 16px; color: Red;">
                            <td>
                                <b>请回答下面问题</b>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
                        <tr>
                            <td align="right">问题一：
                            </td>
                            <td colspan="2">
                                <asp:Label ID="lblQuestion11" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">答案：
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtAnswer11" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">问题二：
                            </td>
                            <td colspan="2">
                                <asp:Label ID="lblQuestion12" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">答案：
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtAnswer12" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">问题三：
                            </td>
                            <td colspan="2">
                                <asp:Label ID="lblQuestion13" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">答案：
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtAnswer13" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="line-height: 60px;">
                            <td align="right">新密码：
                            </td>
                            <td width="32%">
                                <asp:TextBox ID="txtNewPass" TextMode="Password" runat="server"></asp:TextBox>
                            </td>
                            <td width="47%">
                                <span id="lblNewsPass"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">确认密码：
                            </td>
                            <td>
                                <asp:TextBox ID="txtConPass" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            <td>
                                <span id="lblConPass"></span>
                            </td>
                        </tr>
                    </table>
                    <table width="400px;" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 30px;">
                        <tr>
                            <td align="left">
                                <asp:Button ID="btnConfirm2" OnClientClick="return checkInput();" runat="server" Style="background-image: url('/templets/images/btn_ok.jpg'); width: 90px; height: 35px;"
                                    Text="" CssClass="btn" OnClick="btnConfirm2_Click" Width="90px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="reset" name="Submit22" value="" class="btn" style="background-image: url('/templets/images/btn_reset.jpg'); width: 90px; height: 35px;" />
                            </td>
                        </tr>
                    </table>

                </form>
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
</body>
</html>
