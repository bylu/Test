<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="User_Sidebar.ascx.cs" Inherits="Game.Web.Themes.New.User_Sidebar" %>
<div class="UserSidebar_left">
    <div class="sidebar_left_1">
        <ul>
            <li>【本游戏适合十八岁以上的玩家】</li>
            <li>发布时间：2015年1月</li>
            <li>软件版本1.2.2.1</li>
             <li><a href="http://down.789game.net/download/789GameCenterNew.exe"><img src="/templets/New/images/1.gif" alt="789游戏中心大厅最新版下载" /></a></li>
            <li><a href="/down.aspx">
                <img src="/templets/New/images/2.gif" alt="789游戏平台下载" /></a></li>
            <li><a href="/register.html">
                <img src="/templets/New/images/3.gif" alt="棋牌游戏注册图标" /></a></li>
        </ul>
    </div>
    <div class="lanmu-list">
        <ul>
            <li><a href="/User/UserInfoCenter.aspx" id="UserInfoCenter">基本资料</a></li>
            <li><a href="/User/UpdateInfo.aspx" id="UpdateInfo">修改资料</a></li>
            <li><a href="/User/UpdateLoginPass.aspx"  id="UpdateLoginPass">修改密码</a></li>
            <li><a href="/User/ApplyPassProtect.aspx"  id="ApplyPassProtect">密码保护</a></li>
            <li><a href="/User/ResetInsurePass.aspx"  id="ResetLoginPass">找回密码</a></li>
            <li><a href="/User/RecordInsureList.aspx" id="RecordInsureList">交易记录</a></li>
			<li><a href="/User/BingUserPhone.aspx" id="BingUserPhone">绑定手机</a></li>
            <li><a href="/User/BingUserEmail.aspx" id="BingUserEmail">绑定邮箱</a></li>
			<!--
            <li><a href="/User/Spread.aspx" id="Spread">推广中心</a></li>
            <li><a href="/User/SpreadInfo.aspx" id="SpreadInfo">推广收益</a></li>-->
            <li>
                <asp:LinkButton ID="linkExit" runat="server" OnClick="linkExit_Click" OnClientClick="return confim();">安全退出</asp:LinkButton>
            </li>
        </ul>
    </div>

</div>
<div class="clear"></div>
<script type="text/javascript">
    function confim() {
        if (window.confirm('你确定要退出吗？')) {
            //alert("确定");
            return true;
        } else {
            //alert("取消");
            return false;
        }
    }

</script>


