package net.myblog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 友情链接信息的实体类
 * @author Nicky
 */
@Table(name="friendly_link")
@Entity
public class FriendlyLink {

	/**
	 * 友情链接Id
	 */
	private int linkId;
	
	/**
	 * 链接名称
	 */
	private String linkName;
	
	/**
	 * 链接url
	 */
	private String linkUrl;

	@GeneratedValue
	@Id
	public int getLinkId() {
		return linkId;
	}

	public void setLinkId(int linkId) {
		this.linkId = linkId;
	}

	@Column(length=100,nullable=false)
	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	@Column(length=100,nullable=false)
	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	
	
}
