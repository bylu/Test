/**
 * 添加cookies
 */

var tempIdName = "789gameTempUid";

function addCookie(name, value, expireMinute) {
	var cookieString = name + "=" + escape(value);
	// 判断是否设置过期时间
	if (expireMinute > 0) {
		var date = new Date();
//		date.setTime(date.getTime() + expireMinute * 60 * 1000);
		date.setTime(date.getTime() + expireMinute  * 60 * 1000 * 60 * 24);
		cookieString = cookieString + "; expires=" + date.toGMTString();
	}
	document.cookie = cookieString;
}
// 获得cookies
function getCookie(cookie_name) {
	var results = document.cookie.match('(^|;) ?' + cookie_name + '=([^;]*)(;|$)');
	if (results) {
		return (unescape(results[2]));
	} else {
		return null;
	}
}
// 删除cookies
function deleteCookie(name) {
	var date = new Date();
	date.setTime(date.getTime() - 10000);
	document.cookie = name + "=v; expires=" + date.toGMTString();
}
// 设置cookies的值
function getTimestamp() {
	var timestamp = Date.parse(new Date());
	var math = timestamp + Math.round(Math.random() * 3000);
	return math;
}

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}


//$("#referer").val(document.referrer);
var referer =  document.referrer;
//获得从大厅传递过来的用户临时ID
var tempId = getQueryString("registerKey");
var pbkey = getQueryString("pbkey");
//如果有推荐人key，保存在cookie
if(pbkey == null) addCookie("tuijianren", pbkey, 30);

//如果不是来自大厅，则尝试从cookie获得用户临时ID，否则将来自大厅的用户临时ID保存到cookie
if(tempId == null)  tempId = getCookie(tempIdName);
else
	addCookie(tempIdName, tempId, 30);

//如果大厅里没有，cookie里没有，用户第一次来
if (tempId == null || tempId == "") {
	tempId = getTimestamp();
	addCookie(tempIdName, tempId, 30);
	
//用户不是一次来但是重新从其它网站过来（一般是搜索引擎），重新生成临时ID，记录新的关键字
}else if(referrer!='' && referer.indexOf("789game.com") < 0 && referer.indexOf("789game.net") < 0 ){
	deleteCookie(tempIdName);
	tempId = getTimestamp();
	addCookie(tempIdName, tempId, 30);
}

$.ajax({

	type : "post",
	async : false,
	data : {
		referer : document.referrer,
		tempId : tempId,
		title : document.title,
		os : getOS()
	},

	url : "http://tongji.789game.net:8081/tj/data/collect",

	dataType : "jsonp",

	jsonp : "callback",// 服务端用于接收callback调用的function名的参数

	jsonpCallback : "callback",// callback的function名称

	success : function(json) {

		var host = window.location.href;
		if (host.indexOf("register.html") >= 0||host.indexOf("qp") >= 0||host.indexOf("buyu") >= 0) {
			$("#host").val(json.tjID);
		}

	},

	error : function() {

	}
});


function callback(json) {
}

function getOS() {
	var sUserAgent = navigator.userAgent;
	var isWin = (navigator.platform == "Win32")
			|| (navigator.platform == "Windows");
	var isMac = (navigator.platform == "Mac68K")
			|| (navigator.platform == "MacPPC")
			|| (navigator.platform == "Macintosh")
			|| (navigator.platform == "MacIntel");
	if (isMac)
		return "Mac";
	var isUnix = (navigator.platform == "X11") && !isWin && !isMac;
	if (isUnix)
		return "Unix";
	var isLinux = (String(navigator.platform).indexOf("Linux") > -1);
	if (isLinux)
		return "Linux";
	if (isWin) {
		var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1
				|| sUserAgent.indexOf("Windows 2000") > -1;
		if (isWin2K)
			return "Win2000";
		var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1
				|| sUserAgent.indexOf("Windows XP") > -1;
		if (isWinXP)
			return "WinXP";
		var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1
				|| sUserAgent.indexOf("Windows 2003") > -1;
		if (isWin2003)
			return "Win2003";
		var isWinVista = sUserAgent.indexOf("Windows NT 6.0") > -1
				|| sUserAgent.indexOf("Windows Vista") > -1;
		if (isWinVista)
			return "WinVista";
		var isWin7 = sUserAgent.indexOf("Windows NT 6.1") > -1
				|| sUserAgent.indexOf("Windows 7") > -1;
		if (isWin7)
			return "Win7";
		var isWin8 = sUserAgent.indexOf("Windows NT 6.2") > -1
				|| sUserAgent.indexOf("Windows 8") > -1;
		if (isWin8)
			return "Win8";
	}
	return "other";
}

function getBrowserInfo() {
	var agent = navigator.userAgent.toLowerCase();
	var regStr_ie = /msie [\d.]+;/gi;
	var regStr_ff = /firefox\/[\d.]+/gi;
	var regStr_chrome = /chrome\/[\d.]+/gi;
	var regStr_saf = /safari\/[\d.]+/gi;
	// IE
	if (agent.indexOf("msie") > 0) {
		return agent.match(regStr_ie);
	}

	// firefox
	if (agent.indexOf("firefox") > 0) {
		return agent.match(regStr_ff);
	}

	// Chrome
	if (agent.indexOf("chrome") > 0) {
		var charome = agent.match(regStr_chrome);
		return charome;
	}

	// Safari
	if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
		return agent.match(regStr_saf);
	}

}
