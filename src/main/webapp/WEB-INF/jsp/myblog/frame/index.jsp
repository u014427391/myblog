<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String loadBlogUrl = basePath + "toblog.do?pageNo=";
%>

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
<link href="static/blog/css/blog.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Arizonia' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="static/js/jquery-1.8.3.js"></script>
</head> 
<body>
<%@ include file="top.jsp" %>
<div class="blank"></div>
<div class="article">
  <div class="content">
    <%@ include file="topblog.jsp" %>
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
<%@ include file="navsidebar.jsp" %>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>