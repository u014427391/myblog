package net.myblog.repository;

import java.util.Date;
import java.util.List;

import net.myblog.entity.Article;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface ArticleRepository extends PagingAndSortingRepository<Article,Integer>{
	/**
	 * 获取博主推荐的文章
	 * @return
	 */
	@Query("from Article a where a.articleSupport=1 order by a.articleId asc")
	public List<Article> findSupportArticle();
	
	/*SELECT YEAR(articleTime) AS 'year',MONTH(articleTime) AS 'month',COUNT(*) AS 'count' FROM article 
	GROUP BY YEAR(articleTime) DESC,MONTH(articleTime);*/
	/**
	 * 文章归档信息获取
	 * @return
	 */
	@Query(value="select year(a.articleTime) as year,month(a.articleTime) as month,"
			+ "count(a) as count from Article a group by year(a.articleTime),month(a.articleTime)",
			countQuery="select count(1) from (select count(1) from Article a group by year(a.articleTime),month(a.articleTime))")
	public List<Object[]> findArticleGroupByTime();
	
	/**
	 * 按月份获取文章信息
	 * @param yearmonth
	 * @return
	 */
	@Query("from Article a where date_format(a.articleTime,'%Y%m')=date_format((:yearmonth),'%Y%m') "
			+ "order by articleTime desc")
	public List<Article> findArticleByMonth(@Param("yearmonth")Date yearmonth);
}
