<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyPassProtect.aspx.cs" Inherits="Game.Web.NewUser.ApplyPassProtect" %>

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

        function checkQuestion1() {
            if ($("#ddlQuestion1 :selected").val() == "请选择密保问题") {
                hintMessage("lblQuestion1", "error", "请选择密保问题!");
                return false;
            }
            if ($("#ddlQuestion1 :selected").val() == $("#ddlQuestion2 :selected").val() || $("#ddlQuestion1 :selected").val() == $("#ddlQuestion3 :selected").val()) {
                hintMessage("lblQuestion1", "error", "不能选择相同的问题!");
                return false;
            }
            hintMessage("lblQuestion1", "right", "");
            return true;
        }
        function checkAnswer1() {
            if ($("#txtAnswer1").val() == "") {
                hintMessage("lblAnswer1", "error", "请输入您的密保答案!");
                return false;
            }
            if ($("#txtAnswer1").val().length > 32) {
                hintMessage("lblAnswer1", "error", "密保答案长度不能大于32个字符!");
                return false;
            }
            hintMessage("lblAnswer1", "right", "");
            return true;
        }

        function checkQuestion2() {
            if ($("#ddlQuestion2 :selected").val() == "请选择密保问题") {
                hintMessage("lblQuestion2", "error", "请选择密保问题!");
                return false;
            }
            if ($("#ddlQuestion2 :selected").val() == $("#ddlQuestion1 :selected").val() || $("#ddlQuestion2 :selected").val() == $("#ddlQuestion3 :selected").val()) {
                hintMessage("lblQuestion2", "error", "不能选择相同的问题!");
                return false;
            }
            hintMessage("lblQuestion2", "right", "");
            return true;
        }
        function checkAnswer2() {
            if ($("#txtAnswer2").val() == "") {
                hintMessage("lblAnswer2", "error", "请输入您的密保答案!");
                return false;
            }
            if ($("#txtAnswer2").val().length > 32) {
                hintMessage("lblAnswer2", "error", "密保答案长度不能大于32个字符!");
                return false;
            }
            hintMessage("lblAnswer2", "right", "");
            return true;
        }

        function checkQuestion3() {
            if ($("#ddlQuestion3 :selected").val() == "请选择密保问题") {
                hintMessage("lblQuestion3", "error", "请选择密保问题!");
                return false;
            }
            if ($("#ddlQuestion3 :selected").val() == $("#ddlQuestion1 :selected").val() || $("#ddlQuestion3 :selected").val() == $("#ddlQuestion2 :selected").val()) {
                hintMessage("lblQuestion3", "error", "不能选择相同的问题!");
                return false;
            }
            hintMessage("lblQuestion3", "right", "");
            return true;
        }
        function checkAnswer3() {
            if ($("#txtAnswer3").val() == "") {
                hintMessage("lblAnswer3", "error", "请输入您的密保答案!");
                return false;
            }
            if ($("#txtAnswer3").val().length > 32) {
                hintMessage("lblAnswer3", "error", "密保答案长度不能大于32个字符!");
                return false;
            }
            hintMessage("lblAnswer3", "right", "");
            return true;
        }

        function checkPassportType() {
            if ($("#ddlPassportType :selected").val() == "0") {
                hintMessage("lblPassportType", "error", "请选择证件类型!");
                return false;
            }
            hintMessage("lblPassportType", "right", "");
            return true;
        }
        function checkPassportID() {
            if ($("#txtPassportID").val() == "") {
                hintMessage("lblPassportID", "error", "请输入您的证件号码!");
                return false;
            }
            if ($("#txtPassportID").val().length > 32) {
                hintMessage("lblPassportID", "error", "证件号码长度不能大于32个字符!");
                return false;
            }
            hintMessage("lblPassportID", "right", "");
            return true;
        }
        function checkConPassportID() {
            if ($("#txtConPassportID").val() == "") {
                hintMessage("lblConPassportID", "error", "请输入您的确认证件号码!");
                return false;
            }
            if ($("#txtConPassportID").val() != $("#txtPassportID").val()) {
                hintMessage("lblConPassportID", "error", "确认证件号码与原证件号码不一致!");
                return false;
            }
            hintMessage("lblConPassportID", "right", "");
            return true;
        }

        function checkEmail() {
            if ($("#txtEmail").val() == "") {
                hintMessage("lblEmail", "error", "请输入您的电子邮件!");
                return false;
            }
            if ($("#txtEmail").val().length > 32) {
                hintMessage("lblEmail", "error", "电子邮件长度不能大于32个字符!");
                return false;
            }
            if (!IsEmail($("#txtEmail").val())) {
                hintMessage("lblEmail", "error", "电子邮件不正确，请重新输入!");
                return false;
            }
            hintMessage("lblEmail", "right", "");
            return true;
        }
        function checkConEmail() {
            if ($("#txtConEmail").val() == "") {
                hintMessage("lblConEmail", "error", "请输入您的确认电子邮件!");
                return false;
            }
            if ($("#txtConEmail").val() != $("#txtEmail").val()) {
                hintMessage("lblConEmail", "error", "确认电子邮件与原电子邮件不一致!");
                return false;
            }
            hintMessage("lblConEmail", "right", "");
            return true;
        }

        function checkInput() {
            if (!checkQuestion1()) { return false; }
            if (!checkAnswer1()) { $("#txtAnswer1").focus(); return false; }
            if (!checkQuestion2()) { return false; }
            if (!checkAnswer2()) { $("#txtAnswer2").focus(); return false; }
            if (!checkQuestion3()) { return false; }
            if (!checkAnswer3()) { $("#txtAnswer3").focus(); return false; }
            if (!checkPassportType()) { return false; }
            if (!checkPassportID()) { $("#txtPassportID").focus(); return false; }
            if (!checkConPassportID()) { $("#txtConPassportID").focus(); return false; }
            if (!checkEmail()) { $("#txtEmail").focus(); return false; }
            if (!checkConEmail()) { $("#txtConEmail").focus(); return false; }
        }

        $(document).ready(function () {
            $("#txtAnswer1").blur(function () { checkAnswer1(); });
            $("#txtAnswer2").blur(function () { checkAnswer2(); });
            $("#txtAnswer3").blur(function () { checkAnswer3(); });
            $("#txtPassportID").blur(function () { checkPassportID(); });
            $("#txtConPassportID").blur(function () { checkConPassportID(); });
            $("#txtEmail").blur(function () { checkEmail(); });
            $("#txtConEmail").blur(function () { checkConEmail(); });
            $("#ddlQuestion1").change(function () { checkQuestion1(); });
            $("#ddlQuestion2").change(function () { checkQuestion2(); });
            $("#ddlQuestion3").change(function () { checkQuestion3(); });

            $("#btnConfirm").click(function () {
                return checkInput();
            });
            $("#UserInfoCenter").removeClass().addClass("lanmu-list_a");
            $("#ApplyPassProtect").addClass("lanmu-list_default");
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
                <p>&nbsp;&nbsp;当前位置：首页>&nbsp;申请密码保护 </p>
                <div class="kf">
                    <img src="/templets/New/images/kefu1.png" alt="图片加载不出来" />
                </div>
            </div>
            <div class="wfjs" style="overflow: hidden;">

                <div id="divRight" runat="server" style="border: 1px dashed red; font-size: 15px; color: Red; height: 40px; padding-top: 12px; text-align: center;"></div>
                <form id="frmProtect" runat="server">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="text-align: center;">

                        <tr>
                            <td width="22%" align="right">问题一：</td>
                            <td width="32%">
                                <asp:DropDownList ID="ddlQuestion1" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td width="46%"><span id="lblQuestion1"></span></td>
                        </tr>
                        <tr>
                            <td align="right">答案：</td>
                            <td>
                                <asp:TextBox ID="txtAnswer1" runat="server"></asp:TextBox></td>
                            <td><span id="lblAnswer1"></span></td>
                        </tr>
                        <tr>
                            <td align="right">问题二：</td>
                            <td>
                                <asp:DropDownList ID="ddlQuestion2" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td><span id="lblQuestion2"></span></td>
                        </tr>
                        <tr>
                            <td align="right">答案：</td>
                            <td>
                                <asp:TextBox ID="txtAnswer2" runat="server"></asp:TextBox></td>
                            <td><span id="lblAnswer2"></span></td>
                        </tr>
                        <tr>
                            <td align="right">问题三：</td>
                            <td>
                                <asp:DropDownList ID="ddlQuestion3" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td><span id="lblQuestion3"></span></td>
                        </tr>
                        <tr>
                            <td align="right">答案：</td>
                            <td>
                                <asp:TextBox ID="txtAnswer3" runat="server"></asp:TextBox></td>
                            <td><span id="lblAnswer3"></span></td>
                        </tr>
                        <tr>
                            <td align="right">证件类型：</td>
                            <td>
                                <asp:DropDownList ID="ddlPassportType" runat="server">
                                    <asp:ListItem Text="请选择证件类型" Value="0" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="身份证"></asp:ListItem>
                                    <asp:ListItem Text="学生证" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="军官证" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="驾驶证" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="其他" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td><span id="lblPassportType"></span></td>
                        </tr>
                        <tr>
                            <td align="right">证件号码：</td>
                            <td>
                                <asp:TextBox ID="txtPassportID" runat="server"></asp:TextBox></td>
                            <td><span id="lblPassportID"></span></td>
                        </tr>
                        <tr>
                            <td align="right">确认号码：</td>
                            <td>
                                <asp:TextBox ID="txtConPassportID" runat="server"></asp:TextBox></td>
                            <td><span id="lblConPassportID"></span></td>
                        </tr>
                        <tr>
                            <td align="right">电子邮箱：</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                            <td><span id="lblEmail"></span></td>
                        </tr>
                        <tr>
                            <td align="right">确认邮箱：</td>
                            <td>
                                <asp:TextBox ID="txtConEmail" runat="server"></asp:TextBox></td>
                            <td><span id="lblConEmail"></span></td>
                        </tr>
                    </table>
                    <table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnConfirm" runat="server" Text="" CssClass="btn" OnClick="btnConfirm_Click" Style="width: 90px; height: 35px; background-image: url(/templets/New/images/btn_ok.jpg);" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" name="Submit2" value="" class="btn" style="width: 90px; height: 35px; background-image: url(/templets/New/images/btn_reset.jpg);" />
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
