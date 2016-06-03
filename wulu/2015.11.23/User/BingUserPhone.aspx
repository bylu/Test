<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BingUserPhone.aspx.cs" Inherits="Game.Web.User.BingUserPhone" %>

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
    <link rel="stylesheet" href="/templets/New/css/bing.css" />
    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#BingUserPhone").addClass("lanmu-list_hover");
            $("#Submit").bind("click", function () {
                if ($("#vertifyCode").val() == "") {
                    alert("请输入你的有效电话号码");
                    return false;
                }
                if (!$("#vertifyCode").val().match(/^1[3|4|5|8|7][0-9]\d{4,8}$/)) {
                    alert('手机号码格式不正确，请重新输入');
                    return false;

                }
                if ($("#SecureCode").val() == "") {
                    alert("请输入你的验证码");
                    return false;
                }

            });
            $("#GetCode").bind("click", function () {
                if ($("#vertifyCode").val() == "") {
                    $("#Error_cellPhone").html("请输入你的电话号码");
                    return false;
                }

                if (!$("#vertifyCode").val().match(/^1[3|4|5|8][0-9]\d{4,8}$/)) {
                    $("#Error_cellPhone").html('手机格式不正确，请重新输入');
                    return false;
                } else {
                    $("#Error_cellPhone").html('');

                }
            });

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
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;密保验证功能 </p>
                    <div class="kf">
                          <img src="/templets/New/images/userinfo.jpg" alt="图片加载不出来" />
                    </div>
                </div>
                <div class="wfjs" style="overflow: hidden;">
                    <div id="divRight" runat="server" style="border: 1px dashed red; font-size: 15px; color: Red; height: 40px; padding-top: 12px; text-align: center; width: 100%"></div>
                    <div class="offi-regi-main" runat="server" id="divcenter">
                        <div class="offi-regi-main-wrapper">
                            <h3>密保绑定</h3>
                            <div class="offi-regi-form">
                                <table cellspacing="0">
                                    <tr>
                                        <td class="label">
                                            <label id="lblTitle">
                                                手机号码
                                            </label>
                                        </td>
                                        <td>
                                            <input class="text-input w130" name="mobile" value="" id="vertifyCode" runat="server" /><span
                                                id="Error_cellPhone" class="tip-info"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">&nbsp;
                                        </td>
                                        <td>
                                            <asp:Button ID="GetCode" runat="server" Text="免费获取验证码" CssClass="get-code-btn" OnClick="GetCode_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">验证码
                                        </td>
                                        <td>
                                            <input class="text-input w130" maxlength="7" name="code" id="SecureCode" runat="server" /><span
                                                id="Error_secureCode" class="tip-info"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">&nbsp;
                                        </td>
                                        <td>
                                            <asp:Button ID="Submit" runat="server" Text="" CssClass="register-btn"
                                                OnClick="Submit_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
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
