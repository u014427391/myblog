package net.myblog.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.myblog.entity.ArticleSort;
import net.myblog.entity.FriendlyLink;
import net.myblog.service.ArticleSortService;
import net.myblog.service.FriendlyLinkService;
import net.myblog.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @description 用户信息控制类
 * @author Nicky
 * @date 2017年2月28日
 */
@Controller
@RequestMapping(value="/user")
public class UserController extends BaseController{
	
	@Resource
	UserService userService;

}
