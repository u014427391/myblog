package net.myblog.junit.test;

import net.myblog.core.Constants;
import net.myblog.core.lucene.HighlighterBuilder;
import net.myblog.core.lucene.IndexWriterBuilder;
import net.myblog.entity.Article;
import net.myblog.utils.DateUtils;
import net.myblog.utils.Tools;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class LuceneTest {
	
	private static Directory dir;
	
	public static void main(String[] args) {
		Article a = new Article();
		a.setArticleId(123);
		a.setArticleName("测试");
		a.setArticleContent("测试内容123");
		addIndex(a);
		List<Article> articles = searchArticle("测试");
		for(Article article:articles){
			System.out.println(article.getArticleContent());
		}
	}
	
	/**
	 * 添加博客文章索引
	 * @param article
	 */
	public static void addIndex(Article article){
		try {
			IndexWriter writer = IndexWriterBuilder.getWriter(Constants.LUCENE_INDEX_PATH);
			Document doc = new Document();
			doc.add(new StringField("id", String.valueOf(article.getArticleId()), Field.Store.YES));
			doc.add(new TextField("title", article.getArticleName(), Field.Store.YES));
			doc.add(new StringField("releaseDate", DateUtils.formatDate(new Date(), "yyyy-MM-dd"), Field.Store.YES));		
			doc.add(new TextField("content", article.getArticleContent(), Field.Store.YES));	
			writer.addDocument(doc);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static List<Article> searchArticle(String keyword){
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
