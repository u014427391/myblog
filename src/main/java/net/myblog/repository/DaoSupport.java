package net.myblog.repository;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import net.myblog.utils.ClassUtils;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@SuppressWarnings("unchecked")
@Transactional
public abstract class DaoSupport<T> implements Dao<T> {

	protected Class<T> entityClass = ClassUtils.getSuperClassGenricType(this
			.getClass());

	@PersistenceContext
	protected EntityManager entityManager;

	/**
	 * 保存实体
	 * 
	 * @param entity
	 *            : 要保存的实体对象
	 */
	public void save(Object entity) {
		entityManager.persist(entity);
	}

	/**
	 * 批量保存
	 * 
	 * @param collection
	 *            : 保存对象集合
	 * @return
	 */
	@Override
	public void batchSave(Collection<T> collection) {
		for (Iterator<T> iterator = collection.iterator(); iterator.hasNext();) {
			T obj = iterator.next();
			entityManager.persist(obj);
		}
	}

	/**
	 * 更新实体,调用更新方法时如果实体类的主键属性没有设置<br>
	 * 则会将该实体保存到数据库
	 * 
	 * @param entity
	 *            : 要更新的对象
	 */
	public void update(Object entity) {
		entityManager.merge(entity);
	}

	/**
	 * 删除实体
	 * 
	 * @param id
	 *            : 实体id
	 */
	public void delete(Serializable id) {
		delete(new Serializable[] { id });
	}

	/**
	 * 批量删除实体
	 * 
	 * @param idArray
	 *            : 实体id数组
	 */
	public void delete(Serializable... idArray) {
		Serializable currentId = null;
		try {
			for (Serializable id : idArray) {
				currentId = id;
				entityManager.remove(entityManager.find(entityClass, id));
			}
		} catch (Exception e) {
			throw new RuntimeException("delete " + entityClass.getSimpleName()
					+ " : 不存在  id=" + currentId);
		}

	}

	/**
	 * 根据实体的id获取实体
	 * 
	 * @param id
	 *            : 实体id
	 * @return
	 */
	@Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
	public T findById(Serializable id) {
		return entityManager.find(entityClass, id);
	}


	/**
	 * 根据实体的id获取实体
	 * 
	 * @param ids
	 *            : 存放id的数组
	 * @return
	 */
	@Override
	@Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
	public Set<T> findByIds(Serializable[] ids) {
		Serializable currentId = null;
		Set<T> resuts = new HashSet<T>();
		try {
			for (Serializable id : ids) {
				currentId = id;
				resuts.add(entityManager.find(entityClass, id));
			}
		} catch (Exception e) {
			throw new RuntimeException("find " + entityClass.getSimpleName()
					+ " : 不存在  id=" + currentId);
		}
		return resuts;
	}

	/**
	 * 根据实体的id获取实体
	 * 
	 * @param ids
	 *            : 存放id的集合
	 * @return
	 */
	@Override
	@Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
	public List<T> findByIds(Collection<?> ids) {
		if (ids == null || ids.size() == 0)
			return null;
		List<T> resuts = new ArrayList<T>();
		for (Iterator<?> iterator = ids.iterator(); iterator.hasNext();) {
			resuts.add(findById((Serializable) iterator.next()));
		}
		return resuts;
	}
}
