<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			文章标题：<input type="text" id="articleTitle" value="title" />
			类别：
			<select id="articleCategory"></select>
			<span id="btnList">
				<button type="button" id="publishArticle" onclick="writeArticle.doSubmit();" class="btn btn-info">发布文章</button>
			</span>
		</header>
		<div id="test-editormd">
			<textarea id="articleContent" style="display: none;">[TOC]

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

	/* 文章类别下拉框数据绑定 */
	var categorySelect = {
		init: function () {//初始化数据
			$.ajax({
                type: "GET",
                url: 'articleSort/listArticleCategory.do',
                dataType:'json',
                contentType:"application/json",
                cache: false,
                success: function(data){
                	//debugger;
                	data = eval(data) ;
                    categorySelect.buildOption(data);
                }
            });
		},
		buildOption: function (data) {//构建下拉框数据
            //debugger;
            var optionStr ="";
            for(var i=0 ; i < data.length; i ++) {
                optionStr += "<option value="+data[i].typeId+">";
                optionStr += data[i].name;
                optionStr +="</option>";
            }
            $("#articleCategory").append(optionStr);
        }
	}

	/* 发送文章*/
	var writeArticle = {
	    doSubmit: function () {//提交
	        if (writeArticle.doCheck()) {
	            debugger;
                var title = $("#articleTitle").val();
                var content = $("#articleContent").val();
                var typeId = $("#articleCategory").val();
                $.ajax({
                    type: "POST",
                    url: '<%=basePath %>article/saveOrUpdateArticle.do',
					data: {'title':title,'content':content,'typeId':typeId},
                    dataType:'json',
                    //contentType:"application/json",
                    cache: false,
                    success: function(data){
                        debugger;
						if ("success"== data.success) {
						   alert("保存成功!");
						   window.local.close();
						}
                    }
                });
			}
        },
		doCheck: function() {//校验
            //debugger;
			var title = $("#articleTitle").val();
			var content = $("#articleContent").val();
			if (typeof(title) == undefined || title == null || title == "" ) {
                alert("请填写文章标题!");
			    return false;
			}

			if(typeof (content) == undefined || content == null || content == "") {
                alert("请填写文章内容!");
                return false;
			}

			return true;
        }
	}
	
</script>
</body>
</html>