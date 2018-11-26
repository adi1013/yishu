package com.gcu.yishu.product.dao;

import java.io.Serializable;
import java.util.List;

//import org.springframework.transaction.annotation.Propagation;
//import org.springframework.transaction.annotation.Transactional;

//泛型dao
public interface BaseDao<T> {
	//@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW )
	//新增
	public void save(T entity);
	//更新
	public void update(T entity);
//	//根据id删除
//	public void delete(Serializable id);
	//查询列表
	public List<T> findObjects();
	//根据id查询
	public T findObjectById(Serializable id);
}
