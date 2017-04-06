package net.myblog.web.controller;


import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myblog.core.Constants;
import net.myblog.core.lucene.HighlighterBuilder;
import net.myblog.core.lucene.LuceneSearchEnginer;
import net.myblog.entity.Advertisement;
import net.myblog.entity.Article;
import net.myblog.entity.ArticleSort;
import net.myblog.entity.FriendlyLink;
import net.myblog.service.AdvertisementService;
import net.myblog.service.ArticleService;
import net.myblog.service.ArticleSortService;
import net.myblog.service.FriendlyLinkService;
import net.myblog.utils.DateUtils;
import net.myblog.utils.Tools;
import net.sf.json.JSONArray;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.wltea.analyzer.lucene.IKAnalyzer;

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

	@RequestMapping(value="/search", produces="text/html;charset=UTF-8")
	public ModelAndView doSearch(@RequestParam(value = "keyword", required = false) String keyword,Model model) throws UnsupportedEncodingException{
		ModelAndView mv = this.getModelAndView();
		keyword = encodeStr(keyword);
		System.out.println("keyword:"+keyword);
		List<Article> articles = searchArticle(keyword);
		for(Article a:articles){
			System.out.println("content:"+a.getArticleContent());
		}
		model.addAttribute("articles", articles);
		mv.setViewName("myblog/article/article_search");
		return mv;
	}
	
	public static String encodeStr(String str) {		
		try {			
			return new String(str.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();			
			return null;		
		}
	}
	
	private Directory dir;
	
	public List<Article> searchArticle(String keyword){
		List<Article> articles = new LinkedList<Article>();
		try{
			dir = FSDirectory.open(new File(Constants.LUCENE_INDEX_PATH));
			//创建索引搜索器
			IndexReader reader = DirectoryReader.open(dir);
			IndexSearcher searcher = new IndexSearcher(reader);
			BooleanQuery booleanQuery = new BooleanQuery();
			Analyzer analyzer = new IKAnalyzer(true);
			
			/**使用QueryParser查询分析器构造Query对象**/
			QueryParser titleParser = new QueryParser(Version.LUCENE_47,"title",analyzer);
			//使用title得分高的排前面
			Query tQuery = titleParser.parse(keyword);
			
			QueryParser contentParser = new QueryParser(Version.LUCENE_47,"content",analyzer);
			Query cQuery = contentParser.parse(keyword);
			
			booleanQuery.add(tQuery,BooleanClause.Occur.SHOULD);
			booleanQuery.add(cQuery,BooleanClause.Occur.SHOULD);
			
			//获取相似度最高的100条记录
			TopDocs topDocs = searcher.search(booleanQuery, 100);
			QueryScorer scorer = new QueryScorer(tQuery);
			
			Highlighter highlighter = HighlighterBuilder.getHighlighter(scorer);
			
			/**将获取到的数据进行遍历**/
			for(ScoreDoc scoreDoc : topDocs.scoreDocs){
				Document doc = searcher.doc(scoreDoc.doc);
				Article article = new Article();
				article.setArticleId(Integer.parseInt(doc.get("id")));
				article.setArticleTime(DateUtils.parse("yyyy-MM-dd", doc.get("releaseDate")));
				String title = doc.get("title");
				String content = doc.get("content");
				if(title != null){
					TokenStream tokenStream = analyzer.tokenStream("title", new StringReader(title));
					String hTitle = highlighter.getBestFragment(tokenStream, title);
					if(Tools.isNotEmpty(hTitle)){
						article.setArticleName(hTitle);
					}else{
						article.setArticleName(title);
					}
				}
				if(content != null){
					TokenStream tokenStream = analyzer.tokenStream("conent", new StringReader(content));
					String hContent = highlighter.getBestFragment(tokenStream, content);
					if(Tools.isEmpty(hContent)){
						//对文章内容进行提取
						if(content.length()>100){
							article.setArticleContent(content.substring(0, 100));
						}else{
							article.setArticleContent(content);
						}
					}else{
						article.setArticleContent(hContent);
					}
				}
				articles.add(article);
			}
		}catch(IOException e){
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (InvalidTokenOffsetsException e) {
			e.printStackTrace();
		}
		return articles;
	}
	
	
}
