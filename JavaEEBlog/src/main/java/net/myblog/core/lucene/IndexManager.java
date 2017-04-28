package net.myblog.core.lucene;

import java.io.IOException;
import java.util.Date;

import net.myblog.core.Constants;
import net.myblog.entity.Article;
import net.myblog.utils.DateUtils;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.springframework.stereotype.Component;

/**
 * @description Lucene索引管理类
 * @author Nicky
 * @date 2017年4月3日
 */
@Component
public class IndexManager {
	
	/**
	 * 添加博客文章索引
	 * @param article
	 */
	public void addIndex(Article article){
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

	/**
	 * 删除博客文章索引
	 * @param articleId
	 */
	public void deleteIndex(String articleId){
		try {
			IndexWriter writer = IndexWriterBuilder.getWriter(Constants.LUCENE_INDEX_PATH);
			writer.deleteDocuments(new Term("id",articleId));
			writer.forceMergeDeletes();
			writer.commit();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新博客文章索引
	 * @param article
	 */
	public void updateIndex(Article article){
		IndexWriter writer;
		try {
			writer = IndexWriterBuilder.getWriter(Constants.LUCENE_INDEX_PATH);
			Document doc = new Document();
			doc.add(new StringField("id", String.valueOf(article.getArticleId()), Field.Store.YES));
			doc.add(new TextField("title", article.getArticleName(), Field.Store.YES));
			doc.add(new StringField("releaseDate", DateUtils.formatDate(new Date(), "yyyy-MM-dd"), Field.Store.YES));		
			doc.add(new TextField("content", article.getArticleContent(), Field.Store.YES));	
			writer.updateDocument(new Term("id", String.valueOf(article.getArticleId())), doc);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
