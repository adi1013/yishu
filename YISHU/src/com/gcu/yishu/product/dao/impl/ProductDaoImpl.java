package com.gcu.yishu.product.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.persistence.FlushModeType;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gcu.yishu.product.dao.ProductDao;
import com.gcu.yishu.product.pojos.Product;

public class ProductDaoImpl extends /*BaseDaoImpl<Product> HibernateUtils*/ HibernateDaoSupport implements ProductDao {
	Session session;
	Class<Product> clazz;
//	Transaction trans=session.beginTransaction();
   // 保存
	@Override
	public void save(Product entity) {
		System.out.println("save T entity: "+entity.toString());
		
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		
		session.setFlushMode(FlushModeType.AUTO);
		
		session.save(entity);
		
		session.close();
//		this.getHibernateTemplate().save(entity);
//		this.getHibernateTemplate().flush();
		System.out.println("已保存");		
	}
		
	//编辑的时候更新
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW )
	public void update(Product entity) {
//		this.getHibernateTemplate().update(entity);
        System.out.println("update T entity: "+entity.toString());		
		
        session=this.getHibernateTemplate().getSessionFactory().openSession();
		
        session.setFlushMode(FlushModeType.AUTO);
		
        Transaction ts=session.beginTransaction();
		
        session.update(entity);
		
        ts.commit();
		
        session.close();
//		this.closeSession();	
		System.out.println("已更新");	
	}
	//查询列表
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Product> findObjects() {
		System.out.println("clazz ---> " + clazz);
		
		Query query = session.createQuery("FROM "+clazz.getSimpleName());//select * from clazz
		
		List<Product> product=(List<Product>)query.list();
		
		return product;
//		return this.getHibernateTemplate().find("from Product");
	}

	//查询总记录数
	@SuppressWarnings("unchecked")
	@Override
	//这里没带参数的默认查询全部
	public int findCount() {
		String sql="select count(*) from Product";//查询全部
 /*根据外键查询总记录数*/String sql2="select count(*) from Product where User.ID='1' ";
		
		session=this.getHibernateTemplate().getSessionFactory().openSession();
				
		session.setFlushMode(FlushModeType.AUTO);
				
		List<Product> list = session.createQuery(sql).list();
				
		session.close();
	
		//从list中把值取出
		if(list.size()!=0 && list!=null){
			Object obj = list.get(0);
			//变成int型
			Long lobj =(Long) obj;
			int count = lobj.intValue();
			System.out.println("count: "+count);
			return count;
		}
		return 0;
	}
	@SuppressWarnings("unchecked")
	//重载
	public int findCount(String sql) {
		//String sql="select count(*) from Product";//查询全部
        /*根据外键查询总记录数*/
		String sql2="select count(*) from Product where User.ID='1' ";
		
		session=this.getHibernateTemplate().getSessionFactory().openSession();
				
		session.setFlushMode(FlushModeType.AUTO);
				
		List<Product> list = session.createQuery(sql).list();
				
		session.close();
	
		//从list中把值取出
		if(list.size()!=0 && list!=null){
			Object obj = list.get(0);
			//变成int型
			Long lobj =(Long) obj;
			int count = lobj.intValue();
			System.out.println("count: "+count);
			return count;
		}
		return 0;
	}
	 //每页记录list集合
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findPage(int beginIndex, int pageSize) {
		//创建离线对象，设置对实体类进行操作
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);//Product.class
		/*设定查询条件，则要使用add()方法加入Restrictions的条件限制*/
        /*限制查询的条件，到时改成参数传入*/
//		criteria.add(Restrictions.eq("Pro_id", 1));//eq--“=”  参数（属性名，查询条件的值）
		System.out.println("ProductDaoImpl findPage forClass Test: "+Product.class);
		List<Product> list =(List<Product>)this.getHibernateTemplate().findByCriteria(criteria, beginIndex, pageSize);//绂荤嚎瀵硅薄锛屽紑濮嬩綅缃紝姣忛〉璁板綍鏁�		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	//QBC
//	public List<Product> findPage(int beginIndex, int pageSize,String condition,String value) {
//		//创建离线对象，设置对实体类进行操作
//		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);//Product.class
//		/*设定查询条件，则要使用add()方法加入Restrictions的条件限制*/
//        /*限制查询的条件，到时改成参数传入*/
//		criteria.add(Restrictions.eq(condition,value));//eq--“=”  参数（属性名，查询条件的值）
//		System.out.println("ProductDaoImpl findPage forClass Test: "+Product.class);
//		List<Product> list =(List<Product>)this.getHibernateTemplate().findByCriteria(criteria, beginIndex, pageSize);//绂荤嚎瀵硅薄锛屽紑濮嬩綅缃紝姣忛〉璁板綍鏁�		
//		return list;
//	}
	//重载用来条件查询  
	public List<Product> findPage(int beginIndex, int pageSize,String condition,String value) {
        String hql = "from Product p where "+"p."+ condition + "=" + value;
        //拼装查询条件
        String hql2 = "from Product  where Pro_author like '%莫%' or Pro_name like '%莫%'or Pro_press like '%%' or Pro_price like '%%'";
//      hql+=" order by PRO_PRICE desc";//升序
//      hql+=" order by PRO_PRICE ASC";//降序
        Session session = this.getHibernateTemplate().getSessionFactory().openSession();
        Query query = session.createQuery(hql);
        query.setFirstResult(beginIndex);
        query.setMaxResults(pageSize);
        List<Product> list = query.list();
       
        return list;
    }
	/*11.6*/
	//模糊查询
	public List<Product> findPage(int beginIndex, int pageSize,String condition) {
   
        String hql = "from Product  where Pro_author like '%"+condition+"%' or Pro_name like '%"+condition+"%'or Pro_press like '%"+condition+"%' or Pro_price like '%"+condition+"%'";

        Session session = this.getHibernateTemplate().getSessionFactory().openSession();
        Query query = session.createQuery(hql);
        query.setFirstResult(beginIndex);
        query.setMaxResults(pageSize);
        List<Product> list = query.list();
       
        return list;
    }
	
	
	//根据id查找对象
	@Override
	public Product findObjectById(Serializable id) {
		session=this.getHibernateTemplate().getSessionFactory().openSession();
		session.setFlushMode(FlushModeType.AUTO);
		//get(Class entityClass, Serializable id)//根据主键加载特定持久化类的实例
		Product p = session.get(Product.class,id);
		session.close();
		return p;
	}
//  //删除
//	@Override
//	public void delete(Serializable id) {

//	}	
}
