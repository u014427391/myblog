package net.myblog.web.controller;

import net.myblog.entity.Article;
import net.myblog.service.ArticleService;
import net.myblog.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 *  文章归档控制类
 */
@Controller
public class ArchiveArticleController extends BaseController{

	@Autowired ArticleService articleService;
	
	@RequestMapping("/getArchiveArticles")
	public ModelAndView getArticleByMonth(HttpServletRequest request){
		String yearMonthString = request.getParameter("yearmonth");
		ModelAndView mv = this.getModelAndView();
		
		Date yearmonth = DateUtils.parse("yyyy-MM", yearMonthString);
		
		List<Article> articles = articleService.findArticleByMonth(yearmonth);

		mv.addObject("articles", articles);
		mv.setViewName("myblog/article/archive_articles");
		return mv;
	}
	
	
}
