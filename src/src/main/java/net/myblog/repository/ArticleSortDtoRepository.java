package net.myblog.repository;

import net.myblog.entity.dto.ArticleSortDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

import javax.persistence.QueryHint;
import java.util.List;

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
public interface ArticleSortDtoRepository extends JpaRepository<ArticleSortDto,Integer> {

    /**启用setHint缓存，查询一次，之后缓存处理**/
    @Query("FROM ArticleSortDto")
    @QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
    List<ArticleSortDto> getAll();
}
