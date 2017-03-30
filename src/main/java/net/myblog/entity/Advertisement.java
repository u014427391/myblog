package net.myblog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 网站广告信息实体类
 * @author Nicky
 */
@Table(name="web_ad")
@Entity
public class Advertisement {

	/** 网站广告Id **/
	private int adId;
	
	/** 广告标题 **/
	private String adTitle;
	
	/** 广告图片路径 **/
	private String adImage;
	
	/** 广告描述 **/
	private String adDesc;

	@GeneratedValue
	@Id
	public int getAdId() {
		return adId;
	}

	public void setAdId(int adId) {
		this.adId = adId;
	}

	@Column(length=100, nullable=false)
	public String getAdTitle() {
		return adTitle;
	}

	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}

	@Column(length=100, nullable=false)
	public String getAdImage() {
		return adImage;
	}

	public void setAdImage(String adImage) {
		this.adImage = adImage;
	}

	public String getAdDesc() {
		return adDesc;
	}

	public void setAdDesc(String adDesc) {
		this.adDesc = adDesc;
	}
	
	
}
