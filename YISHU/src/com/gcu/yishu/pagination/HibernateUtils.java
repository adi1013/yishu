package com.gcu.yishu.pagination;

/**
 * @Description 操作Hibernate session域的工具包
 * 
 * @author Ladi
 * 
 * @return 解决继承hibernateDaoSupport所带来的强耦合性问题
 */

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.stereotype.Component;

@Component
public class HibernateUtils {
	
	public HibernateUtils() {}
	/**
	 * @Description 用于接收spring对sessionFactory的注入
	 */
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * @Description 用于处理线程间的数据隔离
	 */
	private static final ThreadLocal<Session> LocalSession 
	                     = new ThreadLocal<Session>();
	
	/**
	 * @Description  注入sessionFactory
	 * 
	 * @param sessionFactory 对应的bean注入对象
	 * 
	 * @return null
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * @Description 获取session对象
	 * 
	 * @return session
	 *  
	 */
	public Session getSession() throws HibernateException{
		
		Session session = LocalSession.get();
		System.out.println(sessionFactory);
		if (session == null || !session.isOpen()) {
			
			System.err.println("------------start creating session-----------");
			session=sessionFactory==null?null:sessionFactory.openSession();
			
			LocalSession.set(session);
			
		}
		
		System.out.println("------------ending create session-----------");
		return session;		
	}
	

	/**
	 * @Description 关闭session并清除LocalSession中的副本
	 * 
	 * @return void
	 *  
	 */
	public void closeSession() throws HibernateException{
		
		Session session = LocalSession.get();
		
		LocalSession.set(null);
		
		if (session!=null) {
			
			session.close();
			
		}
		
	}
	
	
}
