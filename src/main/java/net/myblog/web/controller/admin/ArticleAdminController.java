package net.myblog.web.controller.admin;

import javax.servlet.http.HttpServletRequest;

import net.myblog.core.Constants;
import net.myblog.entity.Article;
import net.myblog.service.ArticleService;
import net.myblog.web.controller.BaseController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/article")
public class ArticleAdminController extends BaseController{

	@Autowired ArticleService articleService;
	
	@RequestMapping("/list")
	public String listAll(HttpServletRequest request,Model model){
		String pageNoString = request.getParameter("pageNo");
		if(pageNoString==null||"".equals(pageNoString)){
			pageNoString = "1";
		}
		int pageNo = Integer.parseInt(pageNoString);
		int pageSize = Constants.PAGE_SIZE;
		Page<Article> articlePage = articleService.findAll(pageNo, pageSize,Direction.ASC,"articleId");
		
		model.addAttribute("articles", articlePage.getContent());
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage",articlePage.getTotalElements());
		return "admin/article/article_list";
	}
	
}
