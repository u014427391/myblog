package net.myblog.repository;

import java.util.List;

import javax.persistence.QueryHint;

import net.myblog.entity.FriendlyLink;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PathVariable;

public interface FriendlyLinkRepository extends JpaRepository<FriendlyLink,Integer>{

	/**
	 * 查询所有的友情连接信息
	 */
	@Query("FROM FriendlyLink")
	@QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
	public List<FriendlyLink> findAll();

	/**
	 * 修改友情链接信息
	 * @param linkName
	 * 			友情链接名称
	 * @param linkUrl
	 * 			友情链接地址
	 * @return
	 */
	@Modifying
	@Query("UPDATE FriendlyLink l set l.linkName=:linkname,l.linkUrl=:linkurl"
			+ " where l.linkId=:linkid")
	public int updateFL(@Param("linkname")String linkName,
			@Param("linkurl")String linkUrl,@Param("linkid")int linkId);
	
	
}
