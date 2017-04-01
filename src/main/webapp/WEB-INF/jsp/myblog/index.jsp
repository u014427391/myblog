<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String loadBlogUrl = basePath + "toblog.do?pageNo=";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<title>Nicky's blog</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="" >
<meta name="Description" content="" >
<meta name="keywords" content="" />
<meta name="description" content="" />
<style type="text/css">
.search-input{ 
padding-right:20px; 
background:url("plugins/easyui-1.3.4/themes/icons/search.png") no-repeat scroll right center transparent; 
}
</style>
<link href="static/blog/css/blog.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Arizonia' rel='stylesheet' type='text/css'>
</head>
<body>
<header>
  <h1><a href="/">Nicky's blog</a></h1>
  <p>这夏天里流动的风情，是停不住的舞步和唱不完的情歌，当玫瑰花瓣飘飞的那一刻，风会带走所有的想念.......</p>
</header>
<div id="nav">
     <ul>
       <li><a href="index.html">网站首页</a></li>
       <li><a href="about.html">关于我</a></li>
       <li><a href="#">在线论坛</a></li>
       <li><a href="#">技术探讨</a></li>
       <li><a href="#">在线工具</a></li>
       <li><a href="#">我的相册</a></li>
       <li><a href="#">留言版</a></li>
     </ul>
     <script src="static/blog/js/silder.js"></script><!--获取当前页导航 高亮显示标题-->
</div>
<div class="blank"></div>
<div class="article">
  <div class="content">
    <div class="topblog">
      <h3>
      	<p>推荐文章 New Blog</p>
      </h3>
     <img src="static/blog/images/03.jpg" alt="" title="" width="315" height="205">
      <ul>
      <c:choose>
		<c:when test="${not empty supportArticles}">
			<c:forEach items="${supportArticles }" var="s">
				<li><a href="/">${s.articleName}<span>${s.articleName}</span></a></li>
			</c:forEach>			
		</c:when>
		<c:otherwise>
			<li>没有相关数据</li>
		</c:otherwise>
      </c:choose>
      </ul>
     </div> 
    <div class="bloglist">
  <!--article begin-->
      <c:choose>
      <c:when test="${not empty articles}">
      <c:forEach items="${articles}" var="ar" varStatus="art">
		<ul>
	    <h2>
	    <a title="${ar.articleName }" href="/"  target="_blank">
	    ${ar.articleName }
	   	</a></h2>
	   	<p>${ar.articleContent }</p>
	    <p >
		    <span>${ar.articleTime }</span>
		    <span>作者：</span>
		    <span>分类：<a href="/" target="_blank">心得笔记</a></span>
		    <span>阅读(${ar.articleClick })</span>
		    <span>评论(124)</span>
	    </p>
	    </ul>
      </c:forEach>
      </c:when>
      <c:otherwise>
      	<li>没有相关数据</li>
      </c:otherwise>
      </c:choose>
  <!--article end-->
    </div> 
  </div>
<aside class="navsidebar">
   <nav>
      <ul>
       <li class="ab"><a href="#" >关于我</a></li>
       <li class="lt"><a href="#">在线论坛</a></li>
       <li class="js"><a href="#">技术探讨</a></li>
       <li class="zt"><a href="#">在线工具</a></li>
       <li class="xc"><a href="#">我的相册</a></li>
       <li class="ly"><a href="#">留言版</a></li>
     </ul>      
    </nav>
    <div class="slide">
    <!-- 代码 开始 -->
<script language='javascript'> 
linkarr = new Array();
picarr = new Array();
textarr = new Array();
var swf_width=276;
var swf_height=200;
//文字颜色|文字位置|文字背景颜色|文字背景透明度|按键文字颜色|按键默认颜色|按键当前颜色|自动播放时间|图片过渡效果|是否显示按钮|打开方式
var configtg='0xffffff|0|0x3FA61F|5|0xffffff|0xC5DDBC|0x000033|2|3|1|_blank';
var files = "";
var links = "";
var texts = "";
//这里设置调用标记
linkarr[1] = "http://www.yangqq.com";
picarr[1]  = "static/blog/images/01.jpg";
textarr[1] = "Goodbye Summer 个人相册";
linkarr[2] = "http://www.yangqq.com";
picarr[2]  = "static/blog/images/02.jpg";
textarr[2] = " Goodbye Summer 个人相册";
linkarr[3] = "http://www.yangqq.com";
picarr[3]  = "static/blog/images/03.jpg";
textarr[3] = "Goodbye Summer 个人相册";
linkarr[4] = "http://www.yangqq.com";
picarr[4]  = "static/blog/images/04.jpg";
textarr[4] = " Goodbye Summer 个人相册";
linkarr[5] = "http://www.yangqq.com";
picarr[5]  = "static/blog/images/02.jpg";
textarr[5] = " Goodbye Summer 个人相册";
 
for(i=1;i<picarr.length;i++){
if(files=="") files = picarr[i];
else files += "|"+picarr[i];
}
for(i=1;i<linkarr.length;i++){
if(links=="") links = linkarr[i];
else links += "|"+linkarr[i];
}
for(i=1;i<textarr.length;i++){
if(texts=="") texts = textarr[i];
else texts += "|"+textarr[i];
}
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="static/blog/images/bcastr3.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
document.write('<embed src="static/blog/images/bcastr3.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>'); 
</script>
<!-- 代码 结束 -->
 </div>
 <h2><p>个人档案</p></h2>
   <div class="vcard">
      <p class="fn">姓名：Nicky</p>
      <p class="url">主页：<a href="http://blog.csdn.net/u014427391" target="_blank">技术博客</a></p>
      <p class="skill">技能：WebService,J2EE框架,Android</p>
      <p class="role">职业：JavaEE程序员</p>
    </div>   
 <h2><p>文章标签</p></h2>
<ul class="news">
<c:choose>
    <c:when test="${not empty articleSorts}">
      <c:forEach items="${articleSorts }" var="a" varStatus="as">
      	<li><a href="#" target="_blank">${a.name }</a></li>
      </c:forEach>
    </c:when>
    <c:otherwise>
      	<li>没有相关数据</li>
    </c:otherwise>
</c:choose>
</ul>
<h2><p>近期文章</p></h2>
&nbsp;&nbsp;<input type="text" class="search-input" placeholder="基于Lucene的搜索..." />
<br>
<ul class="news">
  <c:choose>
      <c:when test="${not empty tArticles}">
         <c:forEach items="${tArticles }" var="acn" varStatus="artcn">
          <li><a href="#" target="_blank">${acn.articleName}</a></li>
         </c:forEach>
      </c:when>
      <c:otherwise>
          <li>没有相关数据</li>
      </c:otherwise>
  </c:choose>
</ul>
<h2><p>文章归档</p></h2>
<ul class="news">
  <li><a href="/">2008 年三月</a></li>
  <li><a href="/">2008 年四月</a></li>
  <li><a href="/">2008 年六月</a></li>
</ul>
<h2><p>友情链接</p></h2>
<ul class="news">
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
<div class="share">
    <h2></h2>
      <p><!-- Baidu Button BEGIN -->
<div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare">
<a class="bds_tsina"></a>
<a class="bds_qzone"></a>
<a class="bds_tqq"></a>
<a class="bds_renren"></a>
<span class="bds_more"></span>
<a class="shareCount"></a>
</div>
<script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
</script>
<!-- Baidu Button END --></p>
    </div>
</aside>
</div>
<div id="copright">Copyright@ Nicky's blog</a></div>
</body>
</html>
