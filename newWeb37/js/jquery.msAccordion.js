(function($){
	$.fn.msAccordion = function(options) {
		options = $.extend({
				currentDiv:'1',
				previousDiv:'',
				vertical: false,
				defaultid:0,
				currentcounter:0,
				intervalid:0,
				autodelay:0,
				event:"click",
				alldivs_array:new Array()
		}, options);
		$(this).addClass("accordionWrapper");
		$(this).css({overflow:"hidden"});
		//alert(this);
		var elementid = $(this).attr("id");
		var allDivs = this.children();
		if(options.autodelay>0)  {
			$("#"+ elementid +" > div").bind("mouseenter", function(){
			   pause();
			});
			$("#"+ elementid +" > div").bind("mouseleave", function(){
			  	startPlay();
			});
		}
		//set ids
		allDivs.each(function(current) {
			 var iCurrent = current;
			 var sTitleID = elementid+"_msTitle_"+(iCurrent);
			 var sContentID = sTitleID+"_msContent_"+(iCurrent);
			 var currentDiv = allDivs[iCurrent];
			 var totalChild = currentDiv.childNodes.length;
			 var titleDiv = $(currentDiv).find("div.title");
			 titleDiv.attr("id", sTitleID);
			 var contentDiv = $(currentDiv).find("div.content");
			 contentDiv.attr("id", sContentID);
			 options.alldivs_array.push(sTitleID);
			 //$("#"+sTitleID).click(function(){openMe(sTitleID);});
			 $("#"+sTitleID).bind(options.event, function(){pause();openMe(sTitleID);});
			 });
		
		//make vertical
		if(options.vertical) {makeVertical();};
		//open default
		openMe(elementid+"_msTitle_"+options.defaultid);
		if(options.autodelay>0) {startPlay();};
		//alert(allDivs.length);
		var token,num_bak;
		function openMe(id) {
			var sTitleID = id;
			var iCurrent = sTitleID.split("_")[sTitleID.split("_").length-1];
			var num = parseInt(iCurrent)+1;
			if(token!=null&&num_bak!=null){token.removeClass("info"+num_bak+"-hover");}
			token = $("#"+id).find("a");
			num_bak = num;
			//token.addClass("b-g-info-"+num+"-hover");
			token.addClass("info"+num+"-hover");
			options.currentcounter = iCurrent;
			var sContentID = id+"_msContent_"+iCurrent;
			if($("#"+sContentID).css("display")=="none") {
				if(options.previousDiv!="") {
					closeMe(options.previousDiv);
				};
				if(options.vertical) {
					//$("#"+sContentID).slideDown();
					//$("#"+sContentID).slideRight("slow");
					$("#"+sContentID).slideDown();
				} else {
					$("#"+sContentID).show("1500");//"fast"
				}
				options.currentDiv = sContentID;
				options.previousDiv = options.currentDiv;
			};
		};
		function closeMe(div) {
			if(options.vertical) {
				//$("#"+div).slideUp();
				//$("#"+div).slideRight("slow");
				$("#"+div).slideUp("1500");
			} else {
				//$("#"+div).hide();
				$("#"+div).hide("fast");
			};
		};	
		function makeVertical() {
			$("#"+elementid +" > div").css({display:"block", float:"none", clear:"both"});
			$("#"+elementid +" > div > div.title").css({display:"block", float:"none", clear:"both"});
			$("#"+elementid +" > div > div.content").css({clear:"both"});
		};
		function startPlay() {
			options.intervalid = window.setInterval(play, options.autodelay*1000);
		};
		function play() {
			var sTitleId = options.alldivs_array[options.currentcounter];
			openMe(sTitleId);
			options.currentcounter++;
			if(options.currentcounter==options.alldivs_array.length) options.currentcounter = 0;
		};
		function pause() {
			window.clearInterval(options.intervalid);
		};
	}
})(jQuery);