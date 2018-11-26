package com.gcu.yishu.product.dao;

import java.util.List;

import com.gcu.yishu.product.pojos.Product;

public interface ProductDao extends BaseDao<Product> {
	
    //增删改查都有了，不用加
	
	//用来查记录总数
	int findCount();
	//重载findCount
	int findCount(String sql);
    //每页记录list集合
	List<Product> findPage(int beginIndex, int pageSize);
	//重载条件查询
	List<Product> findPage(int beginIndex, int pageSize,String condition,String value);
	//模糊查询
	List<Product> findPage(int beginIndex, int pageSize,String condition);
}
