<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassProtect.aspx.cs" Inherits="Game.Web.User.UpdatePassProtect" %>

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
        function hintMessage(hintObj, error, message) {
            //删除样式
            if (error == "error") {
                $("#" + hintObj + "").removeClass("rightTips");
                $("#" + hintObj + "").addClass("wrongTips");
            } else {
                $("#" + hintObj +"").css("display", "none");
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

        function checkEmail() {
            if ($("#txtEmail").val() == "") {
                hintMessage("lblEmail", "error", "请输入您的电子邮件!");
                return false;
            }
            if ($("#txtEmail").val().length > 32) {
                hintMessage("lblEmail", "error", "电子邮件长度不能大于32个字符!");
                return false;
            }
            if (/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#txtEmail").val()) == false) {
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
            if (!checkEmail()) { $("#txtEmail").focus(); return false; }
            if (!checkConEmail()) { $("#txtConEmail").focus(); return false; }
        }

        $(document).ready(function () {
            $("#txtAnswer1").blur(function () { checkAnswer1(); });
            $("#txtAnswer2").blur(function () { checkAnswer2(); });
            $("#txtAnswer3").blur(function () { checkAnswer3(); });
            $("#txtEmail").blur(function () { checkEmail(); });
            $("#txtConEmail").blur(function () { checkConEmail(); });
            $("#ddlQuestion1").change(function () { checkQuestion1(); });
            $("#ddlQuestion2").change(function () { checkQuestion2(); });
            $("#ddlQuestion3").change(function () { checkQuestion3(); });

            $("#btnConfirm2").click(function () {
                return checkInput();
            });
            $("#ApplyPassProtect").addClass("lanmu-list_hover");
        });
    </script>

    <script type="text/javascript">
        function checkInput2() {
            if ($("#txtAnswer11").val() == "" || $("#txtAnswer12").val() == "" || $("#txtAnswer13").val() == "") {
                alert("请输入您的密保答案");
                return false;
            }
            return true;
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
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;修改密码保护 </p>
                    <div class="kf">
                        <img src="/templets/New/images/userinfo.jpg" alt="图片加载不出来" />
                    </div>
                </div>
                <div class="wfjs" style="overflow: hidden;">
                    <div id="divRight" runat="server" style="border: 1px dashed red; height: 40px; padding-top: 12px; text-align: center; font-size: 15px; color: Red;" visible="false"></div>

                    <div id="fmStep1" runat="server">
                        <div class="formbox">
                            <h3>修改密码保护</h3>
                            <div class="item">
                                <span class="label">问题一：</span>
                                <div class="fl">
                                    <asp:Label ID="lblQuestion11" runat="server"></asp:Label>
                                    <span class="clear"></span>

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
                                <span class="label"></span>
                                <div class="fl" style="padding-left: 100px;">
                                    <asp:Button ID="btnConfirm1" OnClientClick="return checkInput2()" runat="server"
                                        Text="" CssClass="btn" OnClick="btnConfirm1_Click" Style="width: 91px; height: 35px; background-image: url('/templets/New/images/qd.png');" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="reset" name="Submit2" value="" class="btn" style="width: 91px; height: 35px; background-image: url('/templets/New/images/qx.png');" />
                                    <span class="clear"></span>
                                </div>
                            </div>
                            <!--item end-->
                        </div>

                    </div>

                    <div id="fmStep2" runat="server">
                        <div class="formbox">
                            <h3>修改密码保护</h3>
                            <div class="item">
                                <span class="label">问题一：</span>
                                <div class="fl">

                                    <asp:DropDownList ID="ddlQuestion1" runat="server">
                                    </asp:DropDownList>
                                    <span id="lblQuestion1"></span>

                                </div>
                            </div>
                            <!--item end-->

                            <div class="item">
                                <span class="label">答案：</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtAnswer1" runat="server"></asp:TextBox>

                                     <span id="lblAnswer1"></span>
                                </div>
                            </div>
                            <!--item end-->

                            <div class="item">
                                <span class="label">问题二：</span>
                                <div class="fl">
                                    <asp:DropDownList ID="ddlQuestion2" runat="server">
                                    </asp:DropDownList>
                                    <span id="lblQuestion2"></span>

                                </div>
                            </div>
                            <!--item end-->
                            <div class="item">
                                <span class="label">答案：</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtAnswer2" runat="server"></asp:TextBox>

                                   <span id="lblAnswer2"></span>

                                </div>
                            </div>
                            <!--item end-->
                            <div class="item">
                                <span class="label">问题三：</span>
                                <div class="fl">
                                    <asp:DropDownList ID="ddlQuestion3" runat="server">
                                    </asp:DropDownList>
                                   <span id="lblQuestion3"></span>
                                </div>
                            </div>
                            <!--item end-->
                            <div class="item">
                                <span class="label">答案：</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtAnswer3" runat="server"></asp:TextBox>
                                    <span id="lblAnswer3"></span>
                                </div>
                               
                            </div>
                            <div class="item">
                                <span class="label">电子邮箱：</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    <span id="lblEmail"></span>
                                    
                                </div>
                            </div>
                            <div class="item">
                                <span class="label">确认邮箱</span>
                                <div class="fl">
                                    <asp:TextBox ID="txtConEmail" runat="server"></asp:TextBox>
                                    <span id="lblConEmail"></span>
                                </div>
                            </div>
                            <div class="item">
                                <span class="label"></span>
                                <div class="fl" style="padding-left: 100px;">
                                    <asp:Button ID="btnConfirm2" runat="server" Text="" CssClass="btn"
                                        OnClick="btnConfirm2_Click" Style="width: 90px; height: 35px; background-image: url('/templets/New/images/qd.png');" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="reset" name="Submit22" value="" class="btn" style="width: 90px; height: 35px; background-image: url('/templets/New/images/qx.png');" />
                                </div>
                            </div>

                            <!--item end-->

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
