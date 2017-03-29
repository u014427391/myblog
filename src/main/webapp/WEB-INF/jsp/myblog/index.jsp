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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nicky's blog</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="static/css/base.css" rel="stylesheet">
<link href="static/css/index.css" rel="stylesheet">
<link href="static/css/pageBase.css" rel="stylesheet">
<link href="static/css/pageGroup.css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="static/js/sliders.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<!-- 返回顶部调用 begin -->
<script type="text/javascript" src="static/js/up/jquery.js"></script>
<script type="text/javascript" src="static/js/up/js.js"></script>
<!-- 返回顶部调用 end-->
<script type="text/javascript">
	
</script>
<script type="text/javascript">
$(function(){
	//根据总页数判断，如果小于5页，则显示所有页数，如果大于5页，则显示5页。根据当前点击的页数生成
	var totalPageGet = ${totalPage};
	var totalPage = Number(totalPageGet);
	var pageSizeGet = ${pageSize};
	var pageSize = Number(pageSizeGet);
	var pageCount = totalPage/pageSize;//模拟后台总页数
	//生成分页按钮
	if(pageCount>5){
		page_icon(1,5,0);
	}else{
		page_icon(1,pageCount,0);
	}
	
	//点击分页按钮触发
	$("#pageGro li").live("click",function(){
		if(pageCount > 5){
			var pageNum = parseInt($(this).html());//获取当前页数
			pageGroup(pageNum,pageCount);
		}else{
			$(this).addClass("on");
			$(this).siblings("li").removeClass("on");
		}
	});
	
	//点击上一页触发
	$("#pageGro .pageUp").click(function(){
		if(pageCount > 5){
			var pageNum = parseInt($("#pageGro li.on").html());//获取当前页
			pageUp(pageNum,pageCount);
		}else{
			var index = $("#pageGro ul li.on").index();//获取当前页
			if(index > 0){
				$("#pageGro li").removeClass("on");//清除所有选中
				$("#pageGro ul li").eq(index-1).addClass("on");//选中上一页
			}
		}
	});
	
	//点击下一页触发
	$("#pageGro .pageDown").click(function(){
		if(pageCount > 5){
			var pageNum = parseInt($("#pageGro li.on").html());//获取当前页
			pageDown(pageNum,pageCount);
		}else{
			var index = $("#pageGro ul li.on").index();//获取当前页
			if(index+1 < pageCount){
				$("#pageGro li").removeClass("on");//清除所有选中
				$("#pageGro ul li").eq(index+1).addClass("on");//选中上一页
			}
		}
	});
});
//点击跳转页面
function pageGroup(pageNum,pageCount){
	switch(pageNum){
		case 1:
			page_icon(1,5,0);
		break;
		case 2:
			page_icon(1,5,1);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,3);
		break;
		case pageCount:
			page_icon(pageCount-4,pageCount,4);
		break;
		default:
			page_icon(pageNum-2,pageNum+2,2);
		break;
	}
}
//根据当前选中页生成页面点击按钮
function page_icon(page,count,eq){
	var html = "";
    for(var i = 0;i<=count;i++){
  	    var url = "<li><a href=\"<%=loadBlogUrl%>"+(i+1)+"\">"+(i+1)+"</a></li>";
    	html += url;
    }
    $("#pageGro ul").html(html);
    $("#pageGro ul li").eq(eq).addClass("on");
}
//上一页
function pageUp(pageNum,pageCount){
	switch(pageNum){
		case 1:
		break;
		case 2:
			page_icon(1,5,0);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,2);
		break;
		case pageCount:
			page_icon(pageCount-4,pageCount,3);
		break;
		default:
			page_icon(pageNum-2,pageNum+2,1);
		break;
	}
}
//下一页
function pageDown(pageNum,pageCount){
	switch(pageNum){
		case 1:
			page_icon(1,5,1);
		break;
		case 2:
			page_icon(1,5,2);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,4);
		break;
		case pageCount:
		break;
		default:
			page_icon(pageNum-2,pageNum+2,3);
		break;
	}
}
</script>
<script type="text/javascript">
	function tip(){
		alert('博主不看微博哟!');
	}
	function tipEmail(){
		alert('博主邮箱为nickypm@foxmail.com');
	}
	function tipRSS(){
		alert('预定功能开发中...');
	}
</script>
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
      <a href="toblog.do">首页</a>
      <a href="javascript:tipEmail();">关于我</a> 
      <a href="p.html">文章</a> 
      <a href="a.html">在线工具</a> 
      <a href="login.do" target="_blank">进入后台</a>
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
      <h2><b>文章</b>推荐</h2>

      <c:choose>
      <c:when test="${not empty articles}">
      <c:forEach items="${articles}" var="ar" varStatus="art">
      <div class="blogs">
        <figure><img src="${basePath }${ar.imgPath}"></figure>
        <ul>
          <h3><a href="/">${ar.articleName }</a></h3>
          <p>${ar.articleContent}</p>
          <p class="autor">
          <span class="lm f_l"><a href="/">个人博客</a></span>
          <span class="dtime f_l">${ar.articleTime}</span>
          <span class="viewnum f_r">浏览（<a href="/">${ar.articleClick }</a>）</span>
          <span class="pingl f_r">评论（<a href="/">30</a>）</span>
          </p>
        </ul>
      </div>
      </c:forEach>
      </c:when>
      <c:otherwise>
      	<li>没有相关数据</li>
      </c:otherwise>
      </c:choose>
     
	<div id="pageGro" class="cb">
	<div class="pageUp">上一页</div>
    <div class="pageList">
        <ul id="link">
        </ul>
    </div>
    <div class="pageDown">下一页</div>
	</div>
	  
     
     </div>
    
  </div>
  <div class="r_box f_r">
    <div class="tit01">
      <h3>关注我</h3>
      <div class="gzwm">
        <ul>
          <li><a class="xlwb" href="javascript:tip();" target="_blank">新浪微博</a></li>
          <li><a class="txwb" href="javascript:tip();" target="_blank">腾讯微博</a></li>
          <li><a class="rss" href="javascript:tipRSS();" target="_blank">RSS</a></li>
          <li><a class="wx" href="javascript:tipEmail();">邮箱</a></li>
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
					oUl[this.index].style.display = "block";
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
          	<c:choose>
          		<c:when test="${not empty articles1}">
          			<c:forEach items="${articles1 }" var="acn" varStatus="artcn">
          			<li><a href="http://www.baidu.com" target="_blank">${acn.articleName}</a></li>
          			</c:forEach>
          		</c:when>
          		<c:otherwise>
          			<li>没有相关数据</li>
          		</c:otherwise>
          	</c:choose>
          </ul>
        </div>
        <div  class="bd bd-news">
          <ul>
            <c:choose>
          		<c:when test="${not empty articles2}">
          			<c:forEach items="${articles2 }" var="acn" varStatus="artcn">
          			<li><a href="http://www.baidu.com" target="_blank">${acn.articleName}</a></li>
          			</c:forEach>
          		</c:when>
          		<c:otherwise>
          			<li>没有相关数据</li>
          		</c:otherwise>
          	</c:choose>
          </ul>
        </div>
        <div class="bd bd-news">
          <ul>
            <c:choose>
          		<c:when test="${not empty articles3}">
          			<c:forEach items="${articles3 }" var="acn" varStatus="artcn">
          			<li><a href="http://www.baidu.com" target="_blank">${acn.articleName}</a></li>
          			</c:forEach>
          		</c:when>
          		<c:otherwise>
          			<li>没有相关数据</li>
          		</c:otherwise>
          	</c:choose>
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
      <h3>移动鼠标给小动物喂食</h3>
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
  <p class="ft-copyright">Nicky's blog Design by DanceSmile</p>
  <div id="tbox"> <a id="togbook" href="/"></a> <a id="gotop" href="javascript:void(0)"></a> </div>
</footer>
</body>
</html>