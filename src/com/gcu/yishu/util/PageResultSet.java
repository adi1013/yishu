package com.gcu.yishu.util;

import java.util.List;

import com.gcu.yishu.pojos.PageInfo;

/**
 * @Description 分页数据容器
 * @Description 泛型类
 * 
 * @author Ladi
 */

public class PageResultSet<T> {
	
	public List<T> list;
	
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
