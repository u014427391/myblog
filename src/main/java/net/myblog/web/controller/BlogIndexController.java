package net.myblog.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myblog.core.Constants;
import net.myblog.entity.Article;
import net.myblog.entity.ArticleSort;
import net.myblog.entity.FriendlyLink;
import net.myblog.entity.Advertisement;
import net.myblog.service.ArticleService;
import net.myblog.service.ArticleSortService;
import net.myblog.service.FriendlyLinkService;
import net.myblog.service.MenuService;
import net.myblog.service.AdvertisementService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BlogIndexController extends BaseController{
	
	@Autowired
	ArticleService articleService;
	@Autowired
	ArticleSortService articleSortService;
	@Autowired
	FriendlyLinkService friendlyLinkService;
	@Autowired
	AdvertisementService webAdService;

	/**
	 * 访问博客主页
	 * @return
	 */
	@RequestMapping(value="/toblog",produces="text/html;charset=UTF-8")
	public ModelAndView toBlog(HttpServletRequest request, HttpServletResponse response, Model model)throws ClassNotFoundException{
		ModelAndView mv = this.getModelAndView();
		
		String pageNoString = request.getParameter("pageNo");
		if(pageNoString==null||"".equals(pageNoString)){
			pageNoString = "1";
		}
		int pageNo = Integer.parseInt(pageNoString);
		int pageSize = Constants.PAGE_SIZE;
		Page<Article> articlePage = articleService.findAll(pageNo, pageSize,Direction.ASC,"articleId");
		
		List<Article> tArticles = articleService.findOrderByArticleTime(1, Constants.PAGE_SIZE,Direction.ASC,"articleTime");
		List<Article> articlesTemp = articleService.findSupportArticle();
		List<Article> supportArticles = new ArrayList<Article>();
		int size = articlesTemp.size();
		if(size>Constants.SORT_SIZE){
			supportArticles.add(0, articlesTemp.get(0));
			supportArticles.add(1, articlesTemp.get(1));
			supportArticles.add(2, articlesTemp.get(2));
		}else{
			supportArticles = articlesTemp;
		}
		List<ArticleSort> articleSorts = articleSortService.findAll();
		List<FriendlyLink> links = friendlyLinkService.findAll();
		List<Advertisement> webAds = webAdService.findAll();
		
		model.addAttribute("articles", articlePage.getContent());
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage",articlePage.getTotalElements());
		model.addAttribute("tArticles", tArticles);
		model.addAttribute("supportArticles", supportArticles);
		model.addAttribute("articleSorts", articleSorts);
		model.addAttribute("links",links);
		model.addAttribute("webAds", webAds);
		mv.setViewName("myblog/index");
		return mv;
	}
	
}
