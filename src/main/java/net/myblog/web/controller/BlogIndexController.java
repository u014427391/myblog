package net.myblog.web.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myblog.core.Constants;
import net.myblog.core.lucene.LuceneSearchEnginer;
import net.myblog.entity.Advertisement;
import net.myblog.entity.Article;
import net.myblog.entity.ArticleSort;
import net.myblog.entity.FriendlyLink;
import net.myblog.service.AdvertisementService;
import net.myblog.service.ArticleService;
import net.myblog.service.ArticleSortService;
import net.myblog.service.FriendlyLinkService;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@Autowired
	LuceneSearchEnginer searchEnginer;

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
		//获取最新文章
		List<Article> tArticles = articleService.findOrderByArticleTime(1, Constants.PAGE_SIZE,Direction.ASC,"articleTime");
		//获取博主推荐文章
		List<Article> articlesTemp = articleService.findSupportArticle();
		List<Article> supportArticles = new ArrayList<Article>();
		
		//只筛选3条记录
		int size = articlesTemp.size();
		if(size>Constants.SORT_SIZE){
			supportArticles.add(0, articlesTemp.get(0));
			supportArticles.add(1, articlesTemp.get(1));
			supportArticles.add(2, articlesTemp.get(2));
		}else{
			supportArticles = articlesTemp;
		}
		//获取文章类别标签
		List<ArticleSort> articleSorts = articleSortService.findAll();
		//获取友情链接信息
		List<FriendlyLink> links = friendlyLinkService.findAll();
		//获取广告信息
		List<Advertisement> webAds = webAdService.findAll();
		JSONArray advsJson = JSONArray.fromObject(webAds);
		String result = advsJson.toString();
		System.out.println(result);
		
		//获取归档文章信息
		List<Object[]> archiveArticles = articleService.findArticleGroupByTime();

		model.addAttribute("articles", articlePage.getContent());
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage",articlePage.getTotalElements());
		model.addAttribute("tArticles", tArticles);
		model.addAttribute("supportArticles", supportArticles);
		model.addAttribute("articleSorts", articleSorts);
		model.addAttribute("links",links);
		model.addAttribute("advsJson", result);
		model.addAttribute("archiveArticles", archiveArticles);
		mv.setViewName("myblog/frame/index");
		return mv;
	}
	
	/**
	 * 对文章进行Lucene的全文搜索，基于索引搜索
	 * @param model
	 * @return
	 */
	@RequestMapping("/search")
	public String search(@RequestParam(value="keyword",required=false)String keyword,
			HttpServletRequest request,Model model){
		List<Article> articles = searchEnginer.searchArticle(keyword);
		for(Article a:articles){
			System.out.println("文章标题:"+a.getArticleName());
		}
		model.addAttribute("articles", articles);
		return "myblog/article/article_search";
	}
	
}
