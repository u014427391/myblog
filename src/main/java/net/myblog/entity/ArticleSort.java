package net.myblog.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 文章栏目信息的实体类
 * @author Nicky
 */
@Table(name="article_sort")
@Entity
public class ArticleSort {

	/** 文章栏目Id**/
	private int typeId;
	
	/** 栏目名称**/
	private String name;
	
	private Set<Article> articles;
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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

	//注意: 若在 1 的一端的 @OneToMany 中使用 mappedBy 属性, 则 @OneToMany 端就不能再使用 @JoinColumn 属性了.
	@OneToMany(fetch=FetchType.EAGER,cascade={CascadeType.REMOVE})
	@JoinColumn(name="typeId")
	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}

	
}
