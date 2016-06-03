<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Game.Web.Index" %>
<%@ Register TagPrefix="game" TagName="Header" Src="~/Themes/New/Common_Header.ascx" %>
<%@ Register TagPrefix="game" TagName="User_Left" Src="~/Themes/New/Common_Left.ascx" %>
<%@ Register TagPrefix="game" TagName="Footer" Src="~/Themes/New/Common_Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=gb2312" />
    <title>789游戏中心唯一官方网站</title>
    <meta name="keywords" content="789游戏中心,789游戏中心官网" />
    <meta name="description" content="本站为789游戏中心唯一官方网站，789游戏中心为您提供多种捕鱼游戏和牛牛游戏；789捕鱼游戏优势: 注册送金币 | 24小时礼物兑换；789游戏中心极佳信誉的游戏中心,经典刺激的游戏中心,十万玩家同时在线.789游戏中心24小时兑换奖品!" />
    <link rel="stylesheet" href="/templets/New/css/reset.css" />
    <link rel="stylesheet" href="/templets/New/css/base.css" />
    <link rel="stylesheet" href="/templets/New/css/index.css" />
	<link rel="stylesheet" href="/templets/New/css/cs_q.css" type="text/css"/>
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
         <script type="text/javascript">
		 
		 window.onerror=function(){return true }
           
    </script>
    <script type="text/javascript">
		var ua = navigator.userAgent;
	var ipad = ua.match(/(iPad).*OS\s([\d_]+)/);
	var	isIphone = !ipad && ua.match(/(iPhone\sOS)\s([\d_]+)/);
	var	isAndroid = ua.match(/(Android)\s+([\d.]+)/);
	var	isMobile = isIphone || isAndroid;
		if(isMobile) {
			window.location.href = '/wap/index.html';
		}
	
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
				<li><a href="http://union.789game.com">合作推广</a>
				<li style="width:110px;"><a href="http://buyu.789game.com" target="_blank">街机千炮捕鱼</a></li>
                <li style="background: none"><a href="http://shuihu.789game.com" target="_blank">百易水浒传</a></li>
                <!--<li style="background: none"><a href="/xinshoubangzhu.html">新手帮助</a>-->
            </ul>
			<!--
            <ul class="nav_ico right">
                <li><a href="/Login.aspx" id="login">
                    <img src="/templets/New/images/login.jpg" alt="登录" /></a></li>
                <li><a href="#" id="weixin">
                    <img src="/templets/New/images/weixin.jpg" alt="微信" /></a></li>
                <li><a href="#" id="weibo">
                    <img src="/templets/New/images/weibo.jpg" alt="新浪微博" /></a></li>
            </ul>-->
        </div>
    </div>
</div>
        <div id="content">
            <div class="sidebar_right">
                <div class="big-pic" id="focus">
                    <ul>
					<li><a href="http://www.789game.com/old_player_come/index.html" target="_blank">
                            <img src="/templets/new/images/wjhg.jpg" alt="水浒传" /></a></li>
					<li><a href="http://www.789game.com/NewsShow.aspx?XID=2006" target="_blank">
                            <img src="/templets/new/images/jjshz.jpg" alt="水浒传" /></a></li>		
					
					<li><a href="http://www.789game.com/NewsShow.aspx?XID=1750" target="_blank">
                            <img src="/templets/new/images/banner4.jpg" alt="789客服回访" /></a></li>
			<li><a href="http://www.789game.com/GameRulesShow.aspx?XID=203" target="_blank">
                            <img src="/templets/new/images/shzWeb.jpg" alt="街机水浒传" /></a></li>
			<li><a>
                            <img src="/templets/new/images/sstxWeb.jpg" alt="四大捕鱼游戏" /></a></li>
                         
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
			<!--玩家风采-->
		<div class="userpriceinfo">
			<div class="messages"><p>玩家真人秀</p><label>789游戏中心玩家真人秀活动火热进行中，<a href="http://www.789game.com/NewsShow.aspx?XID=799" style="color:red;cursor:pointer; text-decoration:underline;">点击查看详情!</a></label></div>
			<div class="leftLoop leftLoop1 infopic">
                <div class="hd">
                    <a class="next" style="height:205px;margin-left:15px;margin-right:0px;"></a>
                    <a class="prev" style="height:205px;margin-right:20px;"></a>
                </div>
                <div class="bd bd2" style="float:left;">
                    <ul class="picList piclists">
                        <li><img src="/templets/New/images/1/1.jpg" alt="789游戏中心真人秀" /></li>
						<li><img src="/templets/New/images/1/2.jpg" alt="789金蟾捕鱼玩家秀" /></li>
						<li><img src="/templets/New/images/1/3.jpg" alt="789玩家奖品合影" /></li>
						<li><img src="/templets/New/images/1/4.jpg" alt="李逵劈鱼游戏玩家合影" /></li>
						<li><img src="/templets/New/images/1/5.jpg" alt="大圣闹海玩家真人秀" /></li>
						<li><img src="/templets/New/images/1/6.jpg" alt="新金蟾捕鱼游戏玩家秀" /></li>
						<li><img src="/templets/New/images/1/7.jpg" alt="789平台大厅玩家礼品合影" /></li>						
						<li><img src="/templets/New/images/1/10.jpg" alt="789捕鱼中心玩家合影" /></li>		
						<li><img src="/templets/New/images/1/9.jpg" alt="游戏玩家真人秀" /></li>	
						<li><img src="/templets/New/images/1/8.jpg" alt="游戏玩家真人秀"/></li>							
						<li><img src="/templets/New/images/1/11.jpg" alt="游戏玩家真人秀"/></li>							
						<li><img src="/templets/New/images/1/12.jpg" alt="游戏玩家真人秀"/></li>							
						<li><img src="/templets/New/images/1/13.jpg" alt="游戏玩家真人秀"/></li>							
						<li><img src="/templets/New/images/1/14.jpg" alt="游戏玩家真人秀"/></li>						
					</ul>
				</div>
			</div>
        </div>
		
		<div class="familyCare">
			<p style="font-size:16px;padding:0px 15px 0px 35px;font-weight:bolder;"> 健康公告：</p>
			<p>
				抵制不良游戏&nbsp;&nbsp;拒绝盗版游戏&nbsp;&nbsp;注意自我保护&nbsp;&nbsp;谨防受骗上当
				&nbsp;&nbsp;适当游戏益脑&nbsp;&nbsp;沉迷游戏伤身&nbsp;&nbsp;合理安排时间&nbsp;&nbsp;健康享受生活
			</p>
		</div>
		
            <div id="content_footContent">
				<!--<span style="display:none;">友情链接:</span>
                <div style="display:none;">
				<asp:Repeater ID="rptLink" runat="server">
                    <ItemTemplate>
						<a  style="font-size:12px;line-height:20px;margin-right:10px;" target="_blank;" href='<%# Eval("LinksUrl") %>'><%# Eval("LinksName") %></a>
                    </ItemTemplate>
                </asp:Repeater>		
				</div>-->
			
				<div class="linkName">
					<ul>
						<li class="active">友情链接</li>
						<li class="">合作伙伴</li>
						<li class="">商务合作</li>
						<li class="">更多链接</li>
					</ul>
					<span style="float:right;padding-top:5px;">
						<a target="_block" href="http://wpa.qq.com/msgrd?v=3&amp;uin=306637906&amp;site=qq&amp;menu=yes">申请友情链接QQ 306637906</a>
					</span>
				</div>
                <div class="linkContent">
					<div style="display: block;">
						 <a href="http://www.789game.com/qipai" target="_blank">789棋牌游戏</a>
						 <a href="http://www.wanyouxi.com/ " target="_blank">玩游戏</a> 
						 <a href="http://sm.ahgame.com" target="_blank">神之浩劫</a> 
						 <a href="http://youxi.qipaoxian.com" target="_blank">儿童游戏</a>				  
						  <a href="http://www.mamumall.com" target="_blank"> 梦幻西游礼包</a> 						  						  
						  <a href="http://apk.3310.com/" target="_blank"> 安卓市场</a>  </span> 
						  <a href="http://game.anruan.com" target="_blank">安卓游戏免费下载</a>  
						  <a href="http://www.wuji.com/" target="_blank">无极游戏</a> 
						  <a href="http://www.danji100.com" target="_blank">单机游戏</a>  
						  <a href="http://www.oo6s.com" target="_blank">梦幻西游2礼包</a> 
						  <a href="http://fb.tuwan.com/" target="_blank">风暴英雄</a>  
						  <a href="http://mhxy.sjwyx.com/" target="_blank">梦幻西游</a>  
						  <a href="http://www.3wmm.com" target="_blank">mm小游戏</a>  
						  <a href="http://www.laozu.com" target="_blank">老祖单机游戏网</a>  
						  <a href="http://youxi.qipaoxian.com" target="_blank">儿童小游戏</a> 
						  <a href="http://top.07073.com" target="_blank">网页游戏排行榜</a>  
						  <a href="http://www.qiyouwang.com" target="_blank"> 最新网络游戏</a>
						  <a href="http://www.592xyx.com/" target="_blank"> 好玩的小游戏</a>  
						  <a href="http://www.luxiaozi.com" target="_blank"> 很太吧游戏 </a>  
						  <a href="http://www.haimawan.com" target="_blank"> 海马玩 </a>    
						  <a href="http://www.599z.com/" target="_blank"> 吾久游戏网 </a>    
						  <a href="http://www.789buyuyouxi.com" target="_blank"> 捕鱼游戏下载  </a>    
						  <a href="http://www.789games.com" target="_blank">789游戏中心</a>  		
						  <a href="http://www.shouyoudao.com" target="_blank">手游岛模拟器</a>  
						  <a href="http://wows.duowan.com/" target="_blank">战舰世界</a>  							
						  <a href="http://www.2147.cn" target="_blank">双人小游戏 </a>  					
						  <a href="http://www.8477.com/" target="_blank">8477手游网 </a> 						
						  <a href="http://www.xxzs.tv/" target="_blank">安卓模拟器 </a> 	   					
						  <a href="http://xiaoyouxi.114la.com" target="_blank">114啦小游戏</a>  
						  <a href="http://pack.gao7.com/" target="_blank">手游礼包</a>  	
						  <a href="http://www.3699.cc/" target="_blank">3699小游戏</a>   
						  <a href="http://www.0909wan.com " target="_blank">好玩的网页游戏 </a>   
						  <a href="http://www.880you.com/" target="_blank">页游开服表</a>  
						  <a href="http://www.wankr.com.cn/video" target="_blank">手机游戏视频</a> 
						  <a href="http://www.gaoshouyou.com/" target="_blank">高手游</a>  
						  <a target="_blank;" href='http://www.pgbee.com/'/>蜂游网</a>
						  <a href="http://www.wotoo.cc/" target="_blank">小游戏</a>  
						  <a target="_blank;" href='http://q.eoemarket.com/'/>手游助手</a>
						  <a target="_blank;" href='http://ow.tgbus.com/'/>守望先锋</a>
						  <a target="_blank;" href='http://www.itutu.tv/'/>手游录屏</a>
						  <a href="http://www.eeyy.cc/" target="_blank">一游网</a>   
						  <a href="http://bbs.banma.com/" target="_blank">手游论坛</a>  
						  <a href="http://gcld.602.com" target="_blank"> 攻城掠地 </a>  
						  <a href="http://www.jisule.com/" target="_blank">安卓软件下载</a>   
						  <a href="http://www.00791.com/" target="_blank">360手机助手</a>   
						  <a href="http://www.duouoo.com/" target="_blank">多游网</a>   
						  <a href="http://www.veeqi.com/" target="_blank">手机游戏 </a>  
						  <a href="http://www.wanwan88.com" target="_blank"> 玩玩88游戏论坛 </a> 
						  <a href="http://www.fixdown.com/" target="_blank">软件下载</a>   
						  <a href="http://www.w707.com/" target="_blank">w707网页游戏</a>  
						  <a href="http://www.11320.com" target="_blank">棋牌游戏</a>  
						  <a href="http://www.3xiazai.com" target="_blank">独木成林</a>
						  <a href="http://wiki.joyme.com" target="_blank">迷WIKI</a>
						  <a href="http://www.qiguo.com" target="_blank">安卓游戏 </a>
					</div>
					<div style="display: none;">
						    <a href="http://www.aiaiu.com/" target="_blank">爱爱游</a>  
						    <a href="http://www.65yx.com/" target="_blank">单机游戏下载</a>   
						    <a href="http://qqmc.qt263.cn" target="_blank">cf单机版</a>   
						    <a href="http://www.h7k7k.com/" target="_blank">游戏下载</a>  
						    <a href="http://www.sd116.com/" target="_blank">女生小游戏</a>      
						    <a href="http://www.9199.com" target="_blank">9199游戏</a>  
						    <a href="http://www.79u.com/" target="_blank">79u游戏平台</a>  
						    <a href="http://www.98xianyou.com" target="_blank">好玩的网页游戏</a>   
					</div>
					<div style="display: none;">
						    <a href="http://www.kengwan.com" target="_blank">坑玩</a>   
						    <a href="http://fytx.sjwyx.com/" target="_blank">风云天下</a>      
						    <a href="http://www.51lieyou.com/" target="_blank">网络游戏</a>  
						    <a href="http://www.ok11.com" target="_blank">OK11小游戏</a>   
						    <a href="http://game.ss256.com/" target="_blank">7k7k小游戏</a>   
						    <a href="http://www.525game.com/" target="_blank">美女小游戏</a>   
						    <a href="http://www.88jh.com" target="_blank">文字江湖</a>   
						    <a href="http://www.romdu.com/" target="_blank">rom之家</a>   
						    <a href="http://www.37nixi.com/" target="_blank">37逆袭</a>    
						    <a href="http://my.mofang.com/" target="_blank">梦幻西游手游</a>
						    <a href="http://xin.gao7.com/" target="_blank">最新手机游戏</a>  
						
						    <a href="http://www.xiouou.com/" target="_blank">游戏新闻网</a>    
						    <a href="http://www.91game.com/" target="_blank">手机网游推荐</a>  						  				  
						    <a href="http://www.61k.com/" target="_blank">61K手游网</a>    						  
						    <a href="http://www.99071.com/" target="_blank">传奇网页游戏</a>    
						    <a href="http://www.wanzhuanle.com" target="_blank">游戏试玩</a>   
					</div>
					<div style="display: none;">
						  <a href="http://www.5664.cn" target="_blank">小游戏 </a>  
						  <a href="http://www.shouyou520.com/" target="_blank">爱手游网</a>   
						  <a href="http://nnhysj.mofang.com/" target="_blank">暖暖环游世界</a> 
						  <a href="http://www.6637.com" target="_blank">6637网页游戏</a>    
						  <a href="http://nnhysj.mofang.com/" target="_blank">魔方网暖暖环游世界</a>  
					</div>
				</div>
            </div>
			
        </div>
        <game:Footer ID="Footer" runat="server" />
		
    </form>
  <style>
  #banners {margin-top:-50px;}
	#banners .hd {margin-top:-15px;width:100%;float:left;}
#banners .hd ul {width: 555px;z-index: 100; position: absolute; left: 45%; }
#banners .hd ul li {float: left; width: 11px; height: 11px; background-color: #fff; overflow: hidden; text-indent: -9999px; border-radius:6px;cursor:pointer; opacity: 0.5;filter: alpha(opacity=50); cursor: pointer;}
#banners .hd ul li.on {opacity: 1;filter: alpha(opacity=100);}
	</style>
	<div  style="position:absolute;width:200px;top:340px;">
	<div id="ad_right" style="position:fixed;width:142px;height:327px;z-index:8886;">
		<a style="float:right;position:absolute;left:145px;margin-left:-20px;width:17px;height:17px;background:url(images/close1.png) no-repeat;z-index:8888;" id="closeleftbar" href="javascript:void(0);"></a>
		<div class="leftLoops leftLoop1"  style="z-index:8887" id="banners">
			<div  class="bd bd3">
				<ul class="picLists">
					<li>
						<a href="http://www.789game.com/NewsShow.aspx?XID=439" target="_blank" style="width:100%;float:left;text-align:center;margin-top:50px;">
							<img src="images/001leftQP.jpg" width="142" height="327" alt="" title="" /></a>
						</a>
					</li>
					<li>
						<a href="http://www.789game.com/NewsShow.aspx?XID=2006" target="_blank" style="width:100%;float:left;text-align:center;margin-top:50px;">
							<img src="images/sh.jpg" width="142" height="327" alt="" title="" /></a>
						</a>
					</li>
				</ul>
			</div>
			<div class="hd">
				<ul></ul>
			</div>
		</div>
	</div>
    <script type="text/javascript" src="/js/jquery.SuperSlide.js"></script>
		<!--<script type="text/javascript" src="/js/ad.js"></script> -->
		
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
	 jQuery(".leftLoop1").slide({ mainCell: ".bd2 ul", effect: "leftLoop", vis: 4, scroll: 1, autoPlay: true });
	 jQuery("#banners").slide({titCell:".hd ul",mainCell:".bd3 ul",effect:"leftLoop",autoPlay:true,autoPage:true,vis:1,scroll:1,trigger:"click",interTime:3000});
    </script>

 <script type="text/JavaScript">
	 $(document).ready(function(){
	   showlist();
	   var tab_li = $(".linkName ul li");
		tab_li.click(function () {
			$(this).addClass("active").siblings().removeClass("active");
				var index = tab_li.index(this);
				$("div.linkContent  > div").eq(index).show().siblings().hide();
			});
			
			$("#closeleftbar").click(function(){
			$("#ad_right").css("display","none");
		});
        });
 </script>

</body>
</html>
