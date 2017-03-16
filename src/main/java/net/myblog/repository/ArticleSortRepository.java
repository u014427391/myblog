package net.myblog.repository;

import java.util.List;

import javax.persistence.QueryHint;

import net.myblog.entity.ArticleSort;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

public interface ArticleSortRepository extends JpaRepository<ArticleSort,Integer>{

	/**启用setHint缓存，查询一次，之后缓存处理**/
	@Query("FROM ArticleSort")
	@QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
	List<ArticleSort> getAll();
}
