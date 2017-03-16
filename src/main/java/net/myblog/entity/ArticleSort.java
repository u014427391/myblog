package net.myblog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 文章栏目信息的实体类
 * @author Nicky
 */
@Table(name="article_sort")
@Entity
public class ArticleSort {

	/**
	 * 文章栏目Id
	 */
	private int typeId;
	
	/**
	 * 栏目名称
	 */
	private String name;
	
	/**
	 * 用户Id
	 */
	//private int userId;

	@GeneratedValue
	@Id
	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	@Column(length=100, nullable=false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
}
