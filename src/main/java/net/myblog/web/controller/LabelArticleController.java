package net.myblog.web.controller;

import net.myblog.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LabelArticleController extends BaseController{

	@Autowired ArticleService articleService;
	
	
}
