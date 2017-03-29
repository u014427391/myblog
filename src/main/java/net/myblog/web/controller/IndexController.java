package net.myblog.web.controller;

import net.myblog.service.MenuService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @description 博客后台系统主页的控制类
 * @author Nicky
 * @date 2017年3月27日
 */
@Controller
public class IndexController extends BaseController{

	@Autowired MenuService menuService;
	
	
	
}
