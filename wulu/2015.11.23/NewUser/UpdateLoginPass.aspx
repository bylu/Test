<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateLoginPass.aspx.cs" Inherits="Game.Web.NewUser.UpdateLoginPass" %>

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
        strong {
            color: #DD6D22;
            font-size: 15px;
        }

        .rightTips {
        }

        .wrongTips {
            font-size: 13px;
            color: Red;
        }

    </style>
    <script type="text/javascript">
        function load() {
            document.getElementById("UpdateLoginPass").className = "lanmu-list_default";
        }
    </script>
</head>
<body onload="load()">
    <form id="form1" runat="server">
        <!--导航栏  start-->
        <game:Header ID="header" runat="server" />
        <!--导航栏  end-->
        <div id="content">
            <div class="sidebar_right">
                <div class="right_content_top">
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;修改密码 </p>
                    <div class="kf">
                        <img src="/templets/New/images/kefu1.png" alt="图片加载不出来" />
                    </div>
                </div>
                <div class="wfjs" style="overflow: hidden;">
                    <table id="frm" border="0" cellspacing="0" cellpadding="0" width="100%" style="height: 400px;">
                        <tbody>
                            <tr>
                                <td align="right" class="auto-style4">选择：
                                </td>
                                <td >
                                    <asp:DropDownList ID="ddlSelect" runat="server">
                                        <asp:ListItem Text="修改登录密码" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="修改银行密码" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <span id="Span1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="auto-style4">原密码：
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                                </td>
                                <td>
                                    <span id="txtOldPassTip"></span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">新密码：
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                                </td>
                                <td>
                                    <span id="txtNewPassTip"></span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">确认新密码：
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewPass2" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                                </td>
                                <td>
                                    <span id="txtNewPass2Tip"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td colspan="2">
                                    <asp:Button ID="btnUpdate" Text="" runat="server" CssClass="btn1  bold" Style="width: 90px; height: 35px; background-image: url('/templets/New/images/btn_ok.jpg'); float: left; margin-right: 3px;"
                                        OnClick="btnUpdate_Click" />
                                    <input name="button" type="reset" class="btn1 bold" value="" hidefocus="true"
                                        style="width: 90px; height: 35px; background-image: url('/templets/images/btn_reset.jpg');" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
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
