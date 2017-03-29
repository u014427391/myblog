package net.myblog.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 文章评论信息的实体类
 * @author Nicky
 */
@Table(name="article_comment")
@Entity
public class ArticleComment {

	/** 评论Id**/
	private int commentId;
	
	/** 评论者Id**/
	private int postId;
	
	/** 博主Id**/
	private int userId;
	
	/** 文章Id**/
	private int articleId;
	
	/** 评论内容**/
	private String content;
	
	/** 回复Id**/
	private int responseId;
	
	/** 评论时间**/
	private Date time;

	@Id
	@Column(nullable=false)
	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	@Column(nullable=false)
	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	@Column(nullable=false)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(nullable=false)
	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	@Column(length=1000, nullable=false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(nullable=false)
	public int getResponseId() {
		return responseId;
	}

	public void setResponseId(int responseId) {
		this.responseId = responseId;
	}

	@Temporal(TemporalType.DATE)
	@Column(nullable=false,updatable=false)
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	
}
