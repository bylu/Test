// JavaScript Document
// JavaScript Document/**
 /* User: wei ya
 * Date: 14-6-12
 * Time: 下午8:08
 * 小型婚礼
 */
$(function(){
    var  $firstTxt = $(".first-txt"), /* 场景一文字div */
        $sevenBox = $(".seven-box");
		
    /* 场景一 */
    $firstTxt.animate({left: "435px"},function(){
       setTimeout(scene7,0); /* 进入场景二 */
    });
    /* 场景七 */
    var $sevenDiv = $(".seven-content div"),
        /* 填写愿望 */
		$popBox = $("#myheart"),
        $write = $("#goodsName"),
		$leaveMessage=$("#leaveMessage"),
        $uSure = $("#uSure"),
        $sevenContent = $(".seven-content");

    function scene7(){
        $sevenBox.fadeIn(1000);
        $sevenDiv.each(function(){
            defineSevenDiv($(this));
        })

        function defineSevenDiv($own){
            var _obj = defineRandom();
            $own.css({"transform":"rotate("+_obj.rotate+"deg)"}); /* 设置随机旋转值 */
            $own.animate({left: _obj.left+"px",top: _obj.top+"px"}); /* 随机排布 */
        }

        /* 定义随机left，top和旋转值 */
        function defineRandom(){
            var randomLeft = Math.floor(680*(Math.random())) + 30, /* 图片left值 */
                randomTop =  Math.floor(400*Math.random()) + 30, /* 图片top值 */
                randomRotate = 20 - Math.floor(40*Math.random()); /* 图片旋转角度 */
            return {
                left: randomLeft,
                top: randomTop,
                rotate:randomRotate
            }
        }

        /* 拖动祝福卡片 */
        draggableNote();
        /* 拖动图片 */
        function draggableNote(){
            $(".seven-content div").draggable({
                containment: $sevenContent,
                zIndex: 2700,
                start: function(){
                    $(this).css({"transform":"rotate(0deg)","cursor": "crosshair"}); /* 开始拖动图片旋转为0，鼠标样式改变 */
                },
                stop: function(){
                    var _obj = defineRandom();
                    $(this).css({"transform":"rotate("+_obj.rotate+"deg)","cursor": "pointer"}); /* 停止拖动，旋转为随机的 */
                }
            })
        }

       
        /* 丢失焦点时 */
        $write.blur(function(){
            if($write.val()==""){
				$("#goodsNameError").html("请输入商品的名称");
			}
        })

        /* 点击确定 */
        $uSure.click(function(){
            var _writeVal = $write.val();
            var _randomNum = Math.ceil(Math.random()*6);
            if(_writeVal!= "" || _writeVal.length >15){
				$.ajax({
					async:false,
					url: 'http://api.789game.com/api/apiwish/insert_wish_note.html',
					type: "GET",
					dataType: 'jsonp',
					jsonp: 'jsoncallback',
					data:{'wishnote':$write.val()},
					success: function (json) {
						if(json==0){
							_writeVal=_writeVal.substring(0,15)+"......";
							var _div = '<div class="note-'+_randomNum+'">'+_writeVal+'</div>';
							$sevenContent.append(_div); /* 如果输入心愿奖品语，将此标签添加的尾部 */
							defineSevenDiv($sevenContent.find("div:last"));
							$popBox.animate({top: "-300px"},function(){
							draggableNote(); /* 可拖动卡片，给新添加的标签赋予拖动功能 */
							});
							$.dialog.get['b'].hide();
						}else{
							$.dialog.get['b'].hide();
							alert(json);
						}
					},
					error: function(xhr){
					alert("请求出错,请检查相关度网络状况");
					}
				});	
            }else{
               $("#goodsNameError").html("请输入商品的名称");
            }
        })
    }
})
