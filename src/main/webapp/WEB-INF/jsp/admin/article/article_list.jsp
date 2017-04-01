<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<div style="font-family: microsoft yahei">
<table id="dg" title="友情链接管理" class="easyui-datagrid" fitColumns="true" pagination="true"
	url="${basePath }link/doLoadData.do" toolbar="#articletb">
	<thead>
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="30" align="center">文章编号</th>
			<th field="title" width="100" align="center">文章标题</th>
			<th field="time" width="200" align="center">发布时间</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
		<c:when test="${not empty articles}">
		<c:forEach items="${articles }" var="a">
		<tr>
			<td checkbox="true" align="center"></td>
			<td width="30" align="center">${a.articleId}</td>
			<td width="100" align="center">${a.articleName }</td>
			<td width="200" align="center">${a.articleTime }</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>没有相关数据</tr>
		</c:otherwise>
		</c:choose>
	</tbody>
</table>
<div id="articletb"> 
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
				<td>文章标题</td>
				<td>
					<input type="text" id="title" name="title" class="easyui-validatebox" required="true">
				</td>
			</tr>
			<tr>
				<td>发布时间</td>
				<td>
					<input type="text" class="easyui-validatebox" required="true">
				</td>
			</tr>
			<tr>
				<td>文章编号</td>
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
</div>