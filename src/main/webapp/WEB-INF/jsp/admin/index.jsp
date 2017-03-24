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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${basePath }static/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="${basePath }static/css/main.css" />
<link rel="stylesheet" type="text/css" href="${basePath }static/css/icon.css" />
<script type="text/javascript" src="${basePath }static/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${basePath }static/js/jquery.easyui.min.js"></script>

<title>首页</title>
</head>
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="wu-header" data-options="region:'north',border:false,split:true">
    	<div class="wu-header-left">
        	<h1>博客后台管理系统</h1>
        </div>
        <div class="wu-header-right">
        	<p><strong class="easyui-tooltip" title="2条未读消息">admin</strong>，欢迎您！</p>
            <p><a href="#">网站首页</a>|<a href="#">支持论坛</a>|<a href="#">帮助中心</a>|<a href="#">安全退出</a></p>
        </div>
    </div>
    <!-- end of header -->
    <!-- begin of sidebar -->
	<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'"> 
    	<div class="easyui-accordion" data-options="border:false,fit:true"> 
        	<div title="快捷菜单" data-options="iconCls:'icon-search'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-search"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="temp/layout-2.html" iframe="0">菜单导航</a></li>
                    <li iconCls="icon-ok"><a href="javascript:void(0)" data-icon="icon-users" data-link="temp/layout-3.html" iframe="0">用户管理</a></li>
                    <li iconCls="icon-save"><a href="javascript:void(0)" data-icon="icon-user-group" data-link="temp/layout-3.html" iframe="0">角色管理</a></li>
                    <li iconCls="icon-ok"><a href="javascript:void(0)" data-icon="icon-book" data-link="temp/layout-3.html" iframe="0">数据字典</a></li>
                    <li iconCls="icon-ok"><a href="javascript:void(0)" data-icon="icon-cog" data-link="temp/layout-3.html" iframe="0">系统参数</a></li>
                    <li iconCls="icon-ok"><a href="javascript:void(0)" data-icon="icon-application-osx-error" data-link="temp/layout-3.html" iframe="0">操作日志</a></li>
                </ul>
            </div>
        </div>
    </div>	
    <!-- end of sidebar -->
    <!-- begin of main -->
    <div class="wu-main" data-options="region:'center'">
        <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">  
            <div title="首页" data-options="href:'temp/layout-1.html',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
        </div>
    </div>
    <!-- end of main --> 
    <!-- begin of footer -->
	<div class="wu-footer" data-options="region:'south',border:true,split:true">
    	Copyright ©Nicky's blog 2017
    </div>
    <!-- end of footer --> 
    <script type="text/javascript">
		$(function(){
			$('.wu-side-tree a').bind("click",function(){
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe')==1?true:false;
				addTab(title,url,iconCls,iframe);
			});	
		})
		
		/**
		* Name 载入树形菜单 
		*/
		$('#wu-side-tree').tree({
			url:'temp/menu.php',
			cache:false,
			onClick:function(node){
				var url = node.attributes['url'];
				if(url==null || url == ""){
					return false;
				}
				else{
					addTab(node.text, url, '', node.attributes['iframe']);
				}
			}
		});
		
		/**
		* Name 选项卡初始化
		*/
		$('#wu-tabs').tabs({
			tools:[{
				iconCls:'icon-reload',
				border:false,
				handler:function(){
					$('#wu-datagrid').datagrid('reload');
				}
			}]
		});
			
		/**
		* Name 添加菜单选项
		* Param title 名称
		* Param href 链接
		* Param iconCls 图标样式
		* Param iframe 链接跳转方式（true为iframe，false为href）
		*/	
		function addTab(title, href, iconCls, iframe){
			var tabPanel = $('#wu-tabs');
			if(!tabPanel.tabs('exists',title)){
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
				if(iframe){
					tabPanel.tabs('add',{
						title:title,
						content:content,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
				else{
					tabPanel.tabs('add',{
						title:title,
						href:href,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
			}
			else
			{
				tabPanel.tabs('select',title);
			}
		}
		
		/**
		* Name 移除菜单选项
		*/
		function removeTab(){
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab){
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
	</script>
</body>
</html>