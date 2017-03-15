package net.myblog.repository;

import java.util.List;

import javax.persistence.QueryHint;

import net.myblog.entity.FriendlyLink;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

public interface FriendlyLinkRepository extends JpaRepository<FriendlyLink,Integer>{

	/**
	 * 查询所有的友情连接信息
	 */
	@Query("FROM friendly_link")
	@QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
	public List<FriendlyLink> findAll();
	
}
