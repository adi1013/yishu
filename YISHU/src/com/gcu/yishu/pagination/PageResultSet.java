package com.gcu.yishu.pagination;

import java.util.List;

import com.gcu.yishu.pagination.PageInfo;

/**
 * @Description 分页数据容器
 * @Description 泛型类
 * 
 * @author Ladi
 */

public class PageResultSet<T> {
	//每页记录的list集合?通过查询得到
	public List<T> list;//public List<Product> list
	
	public PageInfo pageInfo;

	public List<T> getList() {
		
		return list;
	
	}

	public void setList(List<T> list) {
		
		this.list = list;
	
	}

	public PageInfo getPageInfo() {
		
		return pageInfo;
	
	}

	public void setPageInfo(PageInfo pageInfo) {
		
		this.pageInfo = pageInfo;
	
	}
	
	

}
