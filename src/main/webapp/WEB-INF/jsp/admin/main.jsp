<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- easyui -->
<link rel="stylesheet" type="text/css" href="static/css/easyui.css">
<link rel="stylesheet" type="text/css" href="static/css/icon.css">
<script type="text/javascript" src="static/js/jquery.easyui.min.js"></script>

<script type="text/javascript" src="static/js/main.js"></script>

<title>首页</title>
</head>
<body>
	<div id="cc" class="easyui-layout" style="width: 1000px; height: 600px; margin: 0 auto;">
		<div data-options="region:'north',split:true" style="height: 80px;">
			<a href="/myweb/api/user/logout" id="logout" class="easyui-linkbutton" plain="true" iconCls="icon-back">退出</a>

		</div>
		<div id="west" data-options="region:'west',title:'导航',split:true" style="width: 200px;">
			<div class="easyui-accordion">
				<div title="系统管理" data-options="selected:true">
					<ul>
						<!--<c:forEach items="${menus}" var="res">
							<c:if test="${startsWith(res.url,'/')}">
								<c:set target="${res}" property="url" value="${substringAfter(res.url,'/')}" />
							</c:if>
								<li><a href="${res.url}">${res.name}</a></li>
						</c:forEach>-->
					</ul>
				</div>
			</div>

		</div>
		<div data-options="region:'center'">
			<div id="tt" class="easyui-tabs" data-options="fit:true,border:true,plain:true"></div>

		</div>
		<div data-options="region:'south',split:true" style="height: 70px;"></div>
	</div>
	</div>
</body>
</html>