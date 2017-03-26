package net.myblog.repository;

import java.util.List;

import net.myblog.entity.Article;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface ArticleRepository extends PagingAndSortingRepository<Article,Integer>{
	
	@Query("from Article a where a.articleSupport=1 "
			+ "order by a.articleId asc")
	public List<Article> findSupportArticle();
}
