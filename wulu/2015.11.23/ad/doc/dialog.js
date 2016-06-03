/**
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="ui-dialog.css"/>
<script type="text/javascript" src="dialog-min.js"/></script>
<script type="text/javascript">
var d = dialog({
    title: '789游戏中心2014年12月9日维护公告',
    content: "尊敬的789游戏用户:<br/><p style='text-indent:30px;'>789游戏中心将于2014年12月9日0:00--2014年12月9日1:30进行维护，维护时间为1小时30分钟，给您造成的不便，敬请谅解.</p>"
});
d.showModal();
</script>
**/
document.writeln("<script type=\"text/javascript\" src=\"http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js\"></script>");
document.writeln("<link rel=\"stylesheet\" href=\"ui-dialog.css\"/>");
document.writeln("<script type=\"text/javascript\" src=\"dialog-min.js\"/></script>");
document.writeln("<script type=\"text/javascript\">");
document.writeln("var d = dialog({");
document.writeln("    title: \'789游戏中心2014年12月9日维护公告\',");
document.writeln("	width:660,");
document.writeln("    content: \"<div>尊敬的789游戏用户:<br/><p style=\'text-indent:30px;\'>789游戏中心为了更好的为游戏用户服务,特决定将于2014年12月9日0:00--2014年12月9日1:30进行维护，维护时间为1小时30分钟，给您造成的不便，敬请谅解.</p><p style=\'margin-top:300px; text-align:right;\'>789游戏中心运营团队<br/><br/>2014年12月8日</p></div>\",");
document.writeln("	 okValue: \'确定\',");
document.writeln("    ok: function () {");
document.writeln("        return true;");
document.writeln("    },");
document.writeln("});");
document.writeln("d.showModal();");
document.writeln("</script>");
