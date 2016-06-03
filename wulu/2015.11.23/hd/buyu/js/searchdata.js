function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return "";
}
var bkey=getQueryString("key");
var burl= window.location.href;
$.ajax({
	async:false,
	url:"http://union.789game.com/api/getBroserSummary.html",
	type: "GET",
	dataType: 'jsonp',
	jsonp: 'jsoncallback',
	data : {"key" : bkey,"url":burl},
	success : function(json) {

	},
	error : function() {}
});

		$("#down").click(function(){
			$.ajax({
				async:false,
				url:"http://union.789game.com/api/getDownSummary.html",
				type: "GET",
				dataType: 'jsonp',
				jsonp: 'jsoncallback',
				data : {"key" : bkey,"downurl":defaultDown},
				success : function(json) {

				},
				error : function() {}
			});		
		});
		$(".userRegSucDown").click(function(){
			$.ajax({
				async:false,
				url:"http://union.789game.com/api/getDownSummary.html",
				type: "GET",
				dataType: 'jsonp',
				jsonp: 'jsoncallback',
				data : {"key" : bkey,"downurl":defaultDown},
				success : function(json) {

				},
				error : function() {}
			});		
		});
		$(".downGame").click(function(){
			$.ajax({
				async:false,
				url:"http://union.789game.com/api/getDownSummary.html",
				type: "GET",
				dataType: 'jsonp',
				jsonp: 'jsoncallback',
				data : {"key" : bkey,"downurl":defaultDown},
				success : function(json) {

				},
				error : function() {}
			});		
		});		