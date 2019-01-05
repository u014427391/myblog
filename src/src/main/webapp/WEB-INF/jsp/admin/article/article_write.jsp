<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nicky's blog 写文章</title>
<link rel="icon" type="image/png" href="static/images/logo/logo.png">
<link href="<%=basePath %>plugins/editormd/css/editormd.min.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath %>static/css/bootstrap.min.css" 
	rel="stylesheet" type="text/css"  />
<style type="text/css">
	#articleTitle{
		width: 68%;
		margin-top:15px;
	}
	#articleCategory{
		margin-top:15px;
		width:10%;
	}
	#btnList {
		position:relative;
		float:right;
		margin-top:15px;
		padding-right:70px;					
	}
	
</style>
</head>
<body>
	<div id="layout">
		<header>
			文章标题：<input type="text" id="articleTitle" />
			类别：
			<select id="articleCategory" onchange="javascript:categorySelect.init();"></select>
			<span id="btnList">
				<button type="button" id="publishArticle" class="btn btn-info">发布文章</button>
			</span>
		</header>
		<div id="test-editormd">
			<textarea style="display: none;">[TOC]

#### Disabled options

- TeX (Based on KaTeX);
- Emoji;
- Task lists;
- HTML tags decode;
- Flowchart and Sequence Diagram;

#### Editor.md directory

    editor.md/
            lib/
            css/
            scss/
            tests/
            fonts/
            images/
            plugins/
            examples/
            languages/     
            editormd.js
            ...

```html
&lt;!-- English --&gt;
&lt;script src="../dist/js/languages/en.js"&gt;&lt;/script&gt;

&lt;!-- 繁體中文 --&gt;
&lt;script src="../dist/js/languages/zh-tw.js"&gt;&lt;/script&gt;
```
</textarea>
</div>
<script type="text/javascript"
	src="<%=basePath %>static/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="<%=basePath %>plugins/editormd/editormd.min.js"></script>
<script type="text/javascript">
	var testEditor;
	
	$(function() {
	    testEditor = editormd("test-editormd", {
	        width   : "90%",
	        height  : 640,
	        syncScrolling : "single",
	        path    : "<%=basePath %>plugins/editormd/lib/"
	    });
	    categorySelect.init();
	});
	
	var categorySelect = {
		init: function () {
			$.ajax({
                //type: "GET",
                url: 'articleSort/listArticleCategory.do',
                //dataType:'json',
                cache: false,
                success: function(data){
                	debugger;
                	var data = eval(data);
                    $("#articleCategory").append(data);
                }
            });
		}
	}
	
</script>
</body>
</html>