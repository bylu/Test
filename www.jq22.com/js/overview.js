
AC.define("ipad/shared/cnamer/cnameURL",["require"],function(d){var c=(function(){var a="http://images.apple.com/global/elements/blank.gif";
return a.replace(/global\/.*/,"")}());return function(a){if(!!a.match(/(^http(s?))/)){return a
}if(!a.match(/(^\/)/)){throw"cnameURL: Expected that URL is root-relative before cnaming. ("+a+")"
}a=c+a.replace(/^\//,"");a=a.replace(/(^.+)(\/105\/)/,"$1/");return a}});AC.define("ipad/shared/stickyNav/StickyNav",["require"],function(e){var f=function(a,b){b=b||{};
this.element=AC.Element.getElementById(a);this.body=document.body;AC.Element.addClassName(this.body,"stickynav");
this.main=AC.Element.getElementById("main");this.elementToShim=b.shimElement||this.main;
this.shimProperty=b.shimProperty||"padding-top";this.wrapper=document.createElement("div");
AC.Element.addClassName(this.wrapper,"stickynav-wrapper");this.element.parentElement.insertBefore(this.wrapper,this.element);
this.wrapper.appendChild(this.element);this.dataAttribute="navstyle";this.hiddenClassName="hidden";
this.dockY=72;this.willHide=false;this.isDocking=false;this.isFixed=false;this.idleTime=0;
this.timerOut=10;this.scrollThreshold=600;this.scrolled=0;this.currScrollY=this.getScrollY();
this.lastScrollY=this.currScrollY;this.scrollThresholdStartPoint=this.lastScrollY;
this.currentHotspot=false;this.hotspotRegistry=[];this.navHeight=this.element.offsetHeight;
this.hasHotspots=false;this.useNavAtPageBottom=true;this.bottomThreshold=512;this.browserUsesTransitions=AC.Environment.Feature.cssPropertyAvailable("transition");
this.loadHotspotRegistry();this.attachScrollListener();this.setupIdleListener();
this.idleTimer=setInterval(function(){this.idleTimerInterval()}.bind(this),1000)
};var d=f.prototype;d.idleTimerInterval=function(){this.idleTime++;if(!this.isFixed&&(this.currScrollY>(this.dockY+this.navHeight))&&this.idleTime==this.timerOut){AC.Element.addClassName(this.body,"stickynav-idle");
this.setFixed()}};d.resetTimer=function(){this.idleTime=0};d.setupIdleListener=function(){var a=["mousemove","click","keydown","resize"];
a.forEach(function(b){this.bindOnEvent(b,this.resetTimer)}.bind(this))};d.attachScrollListener=function(){this.bindOnEvent("scroll",this.scrollListener)
};d.scrollListener=function(){this.currScrollY=this.getScrollY();if(!this.isDocking){if(this.currScrollY>0){var a=this.scrollDirection();
if(a>0){this.onScrollDown()}else{if(a<=0){this.onScrollUp()}}if(this.hasHotspots&&this.isFixed){this.updateFromHotspots()
}}else{this.reset()}}this.resetTimer()};d.onScrollDown=function(){if(this.currScrollY>(this.dockY+this.navHeight)){if(this.isFixed){if(this.willHide){if(!this.isInView()){this.reset()
}}else{if(!this.useNavAtPageBottom||this.outsideOfBottomThreshold()){this.initiateHide()
}}}else{if(this.useNavAtPageBottom&&this.isAtPageBottom()){this.setFixed()}}}this.scrollThresholdStartPoint=this.currScrollY
};d.onScrollUp=function(){if(this.willHide){if(this.wrapper.offsetTop>=this.currScrollY){this.cancelHide()
}}if(this.scrollThresholdMet()&&!this.isFixed){this.setFixed()}if(this.shouldDock()){this.dockNav()
}};d.shouldDock=function(){return this.isFixed&&(this.currScrollY<=this.dockY)};
d.isAtPageBottom=function(){return this.currScrollY>=document.body.scrollHeight-window.innerHeight
};d.outsideOfBottomThreshold=function(){return this.currScrollY<document.body.scrollHeight-window.innerHeight-this.bottomThreshold
};d.setFixed=function(){var a={};a[this.shimProperty]=this.navHeight+"px";AC.Element.addClassName(this.body,"stickynav-undocked");
AC.Element.setStyle(this.elementToShim,a);this.isFixed=true;this.willHide=false;
if(this.shouldDock()){this.dockNav()}};d.dockNav=function(){if(this.browserUsesTransitions){this.isDocking=true;
AC.Element.addClassName(this.body,"stickynav-docking");this._boundTransitionEndCallback=this._boundTransitionEndCallback||this.reset.bind(this);
AC.Element.addVendorPrefixEventListener(this.wrapper,"transitionEnd",this._boundTransitionEndCallback)
}else{this.reset()}};d.reset=function(){if(this.isFixed&&!this.currentHotspot){var a={};
a[this.shimProperty]="";AC.Element.removeClassName(this.body,"stickynav-undocked");
AC.Element.removeClassName(this.body,"stickynav-idle");AC.Element.setStyle(this.elementToShim,a);
AC.Element.setStyle(this.wrapper,{position:"",top:""});this.willHide=false;this.isFixed=false;
if(this.isDocking){AC.Element.removeVendorPrefixEventListener(this.wrapper,"transitionEnd",this._boundTransitionEndCallback);
AC.Element.removeClassName(this.body,"stickynav-docking");this.isDocking=false}}};
d.initiateHide=function(){AC.Element.setStyle(this.wrapper,{position:"absolute",top:this.currScrollY+"px"});
this.willHide=true};d.cancelHide=function(){AC.Element.setStyle(this.wrapper,{position:"",top:""});
this.willHide=false};d.updateFromHotspots=function(){var a=this.isOverHotspot();
if(a){if(!this.currentHotspot){this.applyHotspotNavStyle(a);this.currentHotspot=a
}}else{if(this.currentHotspot){this.removeHotspotNavStyle(this.currentHotspot);
this.currentHotspot=false}}};d.scrollThresholdMet=function(){var b=false;var a=Math.abs(this.currScrollY-this.scrollThresholdStartPoint);
if(a>=this.scrollThreshold){b=true;this.scrollThresholdStartPoint=this.currScrollY
}return b};d.isInView=function(){return(this.currScrollY-(this.wrapper.offsetTop+this.navHeight))<=0
};d.scrollDirection=function(){var b=0;var a=this.currScrollY-this.lastScrollY;
if(a!==0){b=a>0?1:-1;this.lastScrollY=this.currScrollY}return b};d.getHotspotElements=function(){return AC.Element.selectAll("[data-"+this.dataAttribute+"]")
};d.hotspotElementToObject=function(h){var a=65;var b=AC.Element.cumulativeOffset(h).top;
var c={element:h,top:b-a,bottom:b+h.offsetHeight-a,navstyle:h.getAttribute("data-"+this.dataAttribute)};
return c};d.loadHotspotRegistry=function(){var a=this.getHotspotElements();if(a.length>0){a.forEach(function(b){this.hotspotRegistry.push(this.hotspotElementToObject(b))
}.bind(this));this.hasHotspots=true}};d.isOverHotspot=function(){var a=false;this.hotspotRegistry.some(function(b){if((this.currScrollY>=b.top)&&(this.currScrollY<=b.bottom)){a=b;
return true}}.bind(this));return a};d.applyHotspotNavStyle=function(a){AC.Element.addClassName(this.body,a.navstyle)
};d.removeHotspotNavStyle=function(a){AC.Element.removeClassName(this.body,a.navstyle)
};d.getScrollY=function(){return window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop
};d.bindOnEvent=function(m,a,o){o=o||this;var p=false;var b=false;var n=false;var c=function(h,g){if(p===false){b=true;
l.apply(this,[h,g])}else{n=true}};var l=function(h,g){if(b===true){b=false;p=true;
g.call(this,h);window.requestAnimationFrame(l.bind(this,h,g))}else{p=false;if(n){c.apply(o,[h,g])
}}};AC.Element.addEventListener(window,m,function(g){c.apply(o,[g,a])})};return f
});(function(l,h){var j="",k,i,m;if(l.addEventListener){k="addEventListener"}else{k="attachEvent";
j="on"}m="onwheel" in h.createElement("div")?"wheel":h.onmousewheel!==undefined?"mousewheel":"DOMMouseScroll";
l.addWheelListener=function(b,a,c){n(b,m,a,c);if(m=="DOMMouseScroll"){n(b,"MozMousePixelScroll",a,c)
}};function n(b,c,a,d){b[k](j+c,m=="wheel"?a:function(f){!f&&(f=l.event);var e={originalEvent:f,target:f.target||f.srcElement,type:"wheel",deltaMode:f.type=="MozMousePixelScroll"?0:1,deltaX:0,delatZ:0,preventDefault:function(){f.preventDefault?f.preventDefault():f.returnValue=false
}};if(m=="mousewheel"){e.deltaY=-1/40*f.wheelDelta;f.wheelDeltaX&&(e.deltaX=-1/40*f.wheelDeltaX)
}else{e.deltaY=f.detail}return a(e)},d||false)}})(window,document);AC.define("ipad/shared/utils/wheel",function(){});
AC.define("ipad/shared/utils/dom",["require"],function(c){var d=(function(){var f=document.getElementsByTagName("body")[0];
var b=document.getElementsByTagName("head")[0];var a=document.documentElement;return{setElementWidthToViewport:function(e){AC.Element.setStyle(e,{width:a.clientWidth+"px"})
},setElementHeightToViewport:function(e){AC.Element.setStyle(e,{height:a.clientHeight+"px"})
},sizeElementToViewport:function(e){AC.Element.setStyle(e,{width:a.clientWidth+"px",height:a.clientHeight+"px"})
},bindThrottledCallback:function(q,e,p){p=p||this;var r=false;var m=false;var n=function(g,h){if(r===false){m=true;
o.apply(this,[g,h])}};var o=function(g,h){if(m===true){m=false;r=true;h.call(this,g);
window.requestAnimationFrame(o.bind(this,g))}else{r=false}};AC.Element.addEventListener(window,q,function(g){n.apply(p,[g,e])
})},parseDataAttributeOptions:function(m,o){m=AC.Element.getElementById(m);var l=m.getAttribute("data-"+o);
var p;var n={};var e;if(l&&l.length>0){p=l.split(",");if(p&&p.length>0){p.forEach(function(g){e=g.split(":");
n[e[0]]=e[1]})}}return n}}})();return d});AC.define("eventEmitter/EventEmitter",[],function(){var i=function(a){this.context=a
};var j=i.prototype;var f=function(){if(!this.hasOwnProperty("_events")&&typeof this._events!=="object"){this._events={}
}return this._events};var g=function(e,c){var b=e[0];var a=e[1];var d=e[2];if(typeof b==="object"){for(var l in b){c.call(this,l,b[l],d)
}}if(typeof b==="string"){b=b.split(" ");b.forEach(function(k){c.call(this,k,a,d)
},this)}};var h=function(b,a){var e;var d;var c;e=f.call(this)[b];if(!e){return
}for(d=0,c=e.length;d<c;d++){if(a(e[d],d)){break}}};j.on=function(){var a=f.call(this);
g.call(this,arguments,function(c,b,d){a[c]=a[c]||(a[c]=[]);a[c].push({callback:b,context:d})
});return this};j.once=function(){g.call(this,arguments,function(c,a,d){var b=function(e){a.call(d||this,e);
this.off(c,b)};this.on(c,b,this)});return this};j.off=function(b,a){var c=f.call(this);
if(arguments.length===0){c={};return this}if(arguments.length===1&&c[b]){c[b]=[];
return this}var d=-1;h.call(this,b,function(e,l){d=l;if(e.callback===a){return true
}});if(d===-1){return}c[b].splice(d,1);return this};j.trigger=function(b,a){b=b.split(" ");
b.forEach(function(c){h.call(this,c,function(d){d.callback.call(d.context||this.context||this,a)
}.bind(this))},this);return this};return i});AC.define("overview/desktop/controller/MouseWheel",["require","eventEmitter/EventEmitter"],function(d){var f=d("eventEmitter/EventEmitter");
function e(a,b){this.enabled=false;this._locked=false;this._scrollLockDuration=a;
this._horizontalThreshold=b||0}e.prototype=new f();e.prototype.onMouseWheel=function(b){if(this.enabled===true){var a=b.wheelDeltaY||-1*b.deltaY;
if(a>this._horizontalThreshold||a<-this._horizontalThreshold){AC.Event.stop(b)}if(this._locked===true||(a<=this._horizontalThreshold&&a>=-this._horizontalThreshold)){return
}this._locked=true;if(a>this._horizontalThreshold){this.trigger("backward")}else{if(a<-this._horizontalThreshold){this.trigger("forward")
}}window.setTimeout(function(){this._locked=false}.bind(this),this._scrollLockDuration)
}};return e});AC.define("overview/desktop/controller/Keyboard",["require","eventEmitter/EventEmitter"],function(d){var f=d("eventEmitter/EventEmitter");
function e(){this.enabled=false}e.prototype=new f();e.prototype.onKeyDown=function(b){if(this.enabled===true){var a="keyboard";
if(document.activeElement.tagName.toLowerCase()==="input"){return}if(b.keyCode===35||(b.metaKey===true&&b.keyCode===40)){AC.Event.stop(b);
this.trigger("key:end")}else{if(b.keyCode===36||(b.metaKey===true&&b.keyCode===38)){AC.Event.stop(b);
this.trigger("key:home")}else{if(b.keyCode===40||b.keyCode===34||(b.keyCode===32&&!b.shiftKey)){AC.Event.stop(b);
this.trigger("key:down")}else{if(b.keyCode===38||b.keyCode===33||(b.keyCode===32&&b.shiftKey)){AC.Event.stop(b);
this.trigger("key:up")}}}}}};return e});AC.define("overview/desktop/controller/Input",["require","eventEmitter/EventEmitter","overview/desktop/controller/MouseWheel","overview/desktop/controller/Keyboard"],function(j){var h=j("eventEmitter/EventEmitter");
var f=j("overview/desktop/controller/MouseWheel");var g=j("overview/desktop/controller/Keyboard");
function i(b){this.enabled=false;this._events=new h();var a="onwheel" in document.createElement("div")?"wheel":document.onmousewheel!==undefined?"mousewheel":"DOMMouseScroll";
this._mouseWheelController=new f(1400);AC.Element.addEventListener(document,a,this._mouseWheelController.onMouseWheel.bind(this._mouseWheelController));
this._mouseWheelController.on("forward",function(c){this.trigger("forward",{interactionType:"scroll"})
}.bind(this));this._mouseWheelController.on("backward",function(c){this.trigger("backward",{interactionType:"scroll"})
}.bind(this));this._keyboardController=new g();AC.Element.addEventListener(window,"keydown",this._keyboardController.onKeyDown.bind(this._keyboardController));
this._keyboardController.on("key:down",this.onKeyDown.bind(this,"forward"));this._keyboardController.on("key:up",this.onKeyDown.bind(this,"backward"));
this._keyboardController.on("key:home",this.onKeyDown.bind(this,"beginning"));this._keyboardController.on("key:end",this.onKeyDown.bind(this,"end"))
}i.prototype={onKeyDown:function(b,a){if(this.enabled===true){this.trigger(b,{interactionType:"keyboard",originalEvent:a})
}},enable:function(){this.enabled=true;this._mouseWheelController.enabled=true;
this._keyboardController.enabled=true},disable:function(){this.enabled=false;this._mouseWheelController.enabled=false;
this._keyboardController.enabled=false},on:function(b,a){this._events.on.apply(this,[b,a]);
return this},off:function(b,a){this._events.off.apply(this,[b,a]);return this},once:function(b,a){this._events.once.apply(this,[b,a]);
return this},trigger:function(a,b){this._events.trigger.apply(this,[a,b]);return this
}};return i});AC.define("ipad/shared/experienceReporter/ExperienceObject",["require"],function(e){var d=function(a,b){this._data=a;
this._experience="static";this._enhanceable=false;this._environment=b;this._parseExperienceFromObject();
return this};var f=d.prototype;f.getExperience=function(){return this._experience
};f.isRetina=function(){return("this._experience".split("_")[1]==="2x")};f.canEnhance=function(){return this._enhanceable
};f.applyClassNames=function(c,b){var a=b||"enhance";AC.Element.addClassName(c,a+"-"+this._experience)
};f._parseExperienceFromObject=function(){var a=this._matchExperienceToEnvironment();
["video","video_2x","flow","flow_2x"].forEach(function(b){if(a[b]){this._enhanceable=true;
this._experience=b}}.bind(this))};f._matchExperienceToEnvironment=function(){var a=this._filterByEnvironment();
var b=this._filterBySpecificity(a);return b};f._filterByEnvironment=function(){var a=this._data.filter(function(c){var h;
for(var b in this._environment){h=false;if(this._environment[b]===c[b]||c[b]===""){h=true
}if(h===false){return false}}return true}.bind(this));return a};f._filterBySpecificity=function(a){var b=a;
["platform","os","os_version","browser","browser_version"].forEach(function(c){var h=false;
b.forEach(function(g){if(g[c]!==""){h=true}});if(h===true){b.forEach(function(g,j){if(g[c]===""){b.splice(j,1)
}})}});if(b.length>0){return b[0]}else{return false}};return d});AC.define("ipad/shared/experienceReporter/ExperienceReporter",["require","ipad/shared/experienceReporter/ExperienceObject"],function(f){var j=f("ipad/shared/experienceReporter/ExperienceObject");
var g;var h=function(){if(g){return h.getInstance()}this._environment={};this._initialize()
};h.getInstance=function(){if(!g){g=new h()}return g};var i=h.prototype;i.newExperience=function(a,b){return new j(a,this._environment)
};i.getEnvironment=function(){return this._environment};i._initialize=function(){this._environment.platform=this._checkPlatform();
var a=this._checkOS();this._environment.os=a.os;this._environment.os_version=a.os_version;
var b=this._checkBrowser();this._environment.browser=b.browser;this._environment.browser_version=b.browser_version
};i._checkPlatform=function(){var a;if(AC.Environment.Feature.isDesktop()){if(AC.Environment.Feature.isRetina()){a="desktop_retina"
}else{a="desktop"}}else{if(AC.Environment.Feature.isTablet()){if(AC.Environment.Feature.isRetina()){a="tablet_retina"
}else{a="tablet"}}}return a};i._checkOS=function(){return{os:AC.Environment.Browser.os.toLowerCase(),os_version:parseInt(AC.Environment.Browser.osVersion,10).toString()}
};i._checkBrowser=function(){return{browser:AC.Environment.Browser.name.toLowerCase(),browser_version:parseInt(AC.Environment.Browser.version,10).toString()}
};return h.getInstance()});AC.define("animationSequencer/adapters/ReversibleVideo",["require","eventEmitter/EventEmitter"],function(f){var h=f("eventEmitter/EventEmitter");
function g(a){this._media=a;this._lastTime=null;g.passThroughEvents.forEach(this.passThroughEvent.bind(this));
g.interceptedEvents.forEach(this.interceptEvent.bind(this))}g.interceptedEvents=["seeking","play"];
g.passThroughEvents=["abort","canplay","canplaythrough","durationchange","emptied","ended","error","loadeddata","loadedmetadata","loadstart","mozaudioavailable","pause","playing","progress","ratechange","seeked","suspend","timeupdate","volumechange","waiting"];
var e=g.prototype=new h();e.addEventListener=function(b){var a=g.passThroughEvents;
if(a.indexOf(b)>-1){this._media.addEventListener.apply(this._media,arguments)}else{this.on.apply(this,arguments)
}};e.removeEventListener=function(b){var a=g.passThroughEvents;if(a.indexOf(b)>-1){this._media.removeEventListener.apply(this._media,arguments)
}else{this.off.apply(this,arguments)}};e.passThroughEvent=function(a){this._media.addEventListener(a,this._passThrough.bind(this))
};e.interceptEvent=function(b){var a=this["_on"+b];if(typeof a!=="undefined"){this._media.addEventListener(b,a.bind(this))
}};e._passThrough=function(a){this.trigger(a.type,a)};e._onseeking=function(){if(!this._playing){this.trigger("seeking")
}};e._onplay=function(){this.trigger("play")};e.play=function(){if(this.playbackRate<0){this._playing=true;
this._lastTime=null;window.requestAnimationFrame(this._update.bind(this));this.trigger("play")
}else{this._media.play()}};e.load=function(){this._media.load()};e._stop=function(a){a.preventDefault();
a.stopPropagation()};e._update=function(b){var a=b-(this._lastTime||b);var c=this._media.currentTime+((a*this.playbackRate)/1000);
if(c<=0){this._media.currentTime=0;this._playing=false;this.trigger("returned",{type:"returned"})
}else{this._media.currentTime=c;this.trigger("timeupdate",{type:"timeupdate"})}this._lastTime=b;
if(this._playing){window.requestAnimationFrame(this._update.bind(this))}};e.pause=function(){this._playing=false;
this._media.pause()};if(typeof Object.defineProperties!=="function"){return function(){}
}Object.defineProperties(g.prototype,{currentTime:{get:function(){return this._media.currentTime
},set:function(a){this._media.currentTime=a}},duration:{get:function(){return this._media.duration
}},buffered:{get:function(){return this._media.buffered}},playbackRate:{get:function(){return this._media.playbackRate
},set:function(a){this._media.playbackRate=a}},paused:{get:function(){return !this._playing&&this._media.paused
},set:function(a){this._media.paused=a}}});return g});AC.define("ipad/shared/mediaObject/MediaObject",["require","ipad/shared/utils/dom","eventEmitter/EventEmitter"],function(e){var g=e("ipad/shared/utils/dom");
var h=e("eventEmitter/EventEmitter");var f=AC.Class({__defaultOptions:{autoload:true,autoplay:false,fadeToEndframe:false,flowExtension:"jpg",videoExtension:"mp4",retina:false,endframeTransitionDuration:0.4,frameRate:24,posterframeClass:"posterframe"},initialize:function(b){this._options={};
this._options=AC.Object.extend(AC.Object.clone(this.__defaultOptions),b||{});this._options.container=AC.Element.getElementById(b.container);
this._options.basePath=b.basePath+"/";for(var a in this._options){if(this._options.hasOwnProperty(a)){this["_"+a]=this._options[a]
}}this._delegate={};this._loaded=false;this._posterframeElement=null;this._endstateElement=null;
this._dataOptionsAttribute="mediaObject";this._mediaObject=null;this._canplaythrough=false;
this.synthesize();this._events=new h(this);this.__updateOptionsFromDataAttribute();
this.__enhance();this.__postGenerationTasks()},__generate:function(){},__updateOptionsFromDataAttribute:function(){var b=this.container().getAttribute("data-"+this.dataOptionsAttribute());
var a=g.parseDataAttributeOptions(this.container(),b);AC.Object.extend(AC.Object.clone(this.options(),a||{}))
},__enhance:function(){this.__generate();this.__createEndstate();this.__createPosterframe();
AC.Element.addClassName(this.container(),"mediaObject-enhanced");AC.Element.addClassName(this.getMediaElement(),"mediaObject-element");
this.__inject();this.hideEndstate()},__inject:function(){AC.Element.insert(this.mediaObject(),this.container())
},getMediaElement:function(){return this.mediaObject()},__createEndstate:function(){var a=AC.Element.select(".endstate",this.container());
this.setEndstateElement(a||false)},__createPosterframe:function(){var a=AC.Element.select("."+this.posterframeClass(),this.container());
this.setPosterframeElement(a||false)},__postGenerationTasks:function(){this.__addEventListeners();
if(this.autoload()===true){this.load()}},load:function(){if(typeof this.delegate().load==="function"){this.delegate().load(this)
}else{this.__load()}},__load:function(){},play:function(){if(typeof this.delegate().play==="function"){return this.delegate().play(this)
}if(!this.canplaythrough()){this.load();this.setAutoplay(true);return}if(!this.mediaObject().paused){return false
}AC.Element.removeClassName(this.container(),"mediaObject-ended");AC.Element.addClassName(this.container(),"mediaObject-playing");
this.hidePosters();this.__play()},__play:function(){},pause:function(){if(typeof this.delegate().pause==="function"){this.delegate().pause(this)
}else{AC.Element.removeClassName(this.container(),"mediaObject-playing");this.__pause()
}},__pause:function(){this.mediaObject().pause()},reset:function(){if(typeof this.delegate().reset==="function"){this.delegate().reset(this)
}else{this.__reset()}},__reset:function(){},stop:function(){this.setAutoplay(false);
if(typeof this.delegate().stop==="function"){this.delegate().stop(this)}else{this.__stop()
}},__stop:function(){this.pause();this.reset()},hidePosters:function(){this.hidePosterframe();
this.hideEndstate()},showPosterframe:function(b){if(this.posterframeElement()){var a=this.posterframeElement();
if(b){this.addOpacityTransition(a)}AC.Element.setStyle(this.posterframeElement(),{opacity:1,zIndex:1001});
this.removeTransition(a)}},hidePosterframe:function(b){if(this.posterframeElement()){var a=this.posterframeElement();
if(b){this.addOpacityTransition(a)}AC.Element.setStyle(this.posterframeElement(),{opacity:0,zIndex:1});
this.removeTransition(a)}},showEndstate:function(b){if(this.endstateElement()){var a=this.endstateElement();
if(b){this.addOpacityTransition(a)}AC.Element.setStyle(a,"opacity:1; z-index:1002");
this.removeTransition(a)}},hideEndstate:function(b){if(this.endstateElement()){var a=this.endstateElement();
AC.Element.setVendorPrefixStyle(a,"transition","none");AC.Element.setStyle(a,"opacity:0; z-index:1")
}},removeTransition:function(a){AC.Element.setVendorPrefixStyle(a,"transition","none")
},addOpacityTransition:function(a){AC.Element.setVendorPrefixStyle(a,"transition","opacity "+this.options().endframeTransitionDuration+"s ease-out")
},__addEventListeners:function(){AC.Element.addEventListener(this.mediaObject(),"canplaythrough",this.__onCanplaythrough.bind(this));
AC.Element.addEventListener(this.mediaObject(),"ended",this.__onEnded.bind(this))
},__onCanplaythrough:function(){this.setCanplaythrough(true);this.trigger("canplaythrough",this);
AC.Element.removeEventListener(this.mediaObject(),"canplaythrough",this.__canplaythroughListener);
if(this.autoplay()===true){this.setAutoplay(false);this.play()}},__onEnded:function(){AC.Element.removeClassName(this.container(),"mediaObject-playing");
AC.Element.addClassName(this.container(),"mediaObject-ended");if(this.endstateElement()){this.showEndstate()
}this.trigger("ended",this)},on:function(b,a){this._events.on.apply(this,[b,a]);
return this},off:function(b,a){this._events.off.apply(this,[b,a]);return this},once:function(b,a){this._events.once.apply(this,[b,a]);
return this},trigger:function(a,b){this._events.trigger.apply(this,[a,b]);return this
}});return f});AC.define("flow/diff/Loader",["require","assetLoader/AssetLoader"],function(e){var h,f=e("assetLoader/AssetLoader");
function g(c,i){var d,a,b=c.match(/#/g).length;this.imagesUrls=[];if(!i){throw new Error("0 images provided")
}for(d=1;d<=i;d++){a="0000"+d;a=a.substring(a.length-b);this.imagesUrls.push(c.replace(/#{2,}/g,a))
}}h=g.prototype;h.load=function(){return new f(this.imagesUrls).load()};return g
});AC.define("flow/diff/Render",["require","flow/diff/Loader","defer/Deferred"],function(i){var h,j=i("flow/diff/Loader"),f=i("defer/Deferred");
function g(a,b){this.flowData=a;this.flowData.imageUrlPattern=b}h=g.prototype;h._storeImages=function(a){if(DEBUG){console.log("loaded images")
}this.images=a;this._blocksPerFullDiff=(a[0].width/this.flowData.blockSize)*(a[0].height/this.flowData.blockSize);
return(new f()).resolve()};h._applyDiffRange=function(z,d){var u=d.block,y=d.length,A=z.canvas.width/this.flowData.blockSize,w=Math.floor(u/this._blocksPerFullDiff),C=this.images[w].width,B=u%this._blocksPerFullDiff,D=C/this.flowData.blockSize,a=(B%D)*this.flowData.blockSize,b=Math.floor(B/(D||1))*this.flowData.blockSize,e=(d.location%A)*this.flowData.blockSize,v=Math.floor(d.location/A)*this.flowData.blockSize,x,c;
while(y){x=Math.min((y*this.flowData.blockSize),z.canvas.width-e,C-a);c=x/this.flowData.blockSize;
if(DEBUG){if(typeof this.renderDebugger!=="undefined"&&this._frameToRender>0){this.renderDebugger.registerComparison(this._frameToRender,{image:w,block:u,x:a,y:b})
}}z.drawImage(this.images[w],a,b,x,this.flowData.blockSize,e,v,x,this.flowData.blockSize);
y-=c;if(y){if((a+=x)>=C){a=0;b+=this.flowData.blockSize}if((B+=c)>=this._blocksPerFullDiff){B=0;
a=0;b=0;w+=1;if(w===this.flowData.imagesRequired-1){C=this.images[w].width}}if((e+=x)>=z.canvas.width){e=0;
v+=this.flowData.blockSize}u+=c}}};h.init=function(){if(DEBUG){console.log("load images")
}return new j(this.flowData.imageUrlPattern,this.flowData.imagesRequired).load().then(this._storeImages.bind(this))
};h.renderDiff=function(d,a){var c=d.getContext("2d");a-=1;if(DEBUG){this._frameToRender=a;
console.log("applying diff frame : "+(a+1))}this.frames[a].forEach(function b(e){this._applyDiffRange(c,e)
}.bind(this))};if(typeof Object.defineProperties!=="function"){return function(){}
}Object.defineProperties(h,{frames:{get:function(){return this.flowData.frames},set:function(a){this.flowData.frames=a
},enumerable:true}});return g});AC.define("flow/compositor/Sequence",["require","assetLoader/AssetLoader","flow/diff/Render","defer/Deferred"],function(l){var j,h=l("assetLoader/AssetLoader"),i=l("flow/diff/Render"),g=l("defer/Deferred");
function k(a,b,c){this._keyframes=a;this._imageUrlPattern=b;this._flowDataProvider=c
}j=k.prototype;j._initDiffRender=function(a){this._images=a;this.canvas.height=a[0].height;
this.canvas.width=a[0].width;this.applyFrame(a[0])};j.init=function(a){this.canvas=a||document.createElement("canvas");
return new h(this._keyframes).load().then(this._initDiffRender.bind(this)).then(this._flowDataProvider.load.bind(this._flowDataProvider))
};j.createDiffRender=function(a){this._diffRender=new i(a,this._imageUrlPattern);
return this._diffRender.init()};j.applyFrame=function(a){var b=this.canvas.getContext("2d");
b.drawImage(a,0,0)};j.calculateRenderCount=function(c,b){var a=0;if(Math.abs(b-c)>=b){c=1;
a=1}else{if(Math.abs(b-c)>=(this.frameCount-b)&&this._images[1]){c=this.frameCount-2;
a=1}}if(b>0&&b<this.frameCount-1){return Math.abs(c-b)+a}else{return a}};j.compositeFrames=function(d,b){var c=new g();
b=(this.frameCount<b)?this.frameCount-1:(b<0)?0:b;d=(this.frameCount-2<d)?this.frameCount-2:(d<0)?0:d;
var a;if(DEBUG){console.groupCollapsed("Rendering diff frames: "+d+"..."+b)}if(Math.abs(b-d)>=b){d=1;
if(DEBUG){console.log("applying start keyframe")}this.applyFrame(this._images[0])
}else{if(Math.abs(b-d)>=(this.frameCount-b)&&this._images[1]){d=this.frameCount-2;
if(DEBUG){console.log("applying end keyframe")}this.applyFrame(this._images[1])
}}a=(d>b)?-1:(d<b)?1:0;if(b>0&&b<this.frameCount-1){while(d!==b){c.progress(d);
this._diffRender.renderDiff(this.canvas,d);d+=a;c.progress(d)}}if(DEBUG){console.groupEnd()
}c.resolve(d);return c.promise()};if(typeof Object.defineProperties!=="function"){return function(){}
}Object.defineProperties(j,{frameCount:{get:function(){return this._diffRender.frames.length+2
},enumerable:true},canvas:{get:function(){return this._canvas},set:function(a){return this._canvas=a
},enumerable:true},mainCompositor:{get:function(){var a=this;while(a._compositor){a=a._compositor
}return a},enumerable:true}});return k});AC.define("flow/data/Manifest",[],function(){function b(){}return b
});AC.define("flow/data/Block",[],function(){function b(a,d){this.location=a;this.length=d
}return b});AC.define("flow/data/processor",["require","flow/data/Manifest","flow/data/Block"],function(f){var h=f("flow/data/Manifest"),g=f("flow/data/Block"),i;
var j={parseData:function(b){i=0;var a=b.frames.map(this._parseFrame,this);return Object.create(h.prototype,{version:{value:b.version},framecount:{value:b.frameCount},blockSize:{value:b.blockSize},imagesRequired:{value:b.imagesRequired},reversible:{value:b.reversible},superframeFrequency:{value:b.superframeFrequency},frames:{value:a}})
},_valueForCharAt:function(a,c){var b=a.charCodeAt(c);if(b>64&&b<91){return b-65
}if(b>96&&b<123){return b-71}if(b>47&&b<58){return b+4}if(b===43){return 62}if(b===47){return 63
}throw"Invalid Bas64 character: "+a.charAt(c)},_createNumberFromBase64Range:function(a,e,b){var c=0,d;
while(b--){d=this._valueForCharAt(a,e++);c+=(d<<b*6)}return c},_parseFrame:function(d){var c,a=[],d=d.value||d,b,e;
for(c=0;c<d.length;c+=5){e=this._createNumberFromBase64Range(d,c,3);b=this._createNumberFromBase64Range(d,c+3,2);
a.push(Object.create(g.prototype,{location:{value:e,enumerable:true},length:{value:b,enumerable:true},block:{value:(i+=b)-b,enumerable:true}}))
}return a}};return j});AC.define("flow/data/provider/Async",["require","ajax/Ajax","flow/data/processor"],function(f){var i,g=f("ajax/Ajax"),h=f("flow/data/processor");
function j(b,a){this._url=b;this._ajaxAdaptor=a||new g()}i=j.prototype;i.load=function(){var a=this;
return this._ajaxAdaptor.get(this._url).then(function(c){try{var d=c.response||c.responseText;
return JSON.parse(d)}catch(b){if(DEBUG){console.log("Failed to parse manifest data")
}}}).then(function(b){a._data=b;return h.parseData(b)})};return j});AC.define("flow/data/provider/Sync",["require","defer/Deferred","flow/data/processor"],function(f){var i,g=f("defer/Deferred"),h=f("flow/data/processor");
function j(a){this._data=a}i=j.prototype;i.load=function(){var a=new g();a.resolve(h.parseData(this._data));
return a.promise()};return j});AC.define("flow/Player",["require","defer/Deferred"],function(e){var g,f=e("defer/Deferred");
function h(a,b){this._flow=b;this._frameRate=30;this.element=a;this.paused=true;
this.loop=false}g=h.prototype;g._dispatchEvent=function(b){var a=document.createEvent("Events");
a.initEvent(b,true,false);a.data=this;this.element.dispatchEvent(a);return a};g._timeToFrame=function(b){var a;
a=Math.round(b/this.duration*this._flow.frameCount);a=a%(this._flow.frameCount+1);
return(a<0)?this._flow.frameCount+a:a};g._advanceToTimeGlobal=function(c){this._prevTime=this._prevTime||c;
this._currentTime+=((c-this._prevTime)/1000)*this.playbackRate;this._prevTime=c;
var b=this._timeToFrame(this._currentTime),a=false;if(!this.loop){if(this.playbackRate>0&&this._currentTime>this.duration){b=this._flow.frameCount;
this._currentTime=this.duration;a=true}else{if(this.playbackRate<0&&this._currentTime<0){b=0;
this._currentTime=0;a=true}}}else{this._currentTime=(this.duration+this._currentTime)%this.duration
}if(!this.paused&&!this.seeking){return this._flow.gotoFrame(b).then(function(){this._dispatchEvent("timeupdate");
if(a){this.paused=true;this._dispatchEvent("ended")}else{this._requestAnimationFrame=window.requestAnimationFrame(this._advanceToTimeGlobal.bind(this))
}}.bind(this))}else{return(new f()).reject()}};g._advanceToTimeLocal=function(a){if(!this.seeking){this.seeking=true;
this._dispatchEvent("seeking");this._currentTime=1*a;this._prevTime=null;window.cancelAnimationFrame(this._requestAnimationFrame);
this._flow.gotoFrame(this._timeToFrame(a)).then(function(){this.seeking=false;this._dispatchEvent("timeupdate");
this._dispatchEvent("seeked");this._requestAnimationFrame=window.requestAnimationFrame(this._advanceToTimeGlobal.bind(this))
}.bind(this))}if(DEBUG){console.log("advance to time "+a+" from "+this._currentTime)
}};g.load=function(){this._dispatchEvent("loadstart");return this._flow.init(this.element).then(this._dispatchEvent.bind(this,"canplaythrough"))
};g.play=function(){if(this.paused){this.paused=false;this._dispatchEvent("play");
this._prevTime=null;this._requestAnimationFrame=window.requestAnimationFrame(this._advanceToTimeGlobal.bind(this))
}return this};g.pause=function(){if(!this.paused){this.paused=true;window.cancelAnimationFrame(this._requestAnimationFrame);
this._dispatchEvent("pause")}return this};g.on=function(){this.element.addEventListener.apply(this.element,arguments)
};if(typeof Object.defineProperties!=="function"){return function(){}}Object.defineProperties(g,{_currentTime:{value:0,enumerable:false,writable:true},_playbackRate:{value:1,enumerable:false,writable:true},currentTime:{get:function(){return this._currentTime*1
},set:g._advanceToTimeLocal,enumerable:true},frameRate:{get:function(){return this._frameRate
},set:function(a){if(isFinite(a)){this._frameRate=a;this._dispatchEvent("durationchange")
}},enumerable:true},playbackRate:{get:function(){return this._playbackRate*1},set:function(a){if(isFinite(a)){this._playbackRate=1*a;
this._dispatchEvent("ratechange")}},enumerable:true},duration:{get:function(){return this._flow.frameCount/this.frameRate
},enumerable:true}});return h});AC.define("flow/keyframe/Loader",["require","assetLoader/AssetLoader","defer/Deferred"],function(i){var h,g=i("assetLoader/AssetLoader"),j=i("defer/Deferred");
function f(d,a){var b,c=d.match(/#/g).length;this._keyframes={};d=d.replace(/([^#]+)(#+)(\..*)/,"$1key_$2$3");
this._imageUrls=[];if(a.frames){a.frames.forEach(function(e,l){if(e.type==="keyframe"){b="0000"+l;
b=b.substring(b.length-c);this._imageUrls.push(d.replace(/#+/g,b));this._keyframes[l]=e
}}.bind(this))}}h=f.prototype;h.load=function(){if(this._imageUrls.length>0){return new g(this._imageUrls).load()
}return(new j()).resolve()};if(typeof Object.defineProperties!=="function"){return function(){}
}Object.defineProperties(h,{keyframes:{get:function(){return this._keyframes},enumerable:true}});
return f});AC.define("flow/keyframe/Render",["require","flow/keyframe/Loader"],function(f){var e,g=f("flow/keyframe/Loader");
function h(a,b){this.flowData=a;this.flowData.imageUrlPattern=b}e=h.prototype;e._storeImages=function(d){var b=0,a;
if(d&&d.length>0){if(DEBUG){console.log("loaded keyframe diff images")}for(var c in this._loader._keyframes){if(this._loader._keyframes.hasOwnProperty(c)){a=d[b];
this._loader._keyframes[c].image=a;b+=1}}}if(DEBUG){if(!d||d.length===0){console.log("no keyframe diff images to load")
}}};e.init=function(){if(DEBUG){console.log("loading keyframe diff images")}this._loader=new g(this.flowData.imageUrlPattern,this.flowData);
return this._loader.load().then(this._storeImages.bind(this))};e.renderKeyframe=function(s,t,a){var u=s.getContext("2d"),r=this._loader.keyframes[t],q=r.image,c=r.x,d=r.y,b=r.width,p=r.height;
if(DEBUG){console.log("applying keyframe diff image: "+t);console.log("x:"+c+" y:"+d+" w:"+b+" h:"+p)
}if(a===true){if(DEBUG){console.log("drawing superKeyframe sub-rectangle")}u.drawImage(q,c,d,b,p,c,d,b,p)
}else{if(this.flowData.reversible){if(DEBUG){console.log("drawing superKeyframe full image")
}u.drawImage(q,0,0)}else{if(DEBUG){console.log("drawing keyframe full image")}u.drawImage(q,c,d,b,p)
}}};return h});AC.define("flow/compositor/decorator/Keyframe",["require","flow/keyframe/Render","defer/Deferred"],function(j){var i,f=j("flow/keyframe/Render"),g=j("defer/Deferred");
function h(a){this._compositor=a;this._flowDataProvider=this.mainCompositor._flowDataProvider
}i=h.prototype;i.init=function(a){this._keyframeDiffRender=new f(this._flowDataProvider._data,this.mainCompositor._imageUrlPattern);
return this._keyframeDiffRender.init()};i.applyFrame=function(a){return this._compositor.applyFrame.apply(this._compositor,arguments)
};i.applyKeyframe=function(b,a){this._keyframeDiffRender.renderKeyframe(this.canvas,b,a)
};i.compositeFrames=function(c,a){if(!this._isKeyframeDiff(a-1)){return this._compositor.compositeFrames.apply(this._compositor,arguments)
}var b=new g();if(DEBUG){console.groupCollapsed("Rendering keyframe diff image: "+(c-1))
}this.applyKeyframe(a-1);if(DEBUG){console.groupEnd()}b.resolve(c-1);return b.promise()
};i._isKeyframeDiff=function(a){return a in this._keyframeDiffRender._loader._keyframes
};i.calculateRenderCount=function(b,a){return this._compositor.calculateRenderCount.apply(this._compositor,arguments)
};if(typeof Object.defineProperties!=="function"){return function(){}}Object.defineProperties(i,{frameCount:{get:function(){return this._compositor.frameCount
},enumerable:true},canvas:{get:function(){return this._compositor.canvas},set:function(a){return this._compositor.canvas=a
},enumerable:true},mainCompositor:{get:function(){return this._compositor.mainCompositor
},enumerable:true}});return h});AC.define("flow/compositor/decorator/Superframe",[],function(){var d;
function c(a,b){this._compositor=a;this._superframeInterval=b||4}d=c.prototype;
d._getClosestSuperframe=function(a){return Math.round(a/this._superframeInterval)*this._superframeInterval
};d.init=function(a){this._screenCanvas=a};d.applyFrame=function(){this._compositor.applyFrame.apply(this._compositor,arguments)
};d.calculateRenderCount=function(f,a){var b=this._getClosestSuperframe(f);if(Math.abs(b-a)>this._superframeInterval/2){f=b+((f>a)?-1:1)*this._superframeInterval;
return this.calculateRenderCount(f,a)+1}else{return Math.abs(b-a)+1}};d.compositeFrames=function(j,b){var a,i;
if(b<=0||b>=this.frameCount-2){this._compositor.compositeFrames(j,b)}if(j>this.frameCount-2){j=this.frameCount-2
}else{if(j<=0){j=1}}i=this._getClosestSuperframe(j);if(DEBUG){console.groupCollapsed("Rendering : "+j+"..."+b)
}if(this._compositor.calculateRenderCount(j,b)>this.calculateRenderCount(j,b)){if(DEBUG){console.groupCollapsed("Rendering (superframe) : "+i)
}a=this._compositor.compositeFrames(i,i).then(function h(){if(DEBUG){console.groupEnd()
}var e=i+((j>b)?-1:1)*this._superframeInterval;this._compositor.compositeFrames(i,e).then(function(){return this.compositeFrames(e,b)
}.bind(this))}.bind(this))}else{if(DEBUG){console.groupCollapsed("Rendering (final frames) : "+j+"..."+b)
}a=this._compositor.compositeFrames(j,b).then(function h(){if(DEBUG){console.groupEnd()
}}.bind(this))}a.then(function h(){if(DEBUG){console.groupEnd()}}.bind(this));return a
};if(typeof Object.defineProperties!=="function"){return function(){}}Object.defineProperties(d,{frameCount:{get:function(){return this._compositor.frameCount
},enumerable:true},canvas:{get:function(){return this._compositor.canvas},set:function(a){return this._compositor.canvas=a
},enumerable:true},mainCompositor:{get:function(){return this._compositor.mainCompositor
},enumerable:true}});return c});AC.define("flow/compositor/decorator/SuperKeyframe",["require","defer/Deferred"],function(e){var h,f=e("defer/Deferred");
function g(a){this._compositor=a;this._frames=this.mainCompositor._flowDataProvider._data.frames;
this._superframeInterval=this.mainCompositor._diffRender.flowData.superframeFrequency
}h=g.prototype;h.init=function(a){return this._compositor.init.apply(this._compositor,arguments)
};h.applyFrame=function(a){return this._compositor.applyFrame.apply(this._compositor,arguments)
};h.applyKeyframe=function(b,a){this._compositor.applyKeyframe.apply(this._compositor,arguments)
};h.compositeFrames=function(j,b){var a,c,d=new f();if(b<1||b>this.frameCount-2){return this._compositor.compositeFrames.apply(this._compositor,arguments)
}if(this._isKeyframeDiff(b-1)){a=Math.abs(j-b)===1?true:false;if(DEBUG){console.groupCollapsed("Drawing superKeyframe image: "+(b-1))
}this.applyKeyframe(b-1,a);if(DEBUG){console.groupEnd()}d.resolve(j-1);return d.promise()
}if(Math.abs(b-j)>this._superframeInterval){c=this._getShortestRender(j,b);if(this._isKeyframeDiff(c-1)||c<=0||c>=this.frameCount-2){return this._compositeFromSuperKeyframe(c,b)
}}if(DEBUG){console.log("SuperKeyframe compositor handing off to slave compositor: fromFrame:"+j+" toFrame:"+b)
}return this._compositor.compositeFrames.apply(this._compositor,[j,b])};h._getShortestRender=function(l,d){var b=this._compositor.calculateRenderCount,c=this._getClosestSuperKeyframe(d-1),k=b.apply(this._compositor,[c,d])+1,a=b.apply(this._compositor,[l,d]);
if(k<=a){return c}else{return l}};h._compositeFromSuperKeyframe=function(a,c){var j=this.canvas.getContext("2d"),d=(a<=0)?this.mainCompositor._images[0]:(a>=this.frameCount-2?this.mainCompositor._images[1]:this._frames[a-1].image),b;
if(DEBUG){console.log("Drawing superKeyframe for composite base: superKeyframe "+(a-1))
}j.drawImage(d,0,0);return this._compositor.compositeFrames.call(this._compositor,a,c)
};h._getClosestSuperFrame=function(a){return Math.round(a/this._superframeInterval)*this._superframeInterval
};h._getClosestSuperKeyframe=function(i){var b,a,c,d,l=this._frames.length;if(i<l+1&&i>0){d=i-1;
while(d>=0){if(this._frames[d].type==="keyframe"){b=d+1;break}d-=1}d=i+1;while(d<=l-1){if(this._frames[d].type==="keyframe"){a=d+1;
break}d+=1}}b=b?b:0;a=a?a:this.frameCount;c=(i-b)<(a-i)?b:a;return c};h._isKeyframeDiff=function(a){return this._compositor._isKeyframeDiff.apply(this._compositor,arguments)
};if(typeof Object.defineProperties!=="function"){return function(){}}Object.defineProperties(h,{frameCount:{get:function(){return this._compositor.frameCount
},enumerable:true},canvas:{get:function(){return this._compositor.canvas},set:function(a){return this._compositor.canvas=a
},enumerable:true},mainCompositor:{get:function(){return this._compositor.mainCompositor
},enumerable:true}});return g});AC.define("flow/compositor/decorator/Cache",[],function(){var c;
function d(a,b){this._compositor=a;this._keyframeInterval=b||8;this._keyframes=[]
}c=d.prototype;c._getClosestKeyframe=function(f){var b=f%this._keyframeInterval,a=Math.floor(f/this._keyframeInterval)+((b>(this._keyframeInterval/2))?1:0);
return a};c._getFrameFromKeyframe=function(a){return a*this._keyframeInterval};
c._saveKeyframe=function(a){var f,b=Math.floor(a/this._keyframeInterval);if(a%this._keyframeInterval===0&&!this._keyframes[b]){if(DEBUG){console.log("saving keyframe "+a)
}f=document.createElement("canvas");f.width=this._compositor.canvas.width;f.height=this._compositor.canvas.height;
f.getContext("2d").drawImage(this._compositor.canvas,0,0);this._keyframes[b]=f}};
c.init=function(a){return this._compositor.init.apply(this._compositor,arguments)
};c.applyFrame=function(){this._compositor.applyFrame.apply(this._compositor,arguments)
};c.calculateRenderCount=function(b,a){b=this._getFrameFromKeyframe(this._getClosestKeyframe(a));
return this._compositor.calculateRenderCount(b,a)+1};c.compositeFrames=function(h,b){var a=this._getClosestKeyframe(b);
if(DEBUG){console.groupCollapsed("Rendering frames: "+h+"..."+b)}if(this._keyframes[a]&&(this._compositor.calculateRenderCount(h,b)>this.calculateRenderCount(h,b))){h=this._getFrameFromKeyframe(a);
if(DEBUG){console.log("applying prerendered keyframe: "+h)}this.applyFrame(this._keyframes[a]);
return this._compositor.compositeFrames(h,b).then(function g(){if(DEBUG){console.groupEnd()
}})}else{return this._compositor.compositeFrames(h,b).then(function g(){if(DEBUG){console.groupEnd()
}},null,this._saveKeyframe.bind(this))}};if(typeof Object.defineProperties!=="function"){return function(){}
}Object.defineProperties(c,{frameCount:{get:function(){return this._compositor.frameCount
},enumerable:true},canvas:{get:function(){return this._compositor.canvas},set:function(a){return this._compositor.canvas=a
},enumerable:true}});return d});AC.define("stats/Benchmark",[],function(){function b(a){this.name=a
}b.prototype.start=function(){if(DEBUG){console.log("▼▼▼ start "+this.name+" benchmark");
this.startTime=new Date().getTime();console.time(this.name)}};b.prototype.end=function(){if(DEBUG){this.endTime=new Date().getTime();
console.log("▲▲▲ end "+this.name+" benchmark "+(this.endTime-this.startTime)/1000+" sec");
console.time(this.timeEnd)}};return b});AC.define("flow/compositor/decorator/Benchmark",["require","stats/Benchmark"],function(f){var e,g=f("stats/Benchmark");
function h(a){this._compositor=a}e=h.prototype;e.init=function(b){var a=new g("init");
a.start();return this._compositor.init.apply(this._compositor,arguments).then(a.end.bind(a))
};e.applyFrame=function(){var a=new g("applyFrame");a.start();this._compositor.applyFrame.apply(this._compositor,arguments);
a.end.bind(a)};e.calculateRenderCount=function(){return this._compositor.calculateRenderCount.apply(this._compositor,arguments)
};e.compositeFrames=function(){var a=new g("renderFrames");a.start();return this._compositor.compositeFrames.apply(this._compositor,arguments).then(a.end.bind(a))
};if(typeof Object.defineProperties!=="function"){return function(){}}Object.defineProperties(e,{frameCount:{get:function(){return this._compositor.frameCount
},enumerable:true},canvas:{get:function(){return this._compositor.canvas},set:function(a){return this._compositor.canvas=a
},enumerable:true}});h.prototype=e;return h});AC.define("flow/Flow",["require","defer/Deferred","flow/compositor/decorator/Keyframe","flow/compositor/decorator/Superframe","flow/compositor/decorator/SuperKeyframe","flow/compositor/decorator/Cache","flow/compositor/decorator/Benchmark"],function(r){var p,m=r("defer/Deferred"),l=r("flow/compositor/decorator/Keyframe"),n=r("flow/compositor/decorator/Superframe"),o=r("flow/compositor/decorator/SuperKeyframe"),j=r("flow/compositor/decorator/Cache"),k=r("flow/compositor/decorator/Benchmark");
function q(b,a){this._compositor=b;this.options=a||{}}p=q.prototype;p.gotoFrame=function(a){if(this._rendering){return(new m()).resolve()
}else{if(this._currentFrame===a){return(new m()).resolve()}}this._rendering=true;
if(DEBUG){console.groupCollapsed("gotoFrame:"+a+" currentFrame:"+this._currentFrame)
}return this._compositor.compositeFrames(this._currentFrame,a).then(function(){this._rendering=false;
this._currentFrame=a;if(DEBUG){console.groupEnd()}}.bind(this))};p.init=function(a){var b;
if(a.nodeName==="CANVAS"){b=a}else{b=document.createElement("canvas");a.appendChild(b)
}return this._compositor.init(b).then(function(c){return m.all([this._compositor.createDiffRender(c).then(this._decorateCompositor.bind(this))])
}.bind(this))};p._decorateCompositor=function(){var c=this._compositor,a=this._compositor._diffRender.flowData,b=this._compositor.canvas;
if(a.superframeFrequency){c=new n(c,a.superframeFrequency)}if(a.version===3){c=new l(c)
}if(a.version===3&&a.superframeFrequency){c=new o(c)}if(this.options.keyframeCache){c=new j(c,this.options.keyframeCache)
}if(this.options.benchmark){c=new k(c)}if(c===this._compositor){return(new m()).resolve()
}else{this._compositor=c;return this._compositor.init(b)}};if(typeof Object.defineProperties!=="function"){return function(){}
}Object.defineProperties(p,{_currentFrame:{value:0,enumerable:false,writable:true},frameCount:{get:function(){return this._compositor.frameCount
},enumerable:true}});return q});AC.define("flow/playerFactory",["require","flow/compositor/Sequence","flow/data/provider/Async","flow/data/provider/Sync","flow/Player","flow/Flow"],function(n){var h=n("flow/compositor/Sequence"),j=n("flow/data/provider/Async"),k=n("flow/data/provider/Sync"),i=n("flow/Player"),m=n("flow/Flow");
function l(b,p,c,a,d){var e,g,f;d=d||{};d={keyframeCache:(typeof d.keyframeCache==="undefined")?8:d.keyframeCache,benchmark:(typeof d.benchmark==="undefined")?false:d.benchmark,preload:(typeof d.preload==="undefined")?true:d.preload};
p=p||[b.getAttribute("data-start-frame")];if(b.getAttribute("data-end-frame")){p.push(b.getAttribute("data-end-frame"))
}c=c||b.getAttribute("data-image-url-pattern");f=(typeof a==="string")?new j(a):new k(a);
e=new h(p,c,f);g=new i(b,new m(e,d));if(d.preload){g.load()}return g}return l});
AC.define("ipad/shared/mediaObject/Flow",["require","ipad/shared/mediaObject/MediaObject","flow/playerFactory"],function(e){var f=e("ipad/shared/mediaObject/MediaObject");
var h=e("flow/playerFactory");var g=AC.Class(f,{initialize:function($super,a){this._filename="flow";
this._canvas=null;$super(a)},__generate:function(){var c="json";var m=document.createElement("canvas");
var p={keyframecache:false,preload:false};var n=this.retina()===false?"":"_2x";
var d=this.basePath()+this.filename()+"_###."+this.flowExtension();var b=this.basePath().replace(/^https?:\/\/[^\/]+\//i,"/")+this.filename()+"_manifest."+c;
var a=[this.basePath()+this.filename()+"_keyframe."+this.flowExtension(),this.basePath()+this.filename()+"_endframe."+this.flowExtension()];
var o=h(m,a,d,b,p);o.frameRate=this.frameRate();o=this.__decorateFlow(o,m);this.setMediaObject(o);
this.setCanvas(m);return o},__inject:function(){AC.Element.insert(this.canvas(),this.container())
},__decorateFlow:function(b,a){b.addEventListener=b.on;b.off=function(){a.removeEventListener.apply(a,arguments)
};b.removeEventListener=b.off;return b},__load:function(){return this.mediaObject().load()
},__play:function(){if(this.canplaythrough()){this.mediaObject().play()}else{this.setAutoplay(true);
this.load().then(this.play().bind(this))}},getMediaElement:function(){return this.canvas()
}});return g});AC.define("ipad/shared/mediaObject/Video",["require","ipad/shared/mediaObject/MediaObject"],function(f){var e=f("ipad/shared/mediaObject/MediaObject");
var d=AC.Class(e,{initialize:function($super,a){$super(a)},__generate:function(){var c=this.retina()===false?"":"_2x";
var b=document.createElement("video");var a=this.basePath()+this.filename()+c+"."+this.videoExtension();
b.setAttribute("src",a);this.setMediaObject(b);return b},__load:function(){this.mediaObject().load()
},__hidePosterframeOnTimeUpdate:function(){if(this.mediaObject().currentTime>0){this.hidePosterframe();
AC.Element.removeEventListener(this.mediaObject(),"timeupdate",this.__timeUpdateListener)
}},__play:function(){this.__timeUpdateListener=this.__hidePosterframeOnTimeUpdate.bind(this);
AC.Element.addEventListener(this.mediaObject(),"timeupdate",this.__timeUpdateListener);
this.mediaObject().play()},play:function($super){$super()},__reset:function(){if(this.mediaObject().readyState===4){this.mediaObject().currentTime=0
}},stop:function($super){if(this.__timeUpdateListener){AC.Element.removeEventListener(this.mediaObject(),"timeupdate",this.__timeUpdateListener,false)
}$super()},rangeIsBuffered:function(b,c){if(this.mediaObject()&&this.mediaObject().buffered&&this.mediaObject().buffered.length>0){var a=[this.mediaObject().buffered.start(0),this.mediaObject().buffered.end(0)];
return(b>=a[0]&&c<=a[1])}return false},showPosterframe:function($super,a){$super(a)
},hidePosterframe:function($super,a){$super(a)}});return d});AC.define("ipad/shared/mediaObject/Factory",["require","ipad/shared/mediaObject/Flow","ipad/shared/mediaObject/Video"],function(h){var g=h("ipad/shared/mediaObject/Flow");
var e=h("ipad/shared/mediaObject/Video");var f=AC.Class({initialize:function(){this.synthesize()
},create:function(a){var b;if(a.type==="video"||a.type==="video_2x"){b=new e(a)
}if(a.type==="flow"||a.type==="flow_2x"){b=new g(a)}return b}});return f.sharedInstance()
});AC.define("overview/desktop/experience/builder",["require","ipad/shared/experienceReporter/ExperienceReporter","animationSequencer/adapters/ReversibleVideo","ipad/shared/mediaObject/Factory"],function(b){return function(t,w,B){var s=b("ipad/shared/experienceReporter/ExperienceReporter");
var z=b("animationSequencer/adapters/ReversibleVideo");var r=b("ipad/shared/mediaObject/Factory");
var y="_2x";var A="flow";var u="video";var D=u+y;var a=A+y;var x=s.newExperience(t);
var v=x.getExperience();var q={container:AC.Element.getElementById(w.mediaFileName),type:v,basePath:B+w.mediaFileName+(v===A||v===a?"/"+A:""),filename:(v===D?w.mediaFileName+y:w.mediaFileName),retina:x.isRetina()};
var C=r.create(q);if(s.getEnvironment().browser==="chrome"||s.getEnvironment().browser==="firefox"){if(C.type().match("video")){C.setMediaObject(new z(C.mediaObject()))
}}return[C,x]}});AC.define("overview/shared/scene/helper/SceneElement",["require"],function(d){var c=function(a,b){this.id=a;
this._element=null;AC.Object.extend(this,b);AC.Object.synthesize(this)};c.prototype={element:function(){if(!this._element){this.setElement(AC.Element.getElementById(this.id))
}if(this._element===null){throw"Element #"+this.id+" does not exist."}return this._element
}};return c});AC.define("overview/desktop/storyboard/intro",["require","overview/shared/scene/helper/SceneElement"],function(d){var c=d("overview/shared/scene/helper/SceneElement");
return new c("chapter-one",{mediaFileName:"intro"})});AC.define("overview/desktop/storyboard/story",["require","overview/shared/scene/helper/SceneElement"],function(d){var c=d("overview/shared/scene/helper/SceneElement");
return new c("chapter-two",{mediaFileName:"story",scenes:[new c("hero",{endTime:0}),new c("design",{endTime:2}),new c("performance",{endTime:4.2}),new c("wireless",{endTime:6.5}),new c("apps",{endTime:8.8}),new c("ios",{endTime:10.6}),new c("smart-cover",{endTime:14.3}),new c("footer")]})
});AC.define("overview/desktop/experience/intro",["require"],function(d){var c=[{platform:"desktop",os:"",os_version:"",browser:"safari",browser_version:"",video:"1",video_2x:"",flow:"",flow_2x:"",id:0},{platform:"desktop",os:"",os_version:"",browser:"chrome",browser_version:"",video:"1",video_2x:"",flow:"",flow_2x:"",id:1},{platform:"desktop",os:"",os_version:"",browser:"firefox",browser_version:"",video:"",video_2x:"",flow:"1",flow_2x:"",id:2},{platform:"desktop",os:"",os_version:"",browser:"ie",browser_version:"9",video:"",video_2x:"",flow:"",flow_2x:"",id:3},{platform:"desktop_retina",os:"",os_version:"",browser:"safari",browser_version:"",video:"",video_2x:"1",flow:"",flow_2x:"",id:4},{platform:"desktop_retina",os:"",os_version:"",browser:"chrome",browser_version:"",video:"",video_2x:"1",flow:"",flow_2x:"",id:5},{platform:"desktop_retina",os:"",os_version:"",browser:"firefox",browser_version:"",video:"",video_2x:"",flow:"",flow_2x:"1",id:6},{platform:"tablet",os:"ios",os_version:"7",browser:"safari mobile",browser_version:"",video:"",video_2x:"",flow:"",flow_2x:"",id:9},{platform:"tablet",os:"ios",os_version:"6",browser:"safari mobile",browser_version:"",video:"",video_2x:"",flow:"",flow_2x:"",id:10},{platform:"tablet_retina",os:"ios",os_version:"7",browser:"safari mobile",browser_version:"",video:"",video_2x:"",flow:"",flow_2x:"",id:11},{platform:"tablet_retina",os:"ios",os_version:"6",browser:"safari mobile",browser_version:"",video:"",video_2x:"",flow:"",flow_2x:"",id:12}];
return c});AC.define("overview/desktop/experience/story",["require"],function(b){return[{platform:"desktop",os:"",os_version:"",browser:"safari",browser_version:"",video:"1",video_2x:"",flow:"",flow_2x:"",id:0},{platform:"desktop",os:"",os_version:"",browser:"chrome",browser_version:"",video:"1",video_2x:"",flow:"",flow_2x:"",id:1},{platform:"desktop",os:"",os_version:"",browser:"firefox",browser_version:"",video:"",video_2x:"",flow:"1",flow_2x:"",id:2},{platform:"desktop",os:"",os_version:"",browser:"ie",browser_version:"9",video:"",video_2x:"",flow:"",flow_2x:"",id:3},{platform:"desktop_retina",os:"",os_version:"",browser:"safari",browser_version:"",video:"",video_2x:"1",flow:"",flow_2x:"",id:4},{platform:"desktop_retina",os:"",os_version:"",browser:"chrome",browser_version:"",video:"",video_2x:"1",flow:"",flow_2x:"",id:5},{platform:"desktop_retina",os:"",os_version:"",browser:"firefox",browser_version:"",video:"",video_2x:"",flow:"",flow_2x:"1",id:6}]
});AC.define("overview/shared/story/controller/Media",["require","eventEmitter/EventEmitter","defer/Deferred"],function(h){var f=h("eventEmitter/EventEmitter");
var e=h("defer/Deferred");function g(b,c,a){this._events=new f();this._experience=a;
this._init(c,b)}g.prototype={_init:function(c,d){var b;var a=new e();var k=new e();
var l=e.all([a,k]);if(c===undefined){throw"Intro media object is undefined"}if(d===undefined){throw"Story media object is undefined"
}c.on("canplaythrough",this._notifyIntroStart.bind(this));c.on("ended",k.resolve.bind(k));
d.on("canplaythrough",a.resolve.bind(a));l.then(this._notifyStartStory.bind(this));
if(typeof window.FALLBACK_TIMEOUT==="number"){b=window.setTimeout(function(){this.trigger("fallback");
this.__degraded=true}.bind(this),window.FALLBACK_TIMEOUT*1000);c.on("canplaythrough",function(){window.clearTimeout(b)
})}},_notifyIntroStart:function(){this.trigger("startintro")},_notifyStartStory:function(){if(!this.__degraded){this.trigger("startstory")
}},on:function(b,a){this._events.on.apply(this,[b,a]);return this},off:function(b,a){this._events.off.apply(this,[b,a]);
return this},trigger:function(a,b){this._events.trigger.apply(this,[a,b]);return this
}};return g});AC.define("overview/shared/intro/Intro",["require"],function(c){function d(a,b){this._element=a.element();
this._mediaElement=a.mediaElement;this._storyContainer=b.element()}d.prototype={play:function(){this._mediaElement.play()
},show:function(){AC.Element.addClassName(this._element,"in")},hide:function(){AC.Element.addClassName(this._element,"animated");
AC.Element.removeClassName(this._element,"in");AC.Element.addClassName(this._storyContainer,"in")
}};return d});AC.define("overview/shared/intro/builder",["require","overview/shared/intro/Intro"],function(c){var d=c("overview/shared/intro/Intro");
return function(a,b){return new d(a,b)}});AC.define("overview/shared/story/Story",["require","eventEmitter/EventEmitter","defer/Deferred"],function(f){var i=f("eventEmitter/EventEmitter");
var g=f("defer/Deferred");function h(a,c,b){this._player=a;this._scenes=c;this._options=b;
this._currentSceneIndex=0;this._locked=false;this._storyStatic=false;this._fadeOutClass="fade-out";
this._staticClass="static"}var j=h.prototype=new i();j.getScene=function(a){return this._scenes[a]
};j.currentSceneIndex=function(){return this._currentSceneIndex};j.isLocked=function(){return this._locked
};j.setLocked=function(a){if(a===true){this.trigger("lock")}else{if(a===false){this.trigger("unlock")
}}this._locked=a;return this};j.unlock=function(){return this.setLocked(false)};
j.lock=function(){return this.setLocked(true)};j.playToNext=function(){return this.play()
};j.__goToScene=function(d,c){var a;var b=this.getScene(d);b._player.hidePosterframe();
a=this.__hideMediaContainer();a=a.then(function(){b.showLastFrame();this.__showMediaContainer();
this.__afterShow(d,c)}.bind(this));return a};j.__fallbackToScene=function(e,b){var a;
var c=this.getScene(e);var d=this.getScene(this._currentSceneIndex);if(this._storyStatic===false){c._player.hidePosterframe();
a=this.__hideMediaContainer();this._player.pause()}else{a=this.__hideSceneContainer(d._scenes[this._currentSceneIndex],this._currentSceneIndex)
}a=a.then(function(){this.__showSceneContainer(c._scenes[e],e);if(this._storyStatic===false){this._storyStatic=true
}this.__afterShow(e,b)}.bind(this));return a};j.__hideSceneContainer=function(b,d){var a=new g();
if(d===0||d===7){return a.resolve()}var c=function(e){AC.Element.removeVendorPrefixEventListener(b.element(),"transitionEnd",c);
a.resolve()}.bind(this);if(AC.Environment.Feature.cssPropertyAvailable("transition")){AC.Element.addVendorPrefixEventListener(b.element(),"transitionEnd",c);
AC.Element.removeClassName(b.element(),this._staticClass)}else{a.resolve()}return a.promise()
};j.__showSceneContainer=function(b,d){var a=new g();if(d===0||d===7){if(d===0){AC.Element.removeClassName(document.body,"story-started")
}return a.resolve()}var c=function(e){AC.Element.removeVendorPrefixEventListener(b.element(),"transitionEnd",c);
a.resolve()}.bind(this);if(AC.Environment.Feature.cssPropertyAvailable("transition")){AC.Element.addVendorPrefixEventListener(b.element(),"transitionEnd",c);
AC.Element.addClassName(b.element(),this._staticClass)}else{a.resolve()}return a.promise()
};j.__showMediaContainer=function(){var a=new g();var b=this._player.container();
var c=function(d){AC.Element.removeVendorPrefixEventListener(b,"transitionEnd",c);
a.resolve()}.bind(this);if(AC.Environment.Feature.cssPropertyAvailable("transition")){AC.Element.addVendorPrefixEventListener(b,"transitionEnd",c);
AC.Element.removeClassName(b,this._fadeOutClass)}else{a.resolve()}return a.promise()
};j.__hideMediaContainer=function(){var a=new g();var b=this._player.container();
var c=function(){AC.Element.removeVendorPrefixEventListener(b,"transitionEnd",c);
a.resolve()}.bind(this);if(AC.Environment.Feature.cssPropertyAvailable("transition")){if(AC.Element.hasClassName(b,this._fadeOutClass)){a.resolve()
}else{AC.Element.addVendorPrefixEventListener(b,"transitionEnd",c);AC.Element.addClassName(b,this._fadeOutClass)
}}else{a.resolve()}return a.promise()};j.show=function(e,q){var b=new g();var d=(e>this._currentSceneIndex);
var r=Math.abs(e-this._currentSceneIndex);var p=this.getScene(e);var o=this.getScene(this._currentSceneIndex);
var a;var c=AC.Element.getElementById(this._storyContainer);if(this.isLocked()||p===undefined){return
}this.__willShow(e,q);if(this._storyStatic===false){if(this._options.enableFallback===true&&p.isBuffered()===false){return this.__fallbackToScene(e,q)
}if(r>1){return this.__goToScene(e,q)}if((d&&p.getPlaybackRate()<0)||(!d&&p.getPlaybackRate()>0)){p.setPlaybackRate(p.getPlaybackRate()*-1)
}a=p.play();a=a.then(this.__afterShow.bind(this,e,q));return a}else{this.__fallbackToScene(e,q)
}};j.numScenes=function(){return this._scenes.length};j.__willShow=function(b,a){this.lock();
this.trigger("willShow",{incomingIndex:b,outgoingIndex:this._currentSceneIndex,incomingScene:this.getScene(b)._scenes[b],outgoingScene:this.getScene(this._currentSceneIndex)._scenes[this._currentSceneIndex],interactionType:a})
};j.__afterShow=function(c,b){var a=this._currentSceneIndex;this.unlock();this._currentSceneIndex=c;
this.trigger("didShow",{outgoingIndex:a,incomingIndex:c,incomingScene:this.getScene(c)._scenes[c],outgoingScene:this.getScene(a)._scenes[a],interactionType:b})
};return h});AC.define("overview/shared/story/observer/Scene",[],function(){function b(a,d){this._player=a;
this._activeClass="active";this._staticClass="static";this._footerIndex=d;this._previousIndex=0
}b.prototype={onDidShow:function(a){var f;var e=this._player.mediaObject().duration;
if(a.incomingIndex>this._footerIndex){f=AC.Element.select("#footer")}else{if(a.incomingScene&&a.incomingScene.element()){f=a.incomingScene.element()
}}if(f){AC.Element.addClassName(f,this._activeClass)}if(a.incomingIndex>=this._footerIndex&&this._player.mediaObject()&&!isNaN(e)){this._player.mediaObject().currentTime=e
}},onWillShow:function(a){if(this._previousIndex>=this._footerIndex&&a.incomingIndex>=this._footerIndex){this._previousIndex=a.incomingIndex;
return}this._previousIndex=a.incomingIndex;if(a.outgoingScene&&a.outgoingScene.element()){AC.Element.removeClassName(a.outgoingScene.element(),this._activeClass)
}}};return b});AC.define("overview/shared/story/observer/Beginning",[],function(){function b(){this._isTablet=AC.Environment.Feature.isTablet()
}b.prototype={onWillShow:function(a){if(a.outgoingIndex===0){AC.Element.addClassName(document.body,"story-started")
}else{if(a.incomingIndex===0){if(!this._isTablet){AC.Element.removeClassName(document.body,"story-started")
}}}}};return b});AC.define("overview/shared/story/observer/End",[],function(){function b(a,d){this._lastSceneClass="last-scene";
this._footerIndex=d}b.prototype={onWillShow:function(a){if(a.incomingIndex>=this._footerIndex){AC.Element.addClassName(document.body,this._lastSceneClass)
}if(a.incomingIndex<this._footerIndex){if(AC.Element.hasClassName(document.body,this._lastSceneClass)){AC.Element.removeClassName(document.body,this._lastSceneClass)
}}}};return b});AC.define("overview/shared/story/observer/Nav",["require"],function(c){var d=function(a,g,h,b){this._navElements=a;
this._activeClass=h||"active";this._currentActiveNav=g||null;this._footerIndex=b
};d.prototype={onWillShow:function(b){var f=b.incomingIndex;if(b.incomingIndex>=this._footerIndex){f=this._footerIndex
}var a=this._navElements[f];if(this._currentActiveNav!==null){AC.Element.removeClassName(this._currentActiveNav,this._activeClass)
}if(a){AC.Element.addClassName(a,this._activeClass)}this._currentActiveNav=a}};
return d});AC.define("overview/shared/analytics/Analyzer",["require"],function(e){function f(){this._trackingQueue=[];
this._interactionStart=null}var d=f.prototype;d.flush=function(){var a;while(a=this._trackingQueue.shift()){this.trackProps(a)
}};d.initInteraction=function(a){this._interactionStart=a||+new Date()};d.queueInteraction=function(b,k,n){var l=+new Date();
var a=((l-this._interactionStart)/1000).toFixed(1);var m=AC.Tracking.pageName()+" - "+k.toLowerCase()+" - section "+n;
var c={prop1:b,prop3:m,prop35:a};this._trackingQueue.push(c)};d.trackProps=function(a){if(typeof a.prop3!=="string"){return
}AC.Tracking.trackClick(a,window,"o",a.prop3)};d.trackLink=function(a,b,c){if(arguments.length<3){return
}window.setTimeout(function(){AC.Tracking.trackClick({prop1:a,prop3:AC.Tracking.pageName()+" - "+b.toString().toLowerCase()+" - section "+c},this,"o",AC.Tracking.pageName()+" - "+b.toLowerCase()+" - section "+c)
},1000)};return f});AC.define("overview/shared/story/observer/Analytics",["require","overview/shared/analytics/Analyzer"],function(e){var f=e("overview/shared/analytics/Analyzer");
function d(a){this._footerIndex=a;this._previousIndex=0;this.analyzer=new f();window.addEventListener("beforeunload",function(){this.analyzer.flush()
}.bind(this))}d.prototype={onWillShow:function(a){if(window.analyticsIntroStartTime!==undefined){this.analyzer.initInteraction(window.analyticsIntroStartTime);
window.analyticsIntroStartTime=undefined}if(this._analyzerTimeout!==undefined){clearTimeout(this._analyzerTimeout)
}this.analyzer.queueInteraction(a.interactionType,a.outgoingScene.id,a.outgoingIndex)
},onDidShow:function(a){if(this._previousIndex>=this._footerIndex&&a.incomingIndex>=this._footerIndex){return
}this.analyzer.initInteraction();this._previousIndex=a.incomingIndex;if(this._analyzerTimeout!==undefined){clearTimeout(this._analyzerTimeout)
}this._analyzerTimeout=window.setTimeout(function(){this.analyzer.flush()}.bind(this),1000)
}};return d});AC.define("overview/shared/story/controller/Nav",["require"],function(d){function c(f,a,b){this._story=f;
this._elements=a;this._elementSelector=b;this._touch=touch="ontouchstart" in window;
this._hoverClass="hover";this._navEl="section-nav"}c.prototype={setStory:function(a){this._story=a
},onNavClick:function(a){var e=this._elementSelector+" *";var b=AC.Event.target(a);
if(AC.Element.matchesSelector(b,this._elementSelector)||AC.Element.matchesSelector(b,e)){a.preventDefault();
while(!AC.Element.matchesSelector(b,this._elementSelector)){b=b.parentNode}this._story.show(this._elements.indexOf(b),"bubble-click")
}},activate:function(){var a="ontouchstart" in window;AC.Element.addEventListener(document,(a)?"touchstart":"click",this.onNavClick.bind(this))
}};return c});AC.define("overview/shared/story/controller/ScrollToContinue",["require"],function(c){function d(a,b){this._story=a;
this._startScene=b}d.prototype={setStory:function(a){this._story=a},onClick:function(){this._story.show(this._startScene)
},activate:function(){var a=AC.Element.select("#scroll-button");AC.Element.addEventListener(a,"click",this.onClick.bind(this))
}};return d});AC.define("overview/shared/scene/helper/footer",["require"],function(e){function f(){var c=AC.Element.selectAll("#footer .scene-content .mini-promo, #footer .footer-wrapper > *");
var a=[];for(var b=0;b<c.length;b++){a.push({section:c[b],height:AC.Element.getBoundingBox(c[b]).height,top:c[b].offsetTop})
}return a}function d(a,b){return{easing:"easeOutQuad",from:a,to:b,property:"y"}
}return function(){var u=AC.Element.select("#footer .footer-wrapper");var s=u.offsetHeight+u.offsetTop;
var a=f();var x=(document.documentElement.clientHeight||window.innerHeight||document.documentElement.offsetHeight);
var b=AC.Element.select("#footer").offsetTop-x;var c=[];var i=x;var B=-(b+s);if(s<i){c.push(d(-b,B))
}else{var t=a[0];var v=-(b+i);var y=u.offsetTop;c.push(d(-b,v));for(var z=1,w=a.length;
z<w;++z){t=a[z];if(y+t.height>i){var A=v-y;if(A<B){A=B;z=w}c.push(d(v,A));v-=y;
y=0}y+=t.height}}return c}});AC.define("overview/shared/scene/Scene",["require","defer/Deferred"],function(f){var d=f("defer/Deferred");
function e(a,j,c,i,b){this._player=a;this._scenes=j;this._pauseTime=i;this._index=b;
this._pauseController=c;this._activeClass="active";this._showClass="show";this._waitDataAttr="data-wait";
this._isStatic=false}e.prototype={isBuffered:function(){if(this._scenes[this._index].endTime!==undefined&&this._scenes[this._index].endTime!==0){return this._player.rangeIsBuffered(this._scenes[this._index-1].endTime,this._scenes[this._index].endTime)
}return true},showLastFrame:function(){var a;if(this._pauseTime!==undefined){this._player.mediaObject().currentTime=this._pauseTime;
a=this._pauseController._pauses.indexOf(this._pauseTime);this._pauseController._previousPauseIndex=a
}},getPlaybackRate:function(a){return this._player.mediaObject().playbackRate},setPlaybackRate:function(a){this._player.mediaObject().playbackRate=a
},play:function(){var a=new d();var b=function(h){var c;this._pauseController.off("pauseenter",b);
c=this._pauseController._pauses.indexOf(this._pauseTime);this._pauseController._previousPauseIndex=c;
a.resolve()}.bind(this);this._pauseController.on("pauseenter",b);this._player.play();
return a.promise()}};return e});AC.define("overview/shared/scene/SceneDesign",["require","defer/Deferred","overview/shared/scene/Scene"],function(j){var f=j("defer/Deferred");
var g=j("overview/shared/scene/Scene");function i(a,e,c,d,b){g.call(this,a,e,c,d,b)
}var h=i.prototype=new g();h.play=function(){var a=new f();if(this.getPlaybackRate()>0){var b=function(c){AC.Element.removeVendorPrefixEventListener(this._scenes[this._index].element(),"transitionEnd",b);
a.resolve()}.bind(this);AC.Element.addVendorPrefixEventListener(this._scenes[this._index].element(),"transitionEnd",b);
AC.Element.addClassName(this._scenes[this._index].element(),this._activeClass);
AC.Element.removeClassName(this._scenes[this._index-1].element(),this._activeClass);
this._player.mediaObject().load();return a.promise()}else{return g.prototype.play.apply(this,arguments)
}};return i});AC.define("overview/shared/scene/SceneWireless",["require","defer/Deferred","overview/shared/scene/Scene"],function(j){var f=j("defer/Deferred");
var g=j("overview/shared/scene/Scene");function i(a,e,c,d,b){g.call(this,a,e,c,d,b)
}var h=i.prototype=new g();h.showLastFrame=function(){g.prototype.showLastFrame.apply(this,arguments)
};h.play=function(){var a=new f();if(this.getPlaybackRate()<0){var b=function(d){var c=AC.Event.target(d);
if(c.getAttribute(this._waitDataAttr)==="true"){AC.Element.removeVendorPrefixEventListener(this._scenes[this._index+1].element(),"transitionEnd",b);
AC.Element.removeClassName(this._scenes[this._index+1].element(),this._showClass);
g.prototype.play.apply(this,arguments).then(a.resolve.bind(a))}}.bind(this);AC.Element.addVendorPrefixEventListener(this._scenes[this._index+1].element(),"transitionEnd",b);
AC.Element.addClassName(this._scenes[this._index+1].element(),this._showClass);
return a.promise()}else{return g.prototype.play.apply(this,arguments)}};return i
});AC.define("overview/shared/scene/SceneiOS",["require","defer/Deferred","overview/shared/scene/Scene"],function(j){var f=j("defer/Deferred");
var g=j("overview/shared/scene/Scene");function h(a,e,c,d,b){g.call(this,a,e,c,d,b)
}var i=h.prototype=new g();i.showLastFrame=function(){g.prototype.showLastFrame.apply(this,arguments)
};i.play=function(){var a=new f();if(this.getPlaybackRate()>0){var b=function(d){var c=AC.Event.target(d);
if(c.getAttribute(this._waitDataAttr)==="true"){AC.Element.removeVendorPrefixEventListener(this._scenes[this._index-1].element(),"transitionEnd",b);
AC.Element.removeClassName(this._scenes[this._index-1].element(),this._showClass);
g.prototype.play.apply(this,arguments).then(a.resolve.bind(a))}}.bind(this);AC.Element.addVendorPrefixEventListener(this._scenes[this._index-1].element(),"transitionEnd",b);
AC.Element.addClassName(this._scenes[this._index-1].element(),this._showClass);
return a.promise()}else{return g.prototype.play.apply(this,arguments)}};return h
});AC.define("overview/shared/scene/SceneSmartCover",["require","defer/Deferred","overview/shared/scene/Scene"],function(j){var f=j("defer/Deferred");
var g=j("overview/shared/scene/Scene");function i(a,e,c,d,b){g.call(this,a,e,c,d,b)
}var h=i.prototype=new g();h.showLastFrame=function(){return g.prototype.showLastFrame.apply(this,arguments)
};h.play=function(){var a=new f();if(this.getPlaybackRate()<0){var b=function(d){var c=AC.Event.target(d);
if(c.getAttribute(this._waitDataAttr)==="true"){AC.Element.removeVendorPrefixEventListener(this._scenes[this._index].element(),"transitionEnd",b);
this.showLastFrame();a.resolve()}}.bind(this);AC.Element.addVendorPrefixEventListener(this._scenes[this._index].element(),"transitionEnd",b);
AC.Element.addClassName(this._scenes[this._index].element(),this._activeClass);
return a.promise()}else{return g.prototype.play.apply(this,arguments)}};return i
});AC.define("overview/shared/scene/SceneIntro",["require","defer/Deferred","overview/shared/scene/Scene"],function(j){var f=j("defer/Deferred");
var g=j("overview/shared/scene/Scene");function h(a,e,c,d,b){g.call(this,a,e,c,d,b);
this._storyStartedClass="story-started"}var i=h.prototype=new g();i.showLastFrame=function(){AC.Element.addClassName(this._scenes[this._index].element(),this._activeClass);
AC.Element.removeClassName(document.body,this._storyStartedClass)};i.play=function(){var a=new f();
if(this.getPlaybackRate()<0){AC.Element.removeClassName(document.body,this._storyStartedClass);
return a.resolve()}};return h});AC.define("overview/shared/scene/SceneFooter",["require","defer/Deferred","overview/shared/scene/Scene"],function(i){var j=i("defer/Deferred");
var f=i("overview/shared/scene/Scene");function g(a,e,c,d,b){f.call(this,a,e,c,d,b)
}var h=g.prototype=new f();h.showLastFrame=function(){AC.Element.setVendorPrefixStyle(this._scenes[this._index].element(),"transform","translate3d(0, 0, 0)");
return f.prototype.showLastFrame.apply(this,arguments)};h.play=function(){var b=new j();
if(this.getPlaybackRate()<0){var a=function(c){AC.Element.removeVendorPrefixEventListener(this._scenes[this._index].element(),"transitionEnd",a);
b.resolve()}.bind(this);AC.Element.addVendorPrefixEventListener(this._scenes[this._index].element(),"transitionEnd",a);
AC.Element.setVendorPrefixStyle(this._scenes[this._index].element(),"transform","translate3d(0, 0, 0)");
return b.promise()}else{return f.prototype.play.apply(this,arguments)}};return g
});AC.define("overview/shared/scene/SceneSubFooter",["require","defer/Deferred"],function(d){var e=d("defer/Deferred");
function f(a,b){this._element=AC.Element.select("#footer");this._to=null;this._scenes=b;
this._scenes[a]={id:"inner-footer",element:function(){return this._element}.bind(this)};
this._player={hidePosterframe:function(){}}}f.prototype={_playbackRate:1,setPlaybackRate:function(a){this._playbackRate=a
},getPlaybackRate:function(){return this._playbackRate},isBuffered:function(){return true
},setTo:function(a){this._to=a},showLastFrame:function(){AC.Element.setVendorPrefixStyle(this._element,"transform","translate3d(0, "+this._to+"px, 0)")
},play:function(){var b=new e();var a=function(c){AC.Element.removeVendorPrefixEventListener(this._element,"transitionEnd",a);
b.resolve()}.bind(this);AC.Element.addVendorPrefixEventListener(this._element,"transitionEnd",a);
AC.Element.setVendorPrefixStyle(this._element,"transform","translate3d(0, "+this._to+"px, 0)");
return b.promise()}};return f});AC.define("overview/shared/scene/factory",["require","overview/shared/scene/Scene","overview/shared/scene/SceneDesign","overview/shared/scene/SceneWireless","overview/shared/scene/SceneiOS","overview/shared/scene/SceneSmartCover","overview/shared/scene/SceneIntro","overview/shared/scene/SceneFooter","overview/shared/scene/SceneSubFooter"],function(r){var q=r("overview/shared/scene/Scene");
var k=r("overview/shared/scene/SceneDesign");var s=r("overview/shared/scene/SceneWireless");
var p=r("overview/shared/scene/SceneiOS");var n=r("overview/shared/scene/SceneSmartCover");
var t=r("overview/shared/scene/SceneIntro");var o=r("overview/shared/scene/SceneFooter");
var m=r("overview/shared/scene/SceneSubFooter");return function l(f,c,b,g,a,d){var e;
if(a===d.wireless){e=new s(f,c,b,g,a)}else{if(a===d.ios){e=new p(f,c,b,g,a)}else{if(d.design!==undefined&&a===d.design){e=new k(f,c,b,g,a)
}else{if(d.intro!==undefined&&a===d.intro){e=new t(f,c,b,g,a)}else{if(a===d.smartcover){e=new n(f,c,b,g,a)
}else{if(a===d.footer){e=new o(f,c,b,g,a)}else{if(a>d.footer){e=new m(a,c)}else{e=new q(f,c,b,g,a)
}}}}}}}return e}});AC.define("animationSequencer/vendor/utils",[],function(){return{isNum:function(b){return typeof b==="number"
},addClass:function(d,c){d.classList.add(c)},removeClass:function(d,c){d.classList.remove(c)
},hasClass:function(d,c){return d.contains(c)},defaults:function(h,e){var f={};
e=e||{};for(var g in h){if(h.hasOwnProperty(g)){f[g]=(e[g]!=null)?e[g]:h[g]}}return f
},defaultProps:function(i,j,g){var f=this.defaults(j,g);for(var h in f){if(f.hasOwnProperty(h)){i[h]=f[h]
}}},invoke:function(f,e){var d=[].slice.call(arguments,2);if(!Array.isArray(f)){throw new Error("List is not an array")
}f.forEach(function(b){var a=b[e];if(a&&typeof a==="function"){a.apply(b,d)}})}}
});AC.define("animationSequencer/PlayerMonitor",["require","eventEmitter/EventEmitter","animationSequencer/vendor/utils"],function(f){var h=f("eventEmitter/EventEmitter");
var g=f("animationSequencer/vendor/utils");function j(b,a,c){c=(Array.isArray(a)?c:a)||{};
a=(Array.isArray(a)?a:[]);this._player=b;this._isMonitoring=true;this._times=[0];
this._previous=0;this._currentTimeIndex=0;this._options=g.defaults({active:true,readyEvent:"canplaythrough"},c);
this._player.addEventListener(this._options.readyEvent,this._init.bind(this,a))
}var i=j.prototype=new h();i._init=function(a){if(this._initialized){return}this.addTime(this._player.duration);
if(a&&a.length){a.forEach(this.addTime.bind(this))}this._resetNextTimes();this._attachEvents();
if(this._options.active){this._listen()}this.trigger("ready");this._initialized=true
};i._attachEvents=function(){this._player.addEventListener("play",this._handlePlay.bind(this));
if(!this._options.active){this._player.addEventListener("timeupdate",this._listen.bind(this))
}this._player.addEventListener("seeked",this._handleSeek.bind(this));this._player.addEventListener("ratechange",this._handleRateChange.bind(this))
};i.addTime=function(b,a){b=parseFloat(b);if(isNaN(b)){throw new TypeError('Invalid time "'+b+'", expected Number"')
}if(this._times.indexOf(b)===-1){this._times.push(b);this._times.sort(function(c,d){return c-d
})}if(typeof a==="function"){this.on("time:"+b,a)}this._resetNextTimes()};i._handleSeek=function(){var a=this._player.currentTime;
var b=this._times.indexOf(a);this._currentTimeIndex=(b!==-1)?b:this._calcCurrentTimeIndex(a);
this._resetNextTimes()};i._handlePlay=function(){this._resetNextTimes();this._listen()
};i._handleRateChange=function(){var b=this._player.currentTime;var a=b===this._player.duration;
var c=this._times.indexOf(b)!==-1;this._currentTimeIndex=(a||c)?this._currentTimeIndex:this._calcCurrentTimeIndex(b);
this._resetNextTimes()};i._resetNextTimes=function(){var a=this._calcNextTimeIndex(this._currentTimeIndex);
if(g.isNum(a)){this._nextTimeIndex=a;this._nextTimePoint=this._times[a]}};i._calcCurrentTimeIndex=function(a){var d,b,c,e;
c=this._calcTimeIndices(a);b=c[0];d=c[1];e=(this._forwards())?b:d;return(this._validTimeIndex(e))?e:null
};i._validTimeIndex=function(a){return(0<=a&&a<=this._times.length-1)};i._calcNextTimeIndex=function(b){var a=b+((this._forwards())?1:-1);
return(this._validTimeIndex(a))?a:null};i._calcTimeIndices=function(a){var b=this._times.reduce(function(d,c,e){return(a>=this._times[d+1])?e:d
}.bind(this),0);return[b,b+1]};i._reachedNextTime=function(b){var c=this._forwards();
var e=this._nextTimePoint;var d=!this._player.paused||b===0||b===this._player.duration;
var a=c&&b>=e;var l=!c&&b<=e;return d&&(a||l)};i._forwards=function(){return this._player.playbackRate>0
};i._listen=function(){var b=this._player.currentTime;var c=this._previous;var a=this._reachedNextTime(b);
if(a){this._enterTimePoint(c)}this._previous=b;if(this._options.active&&!this._player.paused){window.requestAnimationFrame(this._listen.bind(this))
}};i._enterTimePoint=function(b){var c=this._calcNextTimeIndex(this._currentTimeIndex);
if(!g.isNum(c)){return}var a=this._times[c];this.trigger("time:"+a,{previous:b,next:this._player.currentTime,requested:a});
this._currentTimeIndex=c;this._resetNextTimes()};return j});AC.define("animationSequencer/controllers/Pause",["require","eventEmitter/EventEmitter","animationSequencer/PlayerMonitor"],function(g){var h=g("eventEmitter/EventEmitter");
var f=g("animationSequencer/PlayerMonitor");function j(a,c,b){b=b||{};this._player=a;
this._monitor=new f(this._player,b);this._monitor.on("ready",this._initPauses.bind(this,c));
this._previousPauseIndex=0;this._player.addEventListener("play",this._exitPause.bind(this),false)
}var i=j.prototype=new h();i._initPauses=function(a){this._pauses=this._processPauses(a);
this._attachPauses(this._pauses)};i._processPauses=function(b){var a=b.length;b=b.filter(function(c){return(0<c)&&(c<this._player.duration)
}.bind(this));b=b.sort(function(c,d){return c-d});if(b[0]!==0){b.unshift(0)}if(b[a-1]!==this._player.duration){b[a]=this._player.duration
}return b};i._attachPauses=function(a){a.forEach(function(b){this._monitor.addTime(b,this._enterPause.bind(this))
}.bind(this))};i._enterPause=function(a){var c=a.requested;var d=this._previousPauseIndex;
var b=this._pauses.indexOf(c);if(d===b){return}this._atPausePoint=true;this._player.pause();
this._player.currentTime=c;this.trigger("pauseenter",{from:d,to:b});this._previousPauseIndex=b
};i._exitPause=function(){var b=this._player.currentTime;var c=this._forwards();
var a=c&&b===this._player.duration;var d=!c&&b===0;if(this._atPausePoint&&!(a||d)){this._atPausePoint=false;
this.trigger("pauseexit",{from:this._previousPauseIndex,to:this._calcNextPauseIndex()})
}};i._forwards=function(){return this._player.playbackRate>0};i._calcNextPauseIndex=function(){var b=this._previousPauseIndex;
var a=this._forwards();return b+((a)?1:-1)};return j});AC.define("overview/shared/story/builder",["require","defer/Deferred","overview/shared/story/Story","overview/shared/story/observer/Scene","overview/shared/story/observer/Beginning","overview/shared/story/observer/End","overview/shared/story/observer/Nav","overview/shared/story/observer/Analytics","overview/shared/story/controller/Nav","overview/shared/story/controller/ScrollToContinue","overview/shared/scene/helper/footer","overview/shared/scene/factory","animationSequencer/controllers/Pause"],function(G){var P=G("defer/Deferred");
var L=G("overview/shared/story/Story");var E=G("overview/shared/story/observer/Scene");
var M=G("overview/shared/story/observer/Beginning");var x=G("overview/shared/story/observer/End");
var O=G("overview/shared/story/observer/Nav");var D=G("overview/shared/story/observer/Analytics");
var A=G("overview/shared/story/controller/Nav");var N=G("overview/shared/story/controller/ScrollToContinue");
var F=G("overview/shared/scene/helper/footer");var B=G("overview/shared/scene/factory");
var z=G("animationSequencer/controllers/Pause");var K;var w;var J;var y;var Q;var C;
var H;var R;return function I(k,d,a,l,i){var g=[];var e="#section-nav li";var c=AC.Element.selectAll(e);
var h=e+".active";var b=(i.experience&&i.experience==="flow"||i.experience==="flow_2x"?{readyEvent:"canplaythrough"}:{readyEvent:"loadedmetadata"});
var m=F();var f;if(K===undefined){K=new z(k.mediaObject(),a,b)}a.forEach(function(o,p){var n=B(k,d,K,o,p,i.sceneIndex);
n._index=p;g.push(n)});f=g.length-1;m.slice(1).forEach(function(o,p){var n=B(null,d,null,null,p+g.length,i.sceneIndex);
n.setTo(o.to);g.push(n)});var j=new L(k,g,i);if(w===undefined){w=new E(k,f);J=new M();
y=new x(a.length,f);Q=new O(c,AC.Element.select(h),"active",f);C=new D(f);H=new A(j,c,e);
H.activate();R=new N(j,i.startScene);R.activate()}else{H.setStory(j);R.setStory(j)
}j.on("didShow",function(n){w.onDidShow(n);C.onDidShow(n)});j.on("willShow",function(n){w.onWillShow(n);
C.onWillShow(n);J.onWillShow(n);y.onWillShow(n);Q.onWillShow(n)});j.pauseController=K;
window.story=j;return j}});AC.define("overview/desktop/bootstrap",["require","ipad/shared/cnamer/cnameURL","ipad/shared/stickyNav/StickyNav","ipad/shared/utils/wheel","ipad/shared/utils/dom","overview/desktop/controller/Input","overview/desktop/experience/builder","overview/desktop/storyboard/intro","overview/desktop/storyboard/story","overview/desktop/experience/intro","overview/desktop/experience/story","overview/shared/story/controller/Media","overview/shared/intro/builder","overview/shared/story/builder"],function(D){window.DEBUG=false;
window.FALLBACK_TIMEOUT=10;var H=D("ipad/shared/cnamer/cnameURL");var G=D("ipad/shared/stickyNav/StickyNav");
var z=window.MEDIA_BASE_PATH||"/105/media/us/ipad-air/2013/0be12b9f-265c-474c-a0cc-d3c4c304c031/overview/desktop/";
z=H(z);D("ipad/shared/utils/wheel");var u=D("ipad/shared/utils/dom");var A=D("overview/desktop/controller/Input");
var t=D("overview/desktop/experience/builder");var C=D("overview/desktop/storyboard/intro");
var y=D("overview/desktop/storyboard/story");var J=D("overview/desktop/experience/intro");
var I=D("overview/desktop/experience/story");var v=D("overview/shared/story/controller/Media");
var x=D("overview/shared/intro/builder");var F=D("overview/shared/story/builder");
var E=t(J,C,z);var s=t(I,y,z);C.mediaElement=E[0];y.mediaElement=s[0];var B=s[1].canEnhance();
var w=s[1].getExperience();if(B){AC.Element.addClassName(document.body,"enhanced");
AC.Element.addClassName(document.documentElement,"overflow-hidden")}AC.onDOMReady(function(){if(B){var k=[];
var f=new v(y.mediaElement,C.mediaElement,w);var g=new A();y.scenes.forEach(function(l){k.push(l.endTime)
});var e=y.mediaElement;var a={experience:w,startScene:1,sceneIndex:{wireless:3,ios:5,smartcover:6,footer:7},enableFallback:false};
function h(){var l=b.currentSceneIndex();b=F(e,y.scenes,k,g,a);if(l>b.numScenes()-1){b.show(b.numScenes()-1)
}else{b._currentSceneIndex=l}}var b=F(e,y.scenes,k,g,a);var j=false;u.bindThrottledCallback("resize",function(){if(b.isLocked()&&j===false){j=true;
b.on("didShow",function(){h();j=false})}else{if(j===false){h()}}});var c=x(C,y);
c._mediaElement.setPosterframeElement(AC.Element.getElementById("intro-posterframe"));
f.on("startstory",function(){window.analyticsIntroStartTime=+new Date();c.hide();
b.show();g.enable();g.on("backward",function(l){b.show(b.currentSceneIndex()-1,l.interactionType)
});g.on("forward",function(l){b.show(b.currentSceneIndex()+1,l.interactionType)
});g.on("beginning",function(l){b.show(0,l.interactionType)});g.on("end",function(l){b.show(b.numScenes()-1,l.interactionType)
});AC.Element.addClassName(document.body,"intro-finished")});f.on("startintro",function(){var l=AC.Element.getElementById("intro-posterframe");
AC.Element.addClassName(l,"transition-in");AC.Element.addVendorPrefixEventListener(l,"transitionEnd",function(){AC.Element.addClassName(document.body,"media-ready");
window.setTimeout(c.play.bind(c),0.4*1000)})});f.on("fallback",function(){g.disable();
AC.Element.removeClassName(document.body,"enhanced");AC.Element.removeClassName(document.documentElement,"overflow-hidden")
})}else{if(!AC.Environment.Feature.touchAvailable()&&!(AC.Environment.Browser.name=="IE"&&AC.Environment.Browser.version<9)){var d={shimElement:document.getElementById("nav-container"),shimProperty:"padding-bottom"};
var i=new G("productheader",d)}}})});