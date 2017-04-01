package net.myblog.core;

/**
 * @description Constants类，项目的基本信息配置
 * @author Nicky
 * @date 2017年3月6日
 */
public class Constants {
	//验证码Session
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	//用户信息Session
	public static final String SESSION_USER = "sessionUser";
	//角色权限Session
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	//所有菜单Session
	public static final String SESSION_ALLMENU = "sessionAllMenu";
	//权限Session
	public static final String SESSION_RIGHTS = "sessionRights";
	
	//页面分页数量
	public static final Integer PAGE_SIZE = 6;
	//页面排序数量
	public static final Integer SORT_SIZE = 3;
	
	//登录URL
	public static final String URL_LOGIN = "/login.do";			
	
	//登录过滤的正则表达式
	public static final String REGEXP_PATH = ".*/((login)|(logout)|(toblog)|(code)|(plugins)|(upload)|(static)).*";	//不对匹配该值的访问路径拦截（正则）
}
