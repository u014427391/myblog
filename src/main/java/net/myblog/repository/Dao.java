package net.myblog.repository;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;



public interface Dao<T>{
	
	/**
	 * 保存实体
	 * @param entity : 要保存的实体对象
	 */
	public void save(Object entity);
	
	/**
	 * 更新实体
	 * @param entity : 要更新的对象
	 */
	public void update (Object entity);
	
	/**
	 * 删除实体
	 * @param id : 实体id
	 */
	public void delete (Serializable id);
	
	/**
	 * 批量删除实体
	 * @param idArray : 实体id数组
	 */
	public void delete (Serializable... idArray);
	
	/**
	 * 根据实体的id获取实体
	 * @param id : 实体id
	 * @return 返回获取的对象
	 */
	public T findById(Serializable id);
	
	/**
	 * 批量保存
	 * @param collection : 保存对象集合
	 * @return
	 */
	public void batchSave(Collection<T> collection);

	public Set<T> findByIds(Serializable[] ids);

	public List<T> findByIds(Collection<?> ids);
}
