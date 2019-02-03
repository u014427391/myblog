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
.search-input{ 
padding-right:20px; 
background:url("plugins/easyui-1.3.4/themes/icons/search.png") no-repeat scroll right center transparent; 
}
</style>
<link href="static/blog/css/blog.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Arizonia' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="static/js/jquery-1.8.3.js"></script>
</head> 
<body>
<%@ include file="../frame/top.jsp" %>
<div class="blank"></div>
<div class="article">
  <div class="content">
    
    <div class="bloglist">
  <!--article begin-->
      <c:choose>
      <c:when test="${not empty articles}">
      <c:forEach items="${articles}" var="ar" varStatus="art">
		<ul>
	    <h2>
	    <a title="${ar.articleName }" href="article/details.do?articleId=${ar.articleId}"  target="_blank">
	    ${ar.articleName }
	   	</a></h2>
	   	<p>${ar.articleContent }</p>
	    <p >
		    <span>${ar.articleTime }</span>
		    <span>作者：Nicky</span>
		    <span>分类：<a href="/" target="_blank">笔记</a></span>
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

</div>
<%@ include file="../frame/footer.jsp" %>
</body>
</html>