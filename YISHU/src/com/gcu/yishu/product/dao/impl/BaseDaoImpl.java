package com.gcu.yishu.product.dao.impl;

import java.io.Serializable;

import java.lang.reflect.ParameterizedType;
import java.util.List;


import javax.persistence.FlushModeType;

import org.hibernate.Session;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.gcu.yishu.product.dao.BaseDao;
//---------------浣滃簾涓�------------------
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {

	private Session session;
	private Class<T> clazz;
	
	@SuppressWarnings("unchecked")
	public BaseDaoImpl(){
		// 浣跨敤鍙嶅皠鎶�鏈緱鍒癟鐨勭湡瀹炵被鍨�
				ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass(); // 鑾峰彇褰撳墠new鐨勫璞＄殑 娉涘瀷鐨勭埗绫� 绫诲瀷ProductDaoImpl<Product>
				this.clazz = (Class<T>) pt.getActualTypeArguments()[0]; // 鑾峰彇绗竴涓被鍨嬪弬鏁扮殑鐪熷疄绫诲瀷
				System.out.println("clazz ---> " + clazz);
	}

	
	@Override
	public void save(T entity) {
		//getHibernateTemplate().save(entity);
		
		System.out.println("save T entity: "+entity.toString());
		
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		session.setFlushMode(FlushModeType.AUTO);
		session.save(entity);
		session.close();
		System.out.println("宸� 淇� 瀛�");

	}
	
	@Override
	public void update(T entity) {
		getHibernateTemplate().update(entity);
	}

	@Override
	public List<T> findObjects() {
		getHibernateTemplate().getSessionFactory().openSession().createQuery("FROM "+clazz.getSimpleName());
		return null;
	}

	@Override
	public T findObjectById(Serializable id) {
		// TODO 鑷姩鐢熸垚鐨勬柟娉曞瓨鏍�
		return null;
	}

}
