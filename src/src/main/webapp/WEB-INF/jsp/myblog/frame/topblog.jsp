<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="topblog">
      <h3>
      	<p>推荐文章 New Blog</p>
      </h3>
     <img src="static/blog/images/03.jpg" alt="" title="" width="315" height="205">
      <ul>
      <c:choose>
		<c:when test="${not empty supportArticles}">
			<c:forEach items="${supportArticles }" var="s">
				<li><a href="article/details.do?articleId=${s.articleId}">${s.articleName}<span>${s.articleName}</span></a></li>
			</c:forEach>			
		</c:when>
		<c:otherwise>
			<li>没有相关数据</li>
		</c:otherwise>
      </c:choose>
      </ul>
 </div> 