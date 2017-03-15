package net.myblog.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.myblog.core.Constants;
import net.myblog.entity.ArticleSort;
import net.myblog.entity.FriendlyLink;
import net.myblog.entity.User;
import net.myblog.entity.WebAd;
import net.myblog.service.ArticleSortService;
import net.myblog.service.FriendlyLinkService;
import net.myblog.service.UserService;
import net.myblog.service.WebAdService;
import net.myblog.utils.Tools;
import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @description 登录操作的控制类，使用Shiro框架，做好了登录的权限安全认证，
 * getRemortIP()方法获取用户登录时的ip并保存到数据库
 * @author Nicky
 * @date 2017年3月15日
 */
@Controller
public class LoginController extends BaseController{
	
	@Resource
	UserService userService;
	@Resource
	ArticleSortService articleSortService;
	@Resource
	FriendlyLinkService friendlyLinkService;
	@Resource
	WebAdService webAdService;
	
	/**
	 * 获取登录用户的IP
	 * @throws Exception 
	 */
	public void getRemortIP(String username)  {  
		HttpServletRequest request = this.getRequest();
		Map<String,String> map = new HashMap<String,String>();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		map.put("username", username);
		map.put("loginIp", ip);
		userService.saveIP(map);
	}  
	
	/**
	 * 访问博客主页
	 * @return
	 */
	@RequestMapping(value="/toblog",produces="text/html;charset=UTF-8")
	public ModelAndView toBlog(Model model)throws ClassNotFoundException{
		ModelAndView mv = this.getModelAndView();
		List<ArticleSort> articleSorts = articleSortService.findAll();
		List<FriendlyLink> links = friendlyLinkService.findAll();
		List<WebAd> webAds = webAdService.findAll();
		model.addAttribute("articleSorts", articleSorts);
		model.addAttribute("links",links);
		model.addAttribute("webAds", webAds);
		mv.setViewName("myblog/index");
		return mv;
	}
	
	/**
	 * 访问后台登录页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login",produces="text/html;charset=UTF-8")
	public ModelAndView toLogin()throws ClassNotFoundException{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("admin/login");
		return mv;
	}
	
	/**
	 * 基于Shiro框架的登录验证
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/logincheck", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object loginCheck(HttpServletRequest request)throws AuthenticationException{
		JSONObject obj = new JSONObject();
		String errInfo = "";//错误信息
		String logindata[] = request.getParameter("LOGINDATA").split(",");
		if(logindata != null && logindata.length == 3){
			//获取Shiro管理的Session
			Subject  currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			String codeSession = (String)session.getAttribute(Constants.SESSION_SECURITY_CODE);
			System.out.println("codeSession:"+codeSession);
			System.out.println("username:"+logindata[0]);
			String code = logindata[2]; 
			/**检测页面验证码是否为空，调用工具类检测**/
			if(code == null || "".equals(code)){
				errInfo = "nullcode";
			}else{
				String username = logindata[0];
				String password = logindata[1];
				System.out.println("password:"+password);
				if(Tools.isNotEmpty(codeSession) && codeSession.equalsIgnoreCase(code)){
					//Shiro框架sha加密
					String passwordsha = new SimpleHash("SHA-1",username,password).toString();
					System.out.println("sha密码:"+passwordsha);
					User user = userService.findByUsername(username);
					if(user != null){
						//Shiro添加会话
						System.out.println("用户名1:"+username);
						session.setAttribute("username", username);
						session.setAttribute(Constants.SESSION_USER, user);
						//删除验证码Session
						session.removeAttribute(Constants.SESSION_SECURITY_CODE);
						//保存登录IP
						getRemortIP(username);
						/**Shiro加入身份验证**/
						Subject subject = SecurityUtils.getSubject();
						UsernamePasswordToken token = new UsernamePasswordToken(username,password);
						subject.login(token);
					}else{
						//账号或者密码错误
						errInfo = "uerror";
						System.out.println("测试："+errInfo);
					}
					if(Tools.isEmpty(errInfo)){
						errInfo = "success";
						System.out.println("success");
					}
				}else{
					//缺少参数
					errInfo="codeerror";
				}
			}
		}
		obj.put("result", "success");
		return obj;
	}
		
	/**
	 * 后台管理系统主页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/index")
	public ModelAndView toMain() throws AuthenticationException{
		ModelAndView mv = this.getModelAndView();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Constants.SESSION_USER);
		if(user != null){
			
		}else{
			//会话失效，返回登录界面
			//mv.setViewName("admin/login");
		}
		mv.setViewName("admin/index");
		return mv;
	}
	
	/**
	 * 注销登录
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		ModelAndView mv = this.getModelAndView();
		/**Shiro管理Session**/
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.removeAttribute(Constants.SESSION_USER);
		session.removeAttribute(Constants.SESSION_SECURITY_CODE);
		/**Shiro销毁登录**/
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		/**返回后台系统登录界面**/
		mv.setViewName("admin/login");
		return mv;
	}


}
