package net.myblog.repository;

import java.util.List;

import javax.persistence.QueryHint;

import net.myblog.entity.WebAd;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

public interface WebAdRepository extends JpaRepository<WebAd, Integer>{

	@Query("from web_ad")
	@QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
	public List<WebAd> findAll();
}
