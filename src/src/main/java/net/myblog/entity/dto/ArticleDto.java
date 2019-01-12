package net.myblog.entity.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * <pre>
 *
 * </pre>
 *
 * @author nicky
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期: 2019年01月12日  修改内容:
 * </pre>
 */
public class ArticleDto implements Serializable{

    /** 文章Id，自增**/
    private int articleId;

    /** 文章名称**/
    private String articleName;

    /** 文章发布时间**/
    private Date articleTime;

    /** 图片路径，测试**/
    private String imgPath;

    /** 文章内容**/
    private String articleContent;

    /** 查看人数**/
    private int articleClick;

    /** 是否博主推荐。0为否；1为是**/
    private int articleSupport;

    /** 是否置顶。0为；1为是**/
    private int articleUp;

    /** 文章类别。0为私有，1为公开，2为仅好友查看**/
    private int articleType;

    /** typeID，外键**/
    private int typeId;


    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public String getArticleName() {
        return articleName;
    }

    public void setArticleName(String articleName) {
        this.articleName = articleName;
    }

    public Date getArticleTime() {
        return articleTime;
    }

    public void setArticleTime(Date articleTime) {
        this.articleTime = articleTime;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

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

    public int getArticleType() {
        return articleType;
    }

    public void setArticleType(int articleType) {
        this.articleType = articleType;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }
}
