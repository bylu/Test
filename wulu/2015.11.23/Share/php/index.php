<?php
require_once "jssdk.php";
$jssdk = new JSSDK("wxc53d3b7d5b821be3", "0ca339042783da6f32c9b53f1390099c");
$signPackage = $jssdk->GetSignPackage();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>afasfxxxxxx</title>
  <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
  wx.config({
    debug: false,
    appId: '<?php echo $signPackage["appId"];?>',
    timestamp: <?php echo $signPackage["timestamp"];?>,
    nonceStr: '<?php echo $signPackage["nonceStr"];?>',
    signature: '<?php echo $signPackage["signature"];?>',
    jsApiList: [
					'checkJsApi',
                    'onMenuShareTimeline',
                    'onMenuShareAppMessage',
                    'onMenuShareQQ',
                    'onMenuShareWeibo',
                    'hideMenuItems',
                    'showMenuItems',
                    'hideAllNonBaseMenuItem',
                    'showAllNonBaseMenuItem',
    ]
  });
 
wx.ready(function (){
wx.config({
    debug: false,
    appId: '<?php echo $signPackage["appId"];?>',
    timestamp: <?php echo $signPackage["timestamp"];?>,
    nonceStr: '<?php echo $signPackage["nonceStr"];?>',
    signature: '<?php echo $signPackage["signature"];?>',
    jsApiList: [
					'checkJsApi',
                    'onMenuShareTimeline',
                    'onMenuShareAppMessage',
                    'onMenuShareQQ',
                    'onMenuShareWeibo',
                    'hideMenuItems',
                    'showMenuItems',
                    'hideAllNonBaseMenuItem',
                    'showAllNonBaseMenuItem',
    ]
  });
});


   // 分享给朋友
            wx.onMenuShareAppMessage({
                title: '企划部设计',
                desc: 'aaaaa',
                link: 'http://binsee.github.io/wechat-php-sdk/',
                imgUrl: 'http://binsee.github.io/wechat-php-sdk/img/author.jpg',
                trigger: function (res) {
                    alert("点击分享：" +JSON.stringify(res));
                },
                success: function (res) {
                    alert("分享成功：" +JSON.stringify(res));
                },
                cancel: function (res) {
                    alert("取消分享：" +JSON.stringify(res));
                },
                fail:function (res) {
                    alert("分享失败：" +JSON.stringify(res));
                }
            });
 
            // 分享到朋友圈
            wx.onMenuShareTimeline({
                title: '企划部设计',
                desc: 'bbbbbb',
                link: 'http://binsee.github.io/wechat-php-sdk/',
                imgUrl: 'http://binsee.github.io/wechat-php-sdk/img/author.jpg',
                trigger: function (res) {
                    alert("点击分享：" +JSON.stringify(res));
                },
                success: function (res) {
                    alert("分享成功：" +JSON.stringify(res));
                },
                cancel: function (res) {
                    alert("取消分享：" +JSON.stringify(res));
                },
                fail:function (res) {
                    alert("分享失败：" +JSON.stringify(res));
                }
            });
</script>
</head>
<body>
  asfasdfasfasdfaaa
</body>

</html>
