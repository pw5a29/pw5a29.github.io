<?php
 $url = 'http://widget.weibo.com/weiboshow/index.php?language=&width=1200&height=500&fansRow=1&ptype=1&speed=0&skin=5&isTitle=1&noborder=1&isWeibo=1&isFans=0&uid=5483792717&verifier=3565b4b1&dpc=1';
 $lines_array = file($url);
 $lines_string = implode('', $lines_array);

 echo "
 <style type='text/css'>
 <!--
 .weiboShow_developer{
 display: none !important;
 }
 .weiboShow .weiboShow_main_height, .weiboShow .weiboShow_main_allList_focus, .weiboShow .weiboShow_follow {
 background: transparent !important;
 }
 .weiboShow .weiboShow_wrap {
 border:0 !important;
 }
 .weiboShow_main_feed{
 border:0 !important;
 }
 .weiboShow_topborder{
 display: none !important;
 }
 -->
 </style>";

 echo $lines_string;
?>
