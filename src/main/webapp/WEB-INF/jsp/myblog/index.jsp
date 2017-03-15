<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nicky's blog</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="static/css/base.css" rel="stylesheet">
<link href="static/css/index.css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/sliders.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<!-- 返回顶部调用 begin -->
<script type="text/javascript" src="static/js/up/jquery.js"></script>
<script type="text/javascript" src="static/js/up/js.js"></script>
<!-- 返回顶部调用 end-->
</head>
<body>
<header>
  <div class="logo f_l">
     <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="200" height="80" id="honehoneclock" align="middle">
		  <param name="allowScriptAccess" value="always">
		  <param name="movie" value="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_wh.swf">
		  <param name="quality" value="high">
		  <param name="bgcolor" value="#ffffff">
		  <param name="wmode" value="transparent">
		  <embed wmode="transparent" src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_wh.swf" quality="high" bgcolor="#ffffff" width="200" height="80" name="honehoneclock" align="middle" allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
 	  </object>
   </div>
  <nav id="topnav" class="f_r">
    <ul>
      <a href="index.html" target="_blank">首页</a>
      <a href="news.html" target="_blank">关于我</a> 
      <a href="p.html" target="_blank">文章</a> 
      <a href="a.html" target="_blank">在线工具</a> 
      <a href="toLogin.action" target="_blank">进入后台</a>
    </ul>
    <script src="js/nav.js"></script> 
  </nav>
</header>
<article>
  <div class="l_box f_l">
	
    <div class="banner">
      <div id="slide-holder">
        <div id="slide-runner"> 
	      <a href="/" target="_blank"><img id="slide-img-1" src="static/images/a1.jpg"  alt="" /></a> 
	      <a href="/" target="_blank"><img id="slide-img-2" src="static/images/a2.jpg"  alt="" /></a> 
	      <a href="/" target="_blank"><img id="slide-img-3" src="static/images/a3.jpg"  alt="" /></a> 
	      <a href="/" target="_blank"><img id="slide-img-4" src="static/images/a4.jpg"  alt="" /></a> 
          <div id="slide-controls">
            <p id="slide-client" class="text"><strong></strong><span></span></p>
            <p id="slide-desc" class="text"></p>
            <p id="slide-nav"></p>
          </div>
        </div>
      </div>
     
      <script>
	  if(!window.slider) {
		var slider={};
	}
	slider.data= [
    {
        "id":"slide-img-1", // 与slide-runner中的img标签id对应
        "client":"标题1",
        "desc":"这里修改描述 这里修改描述 这里修改描述" //这里修改描述
    },
    {
        "id":"slide-img-2",
        "client":"标题2",
        "desc":"add your description here"
    },
    {
        "id":"slide-img-3",
        "client":"标题3",
        "desc":"add your description here"
    },
    {
        "id":"slide-img-4",
        "client":"标题4",
        "desc":"add your description here"
    } 
	];
	  </script> 
	  
    </div>
    
    <!-- banner代码 结束 -->
    <div class="topnews">
      <h2><span><a href="/" target="_blank">栏目标题</a><a href="/" target="_blank">栏目标题</a><a href="/" target="_blank">栏目标题</a></span><b>文章</b>推荐</h2>
      <div class="blogs">
        <figure><img src="static/images/01.jpg"></figure>
        <ul>
          <h3><a href="/">住在手机里的朋友</a></h3>
          <p>通信时代，无论是初次相见还是老友重逢，交换联系方式，常常是彼此交换名片，然后郑重或是出于礼貌用手机记下对方的电话号码。在快节奏的生活里，我们不知不觉中就成为住在别人手机里的朋友。又因某些意外，变成了别人手机里匆忙的过客，这种快餐式的友谊 ...</p>
          <p class="autor"><span class="lm f_l"><a href="/">个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_r">浏览（<a href="/">459</a>）</span><span class="pingl f_r">评论（<a href="/">30</a>）</span></p>
        </ul>
      </div>
      <div class="blogs">
        <figure><img src="static/images/02.jpg"></figure>
        <ul>
          <h3><a href="/">教你怎样用欠费手机拨打电话</a></h3>
          <p>初次相识的喜悦，让你觉得似乎找到了知音。于是，对于投缘的人，开始了较频繁的交往。渐渐地，初识的喜悦退尽，接下来就是仅仅保持着联系，平淡到偶尔在节假曰发短信互致问候...</p>
          <p class="autor"><span class="lm f_l"><a href="/">个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_r">浏览（<a href="/">459</a>）</span><span class="pingl f_r">评论（<a href="/">30</a>）</span></p>
        </ul>
      </div>
      <div class="blogs">
        <figure><img src="static/images/03.jpg"></figure>
        <ul>
          <h3><a href="/">原来以为，一个人的勇敢是，删掉他的手机号码...</a></h3>
          <p>原来以为，一个人的勇敢是，删掉他的手机号码、QQ号码等等一切，努力和他保持距离。等着有一天，习惯不想念他，习惯他不在身边,习惯时间把他在我记忆里的身影磨蚀干净... </p>
          <p class="autor"><span class="lm f_l"><a href="/">个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_r">浏览（<a href="/">459</a>）</span><span class="pingl f_r">评论（<a href="/">30</a>）</span></p>
        </ul>
      </div>
      <div class="blogs">
        <figure><img src="static/images/04.jpg"></figure>
        <ul>
          <h3><a href="/">手机的16个惊人小秘密，据说99.999%的人都不知</a></h3>
          <p>引导语：知道么，手机有备用电池，手机拨号码12593+电话号码=陷阱……手机具有很多你不知道的小秘密，说出来一定很惊奇！不信的话就来看看吧！...</p>
          <p class="autor"><span class="lm f_l"><a href="/">个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_r">浏览（<a href="/">459</a>）</span><span class="pingl f_r">评论（<a href="/">30</a>）</span></p>
        </ul>
      </div>
      <div class="blogs">
        <figure><img src="static/images/05.jpg"></figure>
        <ul>
          <h3><a href="/">你面对的是生活而不是手机</a></h3>
          <p>每一次与别人吃饭，总会有人会拿出手机。以为他们在打电话或者有紧急的短信，但用余光瞟了一眼之后发现无非就两件事：1、看小说，2、上人人或者QQ...</p>
          <p class="autor"><span class="lm f_l"><a href="/">个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_r">浏览（<a href="/">459</a>）</span><span class="pingl f_r">评论（<a href="/">30</a>）</span></p>
        </ul>
      </div>
      <div class="blogs">
        <figure><img src="static/images/06.jpg"></figure>
        <ul>
          <h3><a href="/">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></h3>
          <p>现在跨界联姻，时尚、汽车以及运动品牌联合手机制造商联合发布手机产品在行业里已经不再新鲜，上周我们给大家报道过著名手表制造商瑞士泰格·豪雅（Tag Heuer） 联合法国的手机制造商Modelabs发布的一款奢华手机的部分谍照，而近日该手机终于被正式发布了...</p>
          <p class="autor"><span class="lm f_l"><a href="/">个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_r">浏览（<a href="/">459</a>）</span><span class="pingl f_r">评论（<a href="/">30</a>）</span></p>
        </ul>
      </div>
      <div class="blogs">
        <figure><img src="static/images/04.jpg"></figure>
        <ul>
          <h3><a href="/">手机的16个惊人小秘密，据说99.999%的人都不知</a></h3>
          <p>引导语：知道么，手机有备用电池，手机拨号码12593+电话号码=陷阱……手机具有很多你不知道的小秘密，说出来一定很惊奇！不信的话就来看看吧！...</p>
          <p class="autor"><span class="lm f_l"><a href="/">个人博客</a></span><span class="dtime f_l">2014-02-19</span><span class="viewnum f_r">浏览（<a href="/">459</a>）</span><span class="pingl f_r">评论（<a href="/">30</a>）</span></p>
        </ul>
      </div>
    </div>
  </div>
  <div class="r_box f_r">
    <div class="tit01">
      <h3>关注我</h3>
      <div class="gzwm">
        <ul>
          <li><a class="xlwb" href="#" target="_blank">新浪微博</a></li>
          <li><a class="txwb" href="#" target="_blank">腾讯微博</a></li>
          <li><a class="rss" href="portal.php?mod=rss" target="_blank">RSS</a></li>
          <li><a class="wx" href="nickypm@foxmail.com">邮箱</a></li>
        </ul>
      </div>
    </div>
    <!--tit01 end-->
    <div class="ad300x100">
    
    </div>
    <div class="moreSelect" id="lp_right_select"> 
      <script>
window.onload = function ()
{
	var oLi = document.getElementById("tab").getElementsByTagName("li");
	var oUl = document.getElementById("ms-main").getElementsByTagName("div");
	
	for(var i = 0; i < oLi.length; i++)
	{
		oLi[i].index = i;
		oLi[i].onmouseover = function ()
		{
			for(var n = 0; n < oLi.length; n++) oLi[n].className="";
			this.className = "cur";
			for(var n = 0; n < oUl.length; n++) oUl[n].style.display = "none";
			oUl[this.index].style.display = "block"
		}	
	}
}
</script>
      <div class="ms-top">
        <ul class="hd" id="tab">
          <li class="cur"><a href="/">点击排行</a></li>
          <li><a href="/">最新文章</a></li>
          <li><a href="/">站长推荐</a></li>
        </ul>
      </div>
      <div class="ms-main" id="ms-main">
        <div style="display: block;" class="bd bd-news" >
          <ul>
            <li><a href="/" target="_blank">住在手机里的朋友</a></li>
            <li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
            <li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a></li>
            <li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></li>
            <li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
            <li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
          </ul>
        </div>
        <div  class="bd bd-news">
          <ul>
            <li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a></li>
            <li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></li>
            <li><a href="/" target="_blank">住在手机里的朋友</a></li>
            <li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
            <li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
            <li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
          </ul>
        </div>
        <div class="bd bd-news">
          <ul>
            <li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></li>
            <li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
            <li><a href="/" target="_blank">住在手机里的朋友</a></li>
            <li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
            <li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
            <li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a></li>
          </ul>
        </div>
      </div>
      <!--ms-main end --> 
    </div>
    <!--切换卡 moreSelect end -->
    
    <div class="cloud">
      <h3>标签云</h3>
      <ul>
      	<c:choose>
      		<c:when test="${not empty articleSorts}">
      		<c:forEach items="${articleSorts }" var="a" varStatus="as">
      			<li>${a.name }</li>
      		</c:forEach>
      		</c:when>
      		<c:otherwise>
      			<li>没有相关数据</li>
      		</c:otherwise>
      	</c:choose>
      </ul>
    </div>
    <div class="tuwen">
      <h3>移动鼠标给小动物喂食^V^</h3>
      <object type="application/x-shockwave-flash" style="outline:none;" 
      data="http://cdn.abowman.com/widgets/turtles/turtle.swf?" width="250" height="210">
	      <param name="movie" value="http://cdn.abowman.com/widgets/turtles/turtle.swf?"></param>
	      <param name="AllowScriptAccess" value="always"></param>
	      <param name="wmode" value="opaque"></param>
	      <param name="scale" value="noscale"/>
	      <param name="salign" value="tl"/>
      </object>
    </div>
    <div class="ad"> 
    	<object type="application/x-shockwave-flash" style="outline:none;" 
    	data="http://cdn.abowman.com/widgets/hamster/hamster.swf?" width="250" height="210">
	    	<param name="movie" value="http://cdn.abowman.com/widgets/hamster/hamster.swf?"></param>
	    	<param name="AllowScriptAccess" value="always"></param>
	    	<param name="wmode" value="opaque"></param>
    	</object>
    </div>
    <div class="links">
      <h3><span>[<a href="/">申请友情链接</a>]</span>友情链接</h3>
      <ul>
      	<c:choose>
      		<c:when test="${not empty links }">
      			<c:forEach items="${links}" var="l" varStatus="ls">
      				<li><a href="${l.linkUrl }" target="_blank">${l.linkName}</a></li>
      			</c:forEach>
      		</c:when>
      		<c:otherwise>
      				<li>没有相关数据</li>
      		</c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
  <!--r_box end --> 
</article>
<footer>
  <p class="ft-copyright">Nicky博客 Design by DanceSmile</p>
  <div id="tbox"> <a id="togbook" href="/"></a> <a id="gotop" href="javascript:void(0)"></a> </div>
</footer>
</body>
</html>