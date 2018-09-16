package com.gcu.yishu.util;
/**
 * @Description ����Hibernate session��Ĺ��߰�
 * 
 * @author Ladi
 * 
 * @return ����̳�hibernateDaoSupport��������ǿ���������
 */

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HibernateUtils {

	
	public HibernateUtils() {}


	/**
	 * @Description ���ڽ���spring��sessionFactory��ע��
	 */
	@Resource
	private SessionFactory sessionFactory;
	

	/**
	 * @Description ���ڴ����̼߳�����ݸ���
	 */
	private static final ThreadLocal<Session> LocalSession 
	                     = new ThreadLocal<Session>();

	
	/**
	 * @Description  ע��sessionFactory
	 * 
	 * @param sessionFactory ��Ӧ��beanע�����
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
	 * @Description ��ȡsession����
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
	 * @Description �ر�session�����LocalSession�еĸ���
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
