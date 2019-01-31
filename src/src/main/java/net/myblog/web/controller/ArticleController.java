package net.myblog.web.controller;

import net.myblog.entity.Article;
import net.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre>
 *   博客控制类
 * </pre>
 *
 * @author nicky
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期: 2019年01月20日  修改内容:
 * </pre>
 */
@RequestMapping("/article")
@Controller
public class ArticleController extends BaseController{

    @Autowired
    ArticleService articleService;

    /**
     * 博客详情页面
     * @return
     */
    @RequestMapping(value = "/details")
    public ModelAndView details(@RequestParam("articleId")String articleId) {
        ModelAndView mv = this.getModelAndView();
        Article article = articleService.getArticleInfo(Integer.parseInt(articleId));
        mv.addObject("article",article);
        mv.setViewName("myblog/article/article_details");
        return mv;
    }

}
