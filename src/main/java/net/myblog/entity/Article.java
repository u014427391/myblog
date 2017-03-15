package net.myblog.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 博客系统文章信息的实体类
 * @author Nicky
 */
@Entity
public class Article {
	
	/**
	 * 文章Id，自增
	 */
	private int articleId;
	
	/**
	 * 文章名称
	 */
	private String articleName;
	
	/**
	 * 文章发布时间
	 */
	private Date articleTime;
	
	/**
	 * 文章内容
	 */
	private String articleContent;
	
	/**
	 * 查看人数
	 */
	private int articleClick;
	
	/**
	 * 是否博主推荐。0为否；1为是
	 */
	private int articleSupport;
	
	/**
	 * 是否置顶。0为；1为是
	 */
	private int articleUp;
	
	/**
	 * 文章类别。0为私有，1为公开，2为仅好友查看
	 */
	private int articleType;
	
	/**
	 * 栏目Id
	 */
	private int typeId;
	
	/**
	 * 博主Id
	 */
	private int userId;

	@GeneratedValue
	@Id
	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	@Column(length=100, nullable=false)
	public String getArticleName() {
		return articleName;
	}

	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}

	@Temporal(TemporalType.DATE)
	@Column(nullable=false, updatable=false)
	public Date getArticleTime() {
		return articleTime;
	}

	public void setArticleTime(Date articleTime) {
		this.articleTime = articleTime;
	}

	@Column(nullable=false)
	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public int getArticleClick() {
		return articleClick;
	}

	public void setArticleClick(int articleClick) {
		this.articleClick = articleClick;
	}

	public int getArticleSupport() {
		return articleSupport;
	}

	public void setArticleSupport(int articleSupport) {
		this.articleSupport = articleSupport;
	}

	public int getArticleUp() {
		return articleUp;
	}

	public void setArticleUp(int articleUp) {
		this.articleUp = articleUp;
	}

	@Column(nullable=false)
	public int getArticleType() {
		return articleType;
	}

	public void setArticleType(int articleType) {
		this.articleType = articleType;
	}

	@Column(nullable=false)
	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	@Column(nullable=false)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	
}
