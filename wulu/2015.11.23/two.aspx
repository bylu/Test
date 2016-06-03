<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Game.Web.Index" %>
<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/Common_Left.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=gb2312" />
    <title>789游戏中心官方网站,国内最权威的棋牌游戏大厅下载首选789棋牌游戏</title>
    <meta name="keywords" content="789游戏中心，棋牌游戏，789棋牌游戏，捕鱼游戏中心,金蟾捕鱼,李逵劈鱼,悟空闹海，四人牛牛" />
    <meta name="description" content="789游戏中心，提供多种捕鱼游戏和牛牛游戏，电玩厅捕鱼游戏金蟾捕鱼，悟空闹海，李逵劈鱼等捕鱼游戏，同时提供至尊斗牛,至尊两张，通比牛牛等热门棋牌游戏下载。789game游戏大厅，捕鱼游戏官方大厅，是你娱乐休闲的最佳选择。" />
    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/base.css" />
    <link rel="stylesheet" href="/templets/New/css/index.css" />
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/SetCookie.js" type="text/javascript"></script>

         <script type="text/javascript">
		 	 window.onerror=function(){return true }
             $(document).ready(function() {
                 showlist();
             });
    </script>
    <script type="text/javascript">
        function showlist() {
            $("#shownoticeandnew p").hover(function() {
                $(this).css("color", "#FFFFFF");
                $(this).css("background-color", "#15A6FF");
            }, function() {
                $(this).css("color", "#046091");
                $(this).css("background-color", "#FFFFFF");
            });
            $("#shownoticeandnew").find("p").each(
             function(index, data) {
                 $(data).bind("mouseover", function() {
                     $("#list" + (index + 1)).css("display", "block");
                     $("#list" + (index + 1)).siblings().css("display", "none");
                 });
             });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
  <div id="header">
	<div style="width:auto;position:absolute;height:80px;z-index:999;left:70%;top:8px;"><img src="/templets/New/images/2weima-3.png" alt="微信关注789游戏最新游戏咨询一手掌握" title="微信关注789游戏最新游戏咨询一手掌握" /></div>
    <div class="logo">
    </div>
    <div class="ad"></div>
    <div class="clear"></div>
    <div class="nav">
        <div class="navbar">
           
           <ul class="nav_link left">
                <li style="width: 100px;">
                    <img src="/templets/New/images/home.png" alt="" style="margin-right: 5px; margin-top:-8px;" /><a href="/Index.aspx">首页</a>
                <li><a href="/NewsList.aspx">新闻公告</a>
                <li><a href="/GameIntroduction.aspx">游戏介绍</a>
                <li><a href="http://pay.789game.com:8199" target="_blank">充值中心</a>
                <li><a href="/download.html">下载中心</a>
                <li><a href="/User/UserInfoCenter.aspx">用户中心</a>
                <li style="background: none"><a href="/xinshoubangzhu.html">新手帮助</a>
            </ul>
			
            <ul class="nav_ico right">
                <li><a href="/Login.aspx" id="login">
                    <img src="/templets/New/images/login.jpg" alt="登录" /></a></li>
                <li><a href="#" id="weixin">
                    <img src="/templets/New/images/weixin.jpg" alt="微信" /></a></li>
                <li><a href="#" id="weibo">
                    <img src="/templets/New/images/weibo.jpg" alt="新浪微博" /></a></li>
            </ul>
        </div>
    </div>
</div>
        <div id="content">
            <div class="sidebar_right">
                <div class="big-pic" id="focus">
                    <ul>
					<li><a href="http://www.789game.com/Wishing" target="_blank">
                            <img src="/templets/new/images/xys.jpg" /></a></li>
						<!--<li><a href="/mallActivity/index.html" target="_blank">
                            <img src="/templets/new/images/ssy.jpg" /></a></li>	-->
							
						
					
					<li><a href="/GameRulesShow.aspx?XID=2040" target="_blank">
                            <img src="/templets/new/images/lkjcWeb.jpg" /></a></li>
			<li><a href="http://www.789game.com/GameRulesShow.aspx?XID=203" target="_blank">
                            <img src="/templets/new/images/shzWeb.jpg" /></a></li>
			<li><a href="#" target="_blank">
                            <img src="/templets/new/images/sstxWeb.jpg" /></a></li>
                         
                    </ul>
                </div>
                <style>
                .shownewgtitle{height:30px; width:100%; border-bottom:1px solid #75a4c7;}
                .shownewgtitle p{float:left;padding: 5px 0 5px 10px; font-size:14px; width:60px; height:18px;}
                 .shownewgtitle a{float: right;height:20px; font-weight:bold; padding: 5px 0 5px 10px;font-size: 12px;margin-top: 5px;margin-right: 7px;color: #87bdfa;}
                </style>
                <div class="content_allInfo">
                    <div class="info_news">
                        <%--<h3><a href="NewsList.aspx">更多>></a></h3> <h3>新闻资讯<a href="NewsList.aspx"></a>/h3>--%>
                        <div class="shownewgtitle" id="shownoticeandnew">
                           <p>新闻公告</p>
                           <p>游戏资讯</p>
                           <a href="NewsList.aspx">更多>></a>
                         </div> 
                         <div>
                        <ul id="list1">
                            <asp:Repeater ID="rptNoticesList" runat="server">
                                <ItemTemplate>
                                    <li class="showgonggao">
                                        <a href='NewsShow.aspx?XID=<%# Eval("NewsID") %>' title='<%# Eval("Subject")%>'><%# Eval("Subject")%></a>
                                        <span><%# Eval("IssueDate","{0:yyyy-MM-dd}")%></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                          
                        </ul>
                        <ul style="display:none;" id="list2">
                             <asp:Repeater ID="RepeaterNotice" runat="server">
                                <ItemTemplate>
                                    <li class="shownews">
                                        <a href='NewsShow.aspx?XID=<%# Eval("NewsID") %>' title='<%# Eval("Subject")%>'><%# Eval("Subject")%></a>
                                        <span><%# Eval("IssueDate","{0:yyyy-MM-dd}")%></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        </div>
                    </div>
                    <div class="info_question">
                        <h3><a href="QuestionList.aspx">更多>></a></h3>
                        <ul>
                            <asp:Repeater ID="rptQuestion" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href='QuestionView.aspx?XID=<%# Eval("IssueID") %>' title='<%# Eval("IssueTitle")%>'><%# Eval("IssueTitle")%></a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <div class="content_allGame">
                    <h3><a href="GameIntroduction.aspx">更多>></a></h3>
                    <div class="colborder">
                        <div id="tab_2_1">
                            <div class="leftLoop leftLoop1">
                                <div class="hd">
                                    <a class="next"></a>
                                    <a class="prev"></a>
                                </div>
                                <div class="bd bd1">
                                    <ul class="picList">
                                        <asp:Repeater ID="rptTopGame" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <div class="pic">
                                                        <a href='GameRulesShow.aspx?XID=<%# Eval("KindID") %>' title='<%# Eval("KindName")%>' target="_blank">
                                                            <img src='<%# Eval("ImgIndexUrl") %>' alt='<%# Eval("KindName")%>'></a>
                                                    </div>
                                                   <div class="title"><a href='GameRulesShow.aspx?XID=<%# Eval("KindID") %>' title='<%# Eval("KindName")%>' target="_blank"><%# Eval("KindName")%></a></div>

                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <game:User_Left ID="user_left" runat="server" />
            <div id="content_footContent">
                <span style="font: 16px bold;">友情链接:</span>
                <asp:Repeater ID="rptLink" runat="server">
                    <ItemTemplate>
                            <span><a href='<%# Eval("LinksUrl") %>' target="_blank">
                                <%# Eval("LinksName") %></a></span>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <game:Footer ID="Footer" runat="server" />
		
    </form>
  
    <script type="text/javascript" src="/js/jquery.SuperSlide.js"></script>
    <script type="text/javascript">
        $(function () {
            var sWidth = $("#focus").width();
            var len = $("#focus ul li").length;
            var index = 0;
            var picTimer;

            var btn = "<div class='btnBg'></div><div class='btn'>";
            for (var i = 0; i < len; i++) {
                btn += "<span></span>";
            }
            btn += "</div>";
            $("#focus").append(btn);
            $("#focus .btnBg").css("opacity", 0);

            $("#focus .btn span").css("opacity", 0.4).mouseover(function () {
                index = $("#focus .btn span").index(this);
                showPics(index);
            }).eq(0).trigger("mouseover");

            $("#focus ul").css("width", sWidth * (len));

            $("#focus").hover(function () {
                clearInterval(picTimer);
            }, function () {
                picTimer = setInterval(function () {
                    showPics(index);
                    index++;
                    if (index == len) { index = 0; }
                }, 4000)
            }).trigger("mouseleave");

            function showPics(index) {
                var nowLeft = -index * sWidth;
                $("#focus ul").stop(true, false).animate({ "left": nowLeft }, 300);
                $("#focus .btn span").stop(true, false).animate({ "opacity": "0.4" }, 300).eq(index).stop(true, false).animate({ "opacity": "1" }, 300);
            }
        });
        jQuery(".leftLoop1").slide({ mainCell: ".bd1 ul", effect: "leftLoop", vis: 6, scroll: 1, autoPlay: true });
    </script>

<script src="/common/lib/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="/common/css/ui-dialog.css">
<script src="/common/dist/dialog-min.js"></script>
<script>
var d = dialog({
    title: '789游戏中心2014年12月9日维护公告',
	width:660,
    content: "<div>尊敬的789游戏用户:<br/><p style='text-indent:30px;'>789游戏中心为了更好的为游戏用户服务,特决定将于2014年12月9日0:00--2014年12月9日1:30进行维护，维护时间为1小时30分钟，给您造成的不便，敬请谅解.</p><p style='margin-top:300px; text-align:right;'>789游戏中心运营团队<br/><br/>2014年12月8日</p></div>",
	 okValue: '确定',
    ok: function () {
        return true;
    },
});
d.show();
</script>
</body>
</html>
