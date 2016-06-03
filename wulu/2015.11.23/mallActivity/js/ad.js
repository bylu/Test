var browser={
	ie6:function(){
        return((window.XMLHttpRequest==undefined)&&(ActiveXObject!=undefined))},getWindow:function(){
        var myHeight=0;
        var myWidth=0;
	if(typeof(window.innerWidth)=='number'){
		myHeight=window.innerHeight;myWidth=window.innerWidth
	}else if(document.documentElement){
		myHeight=document.documentElement.clientHeight;
		myWidth=document.documentElement.clientWidth
	}else if(document.body){
		myHeight=document.body.clientHeight;
		myWidth=document.body.clientWidth
	}return{
		'height':myHeight,'width':myWidth}
		},getScroll:function(){
			var myHeight=0;
			var myWidth=0;
	if(typeof(window.pageYOffset)=='number'){
		myHeight=window.pageYOffset;
		myWidth=window.pageXOffset
	}else if(document.documentElement){
		myHeight=document.documentElement.scrollTop;
		myWidth=document.documentElement.scrollLeft
	}else if(document.body){
		myHeight=document.body.scrollTop;
		myWidth=document.body.scrollLeft
	}return{
	'height':myHeight,'width':myWidth}
	},getDocWidth:function(D){
	if(!D)var D=document;
	return Math.max(Math.max(D.body.scrollWidth,D.documentElement.scrollWidth),Math.max(D.body.offsetWidth,D.documentElement.offsetWidth),Math.max(D.body.clientWidth,D.documentElement.clientWidth))},getDocHeight:function(D){if(!D)var D=document;return Math.max(Math.max(D.body.scrollHeight,D.documentElement.scrollHeight),Math.max(D.body.offsetHeight,D.documentElement.offsetHeight),Math.max(D.body.clientHeight,D.documentElement.clientHeight))}};var dom={ID:function(id){var type=typeof(id);if(type=='object')return id;if(type=='string')return document.getElementById(id);return null},insertHtml:function(html){var frag=document.createDocumentFragment();var div=document.createElement("div");div.innerHTML=html;for(var i=0,ii=div.childNodes.length;i<ii;i++){frag.appendChild(div.childNodes[i])}document.body.insertBefore(frag,document.body.firstChild)}};var myEvent={add:function(element,type,handler){var ele=dom.ID(element);if(!ele)return;if(ele.addEventListener)ele.addEventListener(type,handler,false);else if(ele.attachEvent)ele.attachEvent("on"+type,handler);else ele["on"+type]=handler},remove:function(element,type,handler){var ele=dom.ID(element);if(!ele)return;if(ele.removeEventListener)ele.removeEventListener(type,handler,false);else if(ele.detachEvent)ele.detachEvent("on"+type,handler);else ele["on"+type]=null}};var position={rightCenter:function(id){var id=dom.ID(id);var ie6=browser.ie6();var win=browser.getWindow();var ele={'height':id.clientHeight,'width':id.clientWidth};if(ie6){var scrollBar=browser.getScroll()}else{var scrollBar={'height':0,'width':0};id.style.position='fixed'}ele.top=parseInt((win.height-ele.height)/2+scrollBar.height);id.style.top=ele.top+'px';id.style.right='3px'},floatRightCenter:function(id){position.rightCenter(id);var fun=function(){position.rightCenter(id)};if(browser.ie6()){myEvent.add(window,'scroll',fun);myEvent.add(window,'resize',fun)}else{myEvent.add(window,'resize',fun)}},leftCenter:function(id){var id=dom.ID(id);var ie6=browser.ie6();var win=browser.getWindow();var ele={'height':id.clientHeight,'width':id.clientWidth};if(ie6){var scrollBar=browser.getScroll()}else{var scrollBar={'height':0,'width':0};id.style.position='fixed'}ele.top=parseInt((win.height-ele.height)/2+scrollBar.height);id.style.top=ele.top+'px';id.style.left='3px'},floatLeftCenter:function(id){position.leftCenter(id);var fun=function(){position.leftCenter(id)};if(browser.ie6()){myEvent.add(window,'scroll',fun);myEvent.add(window,'resize',fun)}else{myEvent.add(window,'resize',fun)}}};


function ad_right(){
    var html;
  //  html = '<div id=\"ad_right\" style=\"position:absolute;width:186px;height:276px;margin-top:100px;z-index:10001;background:url(./images/tj_bg.jpg) no-repeat;\"><a style="float:right;margin-left:-20px;width:17px;height:17px;background:url(./images/close1.png) no-repeat;z-index:8888;" href="javascript:void(0);" onclick="document.getElementById(\'ad_right\').style.display=\'none\'"></a><a href="http://shop.789game.com" target="_blank" style="width:100%;float:left;text-align:center;margin-top:50px;"><img src="images/123.jpg" width="131" height="130" alt="立即兑换" title="立即兑换" /></a><span style="width:100%;float:left;text-align:center;color:#ffff9b;height:25px;margin-top:10px;display:inline;">电子称</span><span style="width:100%;text-align:center;float:left;color:#ffff9b;height:25px;text-decoration:line-through;">原价：195万</span><span style="width:100%;text-align:center;color:white;float:left;height:25px;">现价：95万</span></div>';
  html=$("#ad_right").html();
  dom.insertHtml(html);
  position.floatRightCenter('ad_right');
}
/*myEvent.add(window,'load',ad_left);*/
myEvent.add(window,'load',ad_right);
