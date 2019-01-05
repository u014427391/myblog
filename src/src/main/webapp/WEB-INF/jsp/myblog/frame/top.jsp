<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="UTF-8">
	function doSearch(){
		var keyword = $(".text").val();
		window.location.href="search.do?keyword="+keyword;
	}
</script>
<header>
   <div class="site-search">
       <div id="search">
           <input type="text" name="s" class="text" placeholder="输入关键字搜索" />
           <button type="button" onclick="javascript:doSearch();" class="submit">搜索</button>
       </div>
   </div>
  <h1>
  <a href="toblog.do">Nicky's blog</a>
  </h1>
  <p>
  	这夏天里流动的风情，是停不住的舞步和唱不完的情歌，当玫瑰花瓣飘飞的那一刻，风会带走所有的想念.......
  </p>
</header>
<div id="nav">
     <ul>
       <li><a href="toblog.do">网站首页</a></li>
       <li><a href="javascript:aboutMeTip();">关于我</a></li>
       <li><a href="javascript:sysTip();">在线论坛</a></li>
       <li><a href="javascript:sysTip ();">技术探讨</a></li>
       <li><a href="javascript:sysTip();">在线工具</a></li>
       <li><a href="javascript:sysTip();">我的相册</a></li>
       <li><a href="javascript:sysTip();">留言版</a></li>
     </ul>
     <script src="static/blog/js/silder.js"></script><!--获取当前页导航 高亮显示标题-->
</div>
<style type="text/css">
.site-search{
	width:25%;
	float:right;
	width:250px;
	height:50px;
}
#search{
	position:relative;
	margin-top:15px;
}
#search input{
	padding-right:30px;
}
#search button{
	position:absolute;
	right:4px;
	top:2px;
	border:none;
	padding:0;
	width:24px;
	height:24px;
	background:url("static/images/search.png") no-repeat scroll right center transparent; 
	direction:ltr;
	text-indent:-9999em;
}
.sr-only{
	border:0;
	height:1px;
	margin:-1px;
	overflow:hidden;
	padding:0;
	position:absolute;
	width:1px;
}
.sr-only.focusable:active,.sr-only.focusable:focus{
	clip:auto;
	height:auto;
	margin:0;
	overflow:visible;
	position:static;
	width:auto;
}
input[type="text"]{
	padding:5px;
	border:1px solid #E9E9E9;
	width:100%;
	border-radius:2px;
	-webkit-box-sizing:border-box;
	-moz-box-sizing:border-box;
	box-sizing:border-box;
}
</style>
<script type="text/javascript">
	function aboutMeTip(){
		alert('我的邮箱:nickypm@foxmail.com');
	}
	
	function sysTip(){
		alert('功能待开发!');		
	}
</script>