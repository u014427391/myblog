package net.myblog.web.controller;

import net.myblog.entity.Article;
import net.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * <pre>
 *  文章类别控制类
 * </pre>
 *
 * @author nicky
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期: 2019年02月01日  修改内容:
 * </pre>
 */
@Controller
@RequestMapping("/article/label")
public class LabelArticleController extends BaseController{

	@Autowired ArticleService articleService;

	@RequestMapping(value = "/toListLabelArticle",method = RequestMethod.GET)
	public ModelAndView toListLabelArticle(@RequestParam("typeId")String typeId){
		ModelAndView mv = this.getModelAndView();
		List<Article> articles = this.articleService.listArticleByTypeId(Integer.parseInt(typeId));
		mv.addObject("articles", articles);
		mv.setViewName("myblog/article/article_label");
		return mv;
	}
	
	
}
