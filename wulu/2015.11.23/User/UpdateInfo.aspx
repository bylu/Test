<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateInfo.aspx.cs" Inherits="Game.Web.User.UpdateInfo" %>

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
        function checkInput() {
            if ($("#txtCompellation").val().length > 16) {
                alert("真实姓名长度不能大于16个字符!");
                return false;
            }
            var regMobile = /^((\(\d{2,3}\))|(\d{3}\-))?((13\d{9})|(15[389]\d{8})|(18\d{9}))$/;
            if ($("#txtMobilePhone").val() != "") {
                if (!$("#txtMobilePhone").val().match(regMobile)) {
                    alert("手机号码不正确，请重新输入");
                    return false;
                }
            }
            var regPhone = /(^[0-9]{3,4}-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^([0-9]{3,4})[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/;
            if ($("#txtSeatPhone").val() != "") {
                if (!$("#txtSeatPhone").val().match(regPhone)) {
                    alert("固定电话号码不正确，请重新输入");
                    return false;
                }
            }
            if ($("#txtQQ").val().length > 16) {
                alert("QQ长度不能大于16个字符!");
                return false;
            }
            var regEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if ($("#txtEmail").val() != "") {
                if (!IsEmail($("#txtEmail").val())) {
                    alert("Email地址不正确，请重新输入");
                    return false;
                }
            }
            if ($("#txtAddress").val().length > 128) {
                alert("详细地址长度不能大于128个字符!");
                return false;
            }
            if ($("#txtUserNote").val().length > 256) {
                alert("详细地址长度不能大于256个字符!");
                return false;
            }

            return true;
        }
        $(document).ready(function () {
            $("#btnUpdate").click(function () {
                return checkInput();
            });
            $("#UpdateInfo").addClass("lanmu-list_hover");
        });
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
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;修改个人信息 </p>
                    <div class="kf">
                        <img src="/templets/New/images/userinfo.jpg" alt="图片加载不出来" />
                    </div>
                </div>
                <div class="wfjs" style="overflow: hidden;">
                    <table width="100%" cellpadding="0" cellspacing="0" style="margin-left: 10px;">
                        <tbody>
                            <tr style="line-height: 30px; height: 50px;">
                                <td class="title" align="left">
                                    <strong>1.基本资料&nbsp;&nbsp;&nbsp;&nbsp;</strong>
                                </td>
                            </tr>
                            <tr style="height: 50px;">
                                <td>
                                    <table id="table0" border="0" cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td width="17%" align="right">账号：
                                                </td>
                                                <td width="28%" align="left">
                                                    <asp:Label ID="lblAccounts" runat="server"></asp:Label>
                                                </td>
                                                <td width="18%" align="right">ＩＤ号码：
                                                </td>
                                                <td width="37%" align="left">
                                                    <asp:Label ID="lblGameID" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                            <tr style="height: 50px;">
                                <td>
                                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr style="height: 35px;">
                                                <td width="17%" align="right">性别：
                                                </td>
                                                <td width="83%" align="left">
                                                    <asp:DropDownList ID="ddlGender" runat="server">
                                                        <asp:ListItem Text="女性" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="男性" Value="1"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="17%" align="right">个性签名：
                                                </td>
                                                <td width="83%" align="left">
                                                    <asp:TextBox ID="txtUnderWrite" runat="server" CssClass="text" Width="457" class="input_out" type="text"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="title" align="left" style="height: 50px; line-height: 30px;">
                                    <strong>2.我的身份资料</strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellspacing="0" cellpadding="0" width="100%" style="line-height: 30px;">
                                        <tbody>
                                            <tr>
                                                <td align="right" width="20%">真实姓名：
                                                </td>
                                                <td width="80%" align="left" colspan="3">
                                                    <asp:TextBox ID="txtCompellation" runat="server" CssClass="text" class="input_out" type="text"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">手机号码：
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtMobilePhone" runat="server" CssClass="text" class="input_out" type="text"></asp:TextBox>
                                                </td>
                                                <td align="right">固定电话：
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtSeatPhone" runat="server" CssClass="text" class="input_out" type="text"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">QQ/MSN：
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtQQ" runat="server" CssClass="text" class="input_out" type="text"></asp:TextBox>
                                                </td>
                                                <td align="right">Email：
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="text" class="input_out" type="text"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">详细地址：
                                                </td>
                                                <td align="left" colspan="3">
                                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="text" Width="457" class="input_out" type="text"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">其他说明：
                                                </td>
                                                <td colspan="3" align="left">
                                                    <asp:TextBox ID="txtUserNote" runat="server" CssClass="mtop13" Width="490" Height="20"
                                                        class="input_out" type="text"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>


                        </tbody>
                    </table>
                    <table width="100%" style="margin-top: 15px;">
                        <tr>
                            <td style="padding-left: 200px;">
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn1 bold"
                                    Text="" Height="25px" OnClick="btnUpdate_Click" Style="background-image: url('/templets/New/images/qd.png'); width: 91px; height: 35px; border: 0;" />
                            </td>
                        </tr>
                    </table>
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
