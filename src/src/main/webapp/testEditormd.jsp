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
<title>Insert title here</title>
<link href="<%=basePath %>/plugins/editormd/css/editormd.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=basePath %>/static/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="<%=basePath %>/plugins/editormd/editormd.min.js"></script>
</head>
<body>
	<div id="layout">
		<header>
		<h1>Simple example</h1>
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
<script type="text/javascript">
	var testEditor;
	
	$(function() {
	    testEditor = editormd("test-editormd", {
	        width   : "90%",
	        height  : 640,
	        syncScrolling : "single",
	        path    : "<%=basePath %>/plugins/editormd/lib/"
	    });
	    
	    /*
	    // or
	    testEditor = editormd({
	        id      : "test-editormd",
	        width   : "90%",
	        height  : 640,
	        path    : "../lib/"
	    });
	    */
	});
</script>
</body>
</html>