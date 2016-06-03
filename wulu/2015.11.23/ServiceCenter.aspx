<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="ServiceCenter.aspx.cs" Inherits="Game.Web.ServiceCenter" %>

<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/Common_Left.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客服中心 - 789游戏中心_789棋牌游戏官网_捕鱼游戏下载_牛牛游戏下载_电玩捕鱼</title>
    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/base.css" />
    <link rel="stylesheet" href="/templets/New/css/kefucenter.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!--导航栏  start-->
        <game:Header ID="header" runat="server" />
        <!--导航栏  end-->
        <div id="content">
            <div class="sidebar_right">
                <div class="right_content_top">

                    <p>&nbsp;&nbsp;当前位置：<a href="Index.aspx">首页</a>&nbsp;>&nbsp;<a href="ServiceCenter.aspx">客服中心</a></p>

                    <div class="kf">
                        <img src="/templets/New/images/kefu1.png" alt="图片加载不出来" />
                    </div>
                </div>
                <div>
                <p>
                    <img src="/templets/New/images/kefucenter.png" alt="图片加载不出来" style="margin-top: 15px;" />
                </p>
                <div class="contens_cominfo">
                    <div class="company_map">
                        <img src="/templets/New/images/map.png" alt="图片加载不出来" />
                        <p>
                            <div class="c_weizhi">
                                <img src="/templets/New/images/weizhi.png" alt="图片加载不出来" />
                            </div>
                            <div class="c_dizhi">
                                <img src="/templets/New/images/companydizhi.png" alt="图片加载不出来" />
                            </div>
                        </p>
                    </div>
                    <div class="company_alllianxin">
                        <p>
                            <div class="c_allinfo_qq">
                                <img src="/templets/New/images/qq.png" alt="图片加载不出来" />
                            </div>

                            <div class="c_allinfo_qq_num">
                                <img src="/templets/New/images/qqnumber.png" alt="图片加载不出来" />
                            </div>
                        </p>
                        <p>
                            <div class="c_allinfo_phone">
                                <img src="/templets/New/images/phone.png" alt="图片加载不出来" />
                            </div>
                            <div class="c_allinfo_phone_num">
                                <img src="/templets/New/images/phonenumber.png" alt="图片加载不出来" />
                            </div>
                        </p>
                        <p>
                            <div class="c_allinfo_weibo">
                                <img src="/templets/New/images/weibo.png" alt="图片加载不出来" />
                            </div>
                            <div class="c_allinfo_weibo_num">
                                <img src="/templets/New/images/guanfangweibo.png" alt="图片加载不出来" />
                            </div>
                        </p>
                        <p>
                            <div class="c_allinfo_weixin">
                                <img src="/templets/New/images/weixin.png" alt="图片加载不出来" />
                            </div>
                            <div class="c_allinfo_qweixin_num">
                                <img src="/templets/New/images/weixinerweima.png" alt="图片加载不出来" />
                            </div>
                        </p>
                        <p>
                            <div class="erweisaomiao">
                                <img src="/templets/New/images/erwima.png" alt="图片加载不出来" />
                            </div>
                        </p>
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
