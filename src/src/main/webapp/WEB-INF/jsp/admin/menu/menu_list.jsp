<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<div style="font-family: microsoft yahei">
<div title="菜单管理" class="easyui-panel" style="padding:5px">
<div id="mtb"> 
	<div>
		<a href="javascript:openLinkAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
		<a href="javascript:deleteLink()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:openLinkModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>		
		<a href="javascript:reload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>		
	</div>
</div>
<div>
		<ul class="easyui-tree">
		<c:choose>
			<c:when test="${not empty menus }">
			<c:forEach items="${menus }" var="m">
			<li>
				<span>${m.name }</span>
				<ul>
					<c:if test="${m.hasMenu==true }">
					<c:forEach items="${m.subMenu}" var="subm">
					<li>
						<span>${subm.name}</span>
					</li>
					</c:forEach>
					</c:if>
				</ul>
			</li>
			</c:forEach>
			</c:when>
			<c:otherwise>
			<li>没有相关数据</li>
			</c:otherwise>
		</c:choose>
		</ul>
</div>
</div>
<div id="mdlg" class="easyui-dialog" style="width:500px; height:180px; padding:10px 20px" 
	closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>菜单名称</td>
				<td>
					<input type="text" id="name" name="name" class="easyui-validatebox" required="true">
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