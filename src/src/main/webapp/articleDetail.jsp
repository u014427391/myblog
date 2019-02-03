<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <base href="<%=basePath %>">
    <meta charset="utf-8" />
    <title>HTML Preview(markdown to html) - Editor.md examples</title>
    <link rel="stylesheet" href="<%=basePath %>/plugins/editormd/css/editormd.preview.css" />
    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div id="layout">
    <header>
        <h1>Markdown转HTML的显示处理</h1>
        <p>即：非编辑情况下的HTML预览</p>
        <p>HTML Preview(markdown to html)</p>
    </header>
    <div id="test-editormd-view">
                <textarea id="append-test" style="display:none;">

###科学公式 TeX(KaTeX)

$$E=mc^2$$

行内的公式$$E=mc^2$$行内的公式，行内的$$E=mc^2$$公式。

$$\(\sqrt{3x-1}+(1+x)^2\)$$

$$\sin(\alpha)^{\theta}=\sum_{i=0}^{n}(x^i + \cos(f))$$

$$X^2 > Y$$

#####上标和下标

上标：X&lt;sup&gt;2&lt;/sup&gt;

下标：O&lt;sub&gt;2&lt;/sub&gt;

##### 代码块里包含的过滤标签及属性不会被过滤

```html
&lt;style type="text/style"&gt;
body{background:red;}
&lt;/style&gt;

&lt;script type="text/javscript"&gt;
alert("script");
&lt;/script&gt;

&lt;iframe height=498 width=510 src="http://player.youku.com/embed/XMzA0MzIwMDgw" frameborder=0 allowfullscreen&gt;&lt;/iframe&gt;
```

#####Style

&lt;style&gt;
body{background:red;}
&lt;/style&gt;

&lt;style type="text/style"&gt;
body{background:red;}
&lt;/style&gt;

#####Script

&lt;script&gt;
alert("script");
&lt;/script&gt;

&lt;script type="text/javscript"&gt;
alert("script");
&lt;/script&gt;</textarea>
    </div>
</div>
<!-- <script src="js/zepto.min.js"></script>
<script>
    var jQuery = Zepto;  // 为了避免修改flowChart.js和sequence-diagram.js的源码，所以使用Zepto.js时想支持flowChart/sequenceDiagram就得加上这一句
</script> -->
<script src="<%=basePath%>/static/js/jquery.min.js"></script>
<script src="<%=basePath%>/plugins/editormd/lib/marked.min.js"></script>
<script src="<%=basePath%>/plugins/editormd/lib/prettify.min.js"></script>

<script src="<%=basePath%>/plugins/editormd/lib/raphael.min.js"></script>
<script src="<%=basePath%>/plugins/editormd/lib/underscore.min.js"></script>
<script src="<%=basePath%>/plugins/editormd/lib/sequence-diagram.min.js"></script>
<script src="<%=basePath%>/plugins/editormd/lib/flowchart.min.js"></script>
<script src="<%=basePath%>/plugins/editormd/lib/jquery.flowchart.min.js"></script>

<script src="<%=basePath%>/plugins/editormd/editormd.js"></script>
<script type="text/javascript">
    $(function() {
        var testEditormdView;
        testEditormdView = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
        });
    });
</script>
</body>
</html>