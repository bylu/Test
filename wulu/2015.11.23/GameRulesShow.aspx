<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="GameRulesShow.aspx.cs" Inherits="Game.Web.GameRulesShow" %>

<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/Common_Left.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=gb2312" />
    <title id="Title1" runat="server"></title>
    <meta name="keywords" content="789游戏中心，棋牌游戏，789棋牌游戏，捕鱼游戏中心,金蟾捕鱼,李逵劈鱼,悟空闹海，四人牛牛" />
    <meta name="description" content="789游戏中心，提供多种捕鱼游戏和牛牛游戏，电玩厅捕鱼游戏金蟾捕鱼，悟空闹海，李逵劈鱼等捕鱼游戏，同时提供至尊斗牛,至尊两张，通比牛牛等热门棋牌游戏下载。789game游戏大厅，捕鱼游戏官方大厅，是你娱乐休闲的最佳选择。" />

    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/base.css" />
    <link rel="stylesheet" href="/templets/New/css/gameshow.css" />

</head>
<body>
    <form id="form1" runat="server">
        <!--导航栏  start-->
        <game:Header ID="header" runat="server" />
        <!--导航栏  end-->
        <div id="content">
            <div class="sidebar_right">
                <div class="right_content_top">

                    <p>&nbsp;&nbsp;当前位置：<a href="Index.aspx">首页&nbsp;</a>>&nbsp;<a href="GameIntroduction.aspx">游戏介绍</a>&nbsp;>&nbsp;<span runat="server" id="title"></span></p>

                    <div class="kf">
                        <img src="/templets/New/images/youxijieshao.jpg" alt="789游戏介绍" />
                    </div>
                </div>
                <div class="clear"></div>
                <div style="width: 100%; padding-top: 40px; display: block;letter-space:2px; line-height:27px;">
                    <h1 class="dzpk"><%= kindName %></h1>
                    <span class="biaotilan">游戏截图</span>
                    <p class="marg">
                        <img alt='<%= kindName %>' src='<%= imgRuleUrl %>' style="width: 670px; height: 432px;" />
                    </p>
                    <span class="biaotilan">游戏简介</span>
                    <p class="marg"><%= helpIntro %></p>
                    <span class="biaotilan">规则介绍</span>
                    <%= helpRule %>
                    <!-- /wrap -->
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
