package net.myblog.entity.vo;

import net.myblog.entity.Article;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * @author nicky
 * @date 2019-01-07
 */
@Table(name="article_sort")
@Entity
public class ArticleSortVo implements Serializable{

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




}
