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
<title>博客后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="font-family: microsoft yahei">
<table id="dg" title="友情链接管理" class="easyui-datagrid" fitColumns="true" pagination="true"
	url="link/doLoadData.do" toolbar="#tb">
	<thead>
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="20" align="center">链接编号</th>
			<th field="linkname" width="100" align="center">友情链接名称</th>
			<th field="linkurl" width="200" align="center">友情链接地址</th> 
		</tr>
	</thead>
</table>
<div id="tb"> 
	<div>
		<a href="javascript:openLinkAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
		<a href="javascript:deleteLink()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:openLinkModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>		
		<a href="javascript:reload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>		
	</div>
</div>
<div id="dlg" class="easyui-dialog" style="width:500px; height:180px; padding:10px 20px" 
	closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>友情链接名称</td>
				<td>
					<input type="text" id="linkname" name="linkname" class="easyui-validatebox" required="true">
				</td>
			</tr>
			<tr>
				<td>友情链接地址</td>
				<td>
					<input type="text" id="linkurl" name="linkurl" class="easyui-validatebox" 
						validtype="url" required="true" style="width:250px">
				</td>
			</tr>
			<tr>
				<td>友情链接编号</td>
				<td>
					<input type="text" id="order" name="order" class="easyui-numberbox" required="true" 
						style="width:60px">&nbsp;
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="dlg-buttons">
	<div>
		<a href="javascript:saveLink()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">保存</a>
		<a href="javascript:closeLinkDialog()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">关闭</a>
	</div>
</div>
</body>
</html>