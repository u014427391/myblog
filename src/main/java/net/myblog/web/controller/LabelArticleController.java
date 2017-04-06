package net.myblog.web.controller;

import net.myblog.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LabelArticleController extends BaseController{

	@Autowired ArticleService articleService;
	
	
	
}
