package net.myblog.web.controller.admin;

import com.alibaba.fastjson.JSONObject;
import net.myblog.core.Constants;
import net.myblog.entity.Article;
import net.myblog.service.ArticleService;
import net.myblog.service.ArticleSortService;
import net.myblog.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;


@Controller
@RequestMapping("/article")
public class ArticleAdminController extends BaseController{

	@Autowired
    ArticleService articleService;
	@Autowired
    ArticleSortService articleSortService;
	
	/**
	 * 跳转到文章列表页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
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
	 
	/**
	 * 跳转到写文章页面
	 * @return
	 */
	@RequestMapping(value="/toWriteArticle",method=RequestMethod.GET)
	public ModelAndView toWriteArticle() {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("admin/article/article_write");
		return mv;
	}

	/**
	 * 修改更新文章
	 */
	@RequestMapping(value = "/saveOrUpdateArticle", method = RequestMethod.POST)
	@ResponseBody
	public String saveOrUpdateArticle (@RequestParam("title")String title , @RequestParam("content")String content,
        @RequestParam("typeId")String typeIdStr) {
	    int typeId = Integer.parseInt(typeIdStr);
	    Article article = new Article();
	    article.setArticleName(title);
	    article.setArticleContent(content);
	    article.setArticleTime(new Date());
	    article.setTypeId(typeId);
        //ArticleSort articleSort = this.articleSortService.getArticleSort(typeId);
        //article.setArticleSort(articleSort);
		JSONObject result = new JSONObject();
	    try {
            this.articleService.saveOrUpdateArticle(article);
            result.put("result","success");
            return result.toJSONString();
        } catch (Exception e) {
	        error("保存文章报错:{}"+e);
			result.put("result","error");
			return result.toJSONString();
        }
	}
	
}
