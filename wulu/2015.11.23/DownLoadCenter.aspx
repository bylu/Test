<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="DownLoadCenter.aspx.cs" Inherits="Game.Web.New.DownLoadCenter" %>

<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/Common_Left.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>789游戏中心</title>
    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/base.css" />
    <link rel="stylesheet" href="/templets/New/css/download.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!--导航栏  start-->
        <game:Header ID="header" runat="server" />
        <!--导航栏  end-->
        <div id="content">
            <div class="sidebar_right">
                <div class="right_content_top">

                    <p>&nbsp;&nbsp;当前位置：<a href="Index.aspx">首页&nbsp;</a>>&nbsp;<a href="DownLoadCenter.aspx">游戏下载</a> </p>

                    <div class="kf">
                        <img src="/templets/New/images/kefu1.png" alt="图片加载不出来" />
                    </div>
                </div>
                <div class="right_content_xiazai">

                    <div class="info">
                        <div class="xz">
                            <img src="/templets/New/images/789youxixiazai.png" alt="图片加载不出来" />
                        </div>
                        <div class="right_content_xiazaijieshao">
                            <img src="/templets/New/images/789game.png" alt="图片加载不出来" />
                        </div>
                        <div class="right_content_xiazaijie">
                            <p>
                                <a>
                                    <img src="/templets/New/images/jingjianxiazai.png" alt="图片加载不出来" /></a>
                            </p>
                            <p>系统支持：WINXP/Vista/7以上&nbsp;&nbsp;&nbsp;&nbsp;版本号：1.00</p>
                            <p>
                                <a>
                                    <img src="/templets/New/images/wanzhnegxiazai.png" alt="图片加载不出来" /></a>
                            </p>
                            <p>系统支持：WINXP/Vista/7以上&nbsp;&nbsp;&nbsp;&nbsp;版本号：1.00</p>
                        </div>
                    </div>
                    <div class="right_content_jieshao">
                        <h3>&nbsp;&nbsp;&nbsp;789Game是一家拥有自主游戏开发的网络游戏公司,专业的棋牌游戏开发商,可提供android手机游戏开发,网页游戏开发,flash游戏开发,还可以为你量身定做区域型的棋牌游戏,可以针对客户需求开发适合网络,网页,手机端,客户端的不同类型的棋牌游戏,满足不同用户的需求,大大提高游戏的用户体验。</h3>
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
