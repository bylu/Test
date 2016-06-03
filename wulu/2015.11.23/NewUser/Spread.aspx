<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Spread.aspx.cs" Inherits="Game.Web.NewUser.Spread" %>

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
    <script type="text/javascript">
        function load() {
            document.getElementById("Spread").className = "lanmu-list_default";
        }
    </script>
</head>
<body onload="load()">
    <!--导航栏  start-->
    <game:Header ID="header" runat="server" />
    <!--导航栏  end-->
    <div id="content">
        <div class="sidebar_right">
            <div class="right_content_top">
                <p>&nbsp;&nbsp;当前位置：首页>&nbsp;推广中心 </p>
                <div class="kf">
                    <img src="/templets/New/images/kefu1.png" alt="图片加载不出来" />
                </div>
            </div>
            <div class="wfjs" style="overflow: hidden; min-height: 650px;">
                <form id="form2" runat="server">
                    <div style="font-size: 13px; height: 150px; padding-top: 20px;">
                        <span style="margin-right: 10px; margin-left: 15px;">尊敬的用户,你的推广链接为:</span><br />
                        <br />
                        <span style="margin-left: 80px; margin-top: 20px;">
                            <asp:Label ID="spreadLink" runat="server" Text="" Style="color: #28b2dc; font-size: 25px;">
                            </asp:Label>
                        </span>
                    </div>

                    <div style="width: 100%; height: 400px; margin-top: 40px; font-size: 15px; padding-left: 15px;">
                        推广规则：<br />
                        <div style="margin-left: 40px;">
                            <p>第一步：复制您的推广链接地址；</p>
                            <p>第二步：将您的推广链接地址通过QQ、微博、论坛、博客等方式发送给您的好友；</p>
                            <p>第三步：您的好友通过您的推广链接地址注册成为789游戏会员；</p>
                            <p>第四步：推广奖励在“推广收益”领取；</p>
                            <p style="color: Red; font-size: 13px;">说明：此活动解释权归官方所有</p>
                        </div>
                    </div>


                </form>
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
