<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateLoginPass.aspx.cs" Inherits="Game.Web.User.UpdateLoginPass" %>

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
        function hintMessage(hintObj,error,message){
            //删除样式
            if(error=="error"){
                $("#"+hintObj+"").removeClass("rightTips");
                $("#"+hintObj+"").addClass("wrongTips");
            }else{
                $("#"+hintObj+"").removeClass("wrongTips");
                $("#"+hintObj+"").addClass("rightTips");
            }
    	
            $("#"+hintObj+"").html(message);
        }
    
        function checkPass(){
            if($("#txtOldPass").val()==""){
                hintMessage("txtOldPassTip","error","请输入您的原始密码!");
                return false;
            }
            if($("#txOldtPass").val().length<6||$("#txtPass").val().length>32){
                hintMessage("txtOldPassTip","error","原始密码长度为6到32个字符!");
                return false;
            }
            hintMessage("txtOldPassTip","right","");
            return true;
        }
    
        function checkNewPass(){
            if($("#txtNewPass").val()==""){
                hintMessage("txtNewPassTip","error","请输入您的新密码!");
                return false;
            }
            if($("#txtNewPass").val().length<6||$("#txtNewPass").val().length>32){
                hintMessage("txtNewPassTip","error","新密码长度为6到32个字符!");
                return false;
            }
            hintMessage("txtNewPassTip","right","");
            return true;
        }
    
        function checkConPass(){
            if($("#txtNewPass2").val()==""){
                hintMessage("txtNewPass2Tip","error","请输入您的确认密码!");
                return false;
            }
            if($("#txtNewPass2").val()!=$("#txtNewPass").val()){
                hintMessage("txtNewPass2Tip","error","确认密码与新密码不一致，请重新输入!");
                return false;
            }
            hintMessage("txtNewPass2Tip","right","");
            return true;
        }
    
        function checkInput(){
            if(!checkPass()){ $("#txtOldPass").focus();return false; };
            if(!checkNewPass()){ $("#txtNewPass").focus();return false; };
            if(!checkConPass()){ $("#txtNewPass2").focus();return false; };
        }
    
        $(document).ready(function(){
            $("#txtOldPass").blur(function(){ checkPass()});
            $("#txtNewPass").blur(function(){ checkNewPass()});
            $("#txtNewPass2").blur(function(){ checkConPass()});
        
            $("#btnUpdate").click(function(){ return checkInput(); });
            $("#UpdateLoginPass").addClass("lanmu-list_hover");
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
                    <p>&nbsp;&nbsp;当前位置：首页>&nbsp;修改密码 </p>
                    <div class="kf">
                        <img src="/templets/New/images/userinfo.jpg" alt="图片加载不出来" />
                    </div>
                </div>
                <div class="wfjs" style="overflow: hidden;">
                    <div class="formbox">
                        <h3>修改密码</h3>
                        <div class="item">
                            <span class="label">选择：</span>
                            <div class="fl">
                                <asp:DropDownList ID="ddlSelect" runat="server">
                                    <asp:ListItem Text="修改登录密码" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="修改保险柜密码" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="clear"></span>

                            </div>
                        </div>
                        <!--item end-->


                        <div class="item">
                            <span class="label">原密码：</span>
                            <div class="fl">
                                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                                <span id="txtOldPassTip"></span>
                                <span class="clear"></span>

                            </div>
                        </div>
                        <!--item end-->

                        <div class="item">
                            <span class="label">新密码：</span>
                            <div class="fl">
                                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                                <span id="txtNewPassTip"></span>
                                <span class="clear"></span>

                            </div>
                        </div>
                        <!--item end-->

                        <!--item end-->
                        <div class="item">
                            <span class="label">确认新密码：</span>
                            <div class="fl">
                                <asp:TextBox ID="txtNewPass2" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                                <span id="txtNewPass2Tip"></span>
                                <span class="clear"></span>
                            </div>
                        </div>
                        <!--item end-->
                        <div class="item">
                            <span class="label"></span>
                            <div class="fl" style="padding-left: 100px;">
                                <asp:Button ID="btnUpdate" Text="" runat="server" CssClass="btn1  bold" Style="width: 91px; height: 35px; background-image: url('/templets/New/images/qd.png'); float: left; margin-right: 7px;"
                                    OnClick="btnUpdate_Click" />
                                <input name="button" type="reset" class="btn1 bold" value="" hidefocus="true"
                                    style="width: 91px; height: 35px; background-image: url('/templets/new/images/qx.png');" />
                                <span class="clear"></span>
                            </div>
                        </div>

                        <!--item end-->
                    </div>

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
