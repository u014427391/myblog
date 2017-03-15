package net.myblog.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 文章评论回复
 * @author Nicky
 */
//@Table(name="article_response")
@Entity(name="article_response")
public class ArticleResponse {

	/**
	 * 回复Id
	 */
	private int responseId;
	
	/**
	 * 用户Id
	 */
	private int userId;
	
	/**
	 * 回复内容
	 */
	private String content;

	/**
	 * 回复时间
	 */
	private Date time;
	
	@GeneratedValue
	@Id
	public int getResponseId() {
		return responseId;
	}

	public void setResponseId(int responseId) {
		this.responseId = responseId;
	}

	@Column(nullable=false)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(length=1000,nullable=false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false,updatable=false)
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}
