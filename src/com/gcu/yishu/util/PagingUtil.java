package com.gcu.yishu.util;

import java.util.List;
import java.util.Map;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.gcu.yishu.pojos.PageInfo;

/**
 * @Description 此工具包应用于对分页进行操作 
 * 
 * @author Ladi
 */
public class PagingUtil {
	
	private HibernateUtils hibernateUtils;
	
	private static HibernateUtils TrueHiberanteUtils;
	
	public HibernateUtils getHibernateUtils() {
		return hibernateUtils;
	}

	public void setHibernateUtils(HibernateUtils hibernateUtils) {
		this.hibernateUtils = hibernateUtils;
	}

	/**
	 * @Description 获取本次查询的所有索引
	 * 
	 * @param hql 自定义hql语句
	 * 
	 * @return 所有符合的索引数
	 */
	public int getAllRows(final String hql) {
		
		Session session=null;
		
		Transaction transaction=null;
		
		Query query=null;
		
		int AllRows=0;
		
		try {
			session=hibernateUtils.getSession();
			
			transaction=session.beginTransaction();
			
			query=session.createQuery(hql);
			
			AllRows = query.list().size();
			
			transaction.commit();
			
		} catch (Exception e) {
			
			if (null!=transaction) {
				transaction.rollback();
			}
			
			e.printStackTrace();
			
		}finally {
			
			if (session.isOpen()) {
				session.close();
			}
			
		}
		
		
		return AllRows;
	}

	/**
	 * @Description 查询每页的对象数据
	 * 
	 * @param PageSize 每页显示的数据
	 * @param obj 当页基本数据
	 * 
	 * @return PageResultSet<T>
	 */
	
	public <T> PageResultSet<T> getPageResult(String hql,PageInfo obj){
		
		Session session=null;
		
		Transaction transaction=null;
		
		Query query=null;
		
		PageResultSet<T> pageResultSet = new PageResultSet<T>();
		
		try {
			session=hibernateUtils.getSession();
			
			transaction=session.beginTransaction();
			
			query=session.createQuery(hql);
			
			query.setFirstResult(obj.getBeginIndex());
			
			query.setMaxResults(obj.getPageSize());
			
			List<T> list=query.list();
			
			transaction.commit();
			
			
			pageResultSet.setList(list);
			pageResultSet.setPageInfo(obj);
			
		} catch (Exception e) {
			
			if (null!=transaction) {
				transaction.rollback();
			}
			
			e.printStackTrace();
			
		}finally {
			
			if (session.isOpen()) {
				session.close();
			}
			
		}
	    return pageResultSet;
	}
}
