package com.gcu.yishu.pagination;

import com.gcu.yishu.product.pojos.Product;

/**
 * @Description 用于记录页面信息
 * 
 * @author Ladi
 */
/*分页中的一些属性*/
public class PageInfo extends PageResultSet<Product> {
	
	/**
	 * @Description 总索引数（总记录数）
	 */
	private int AllRowCount;

	/**
	 * @Description 每页显示的索引数
	 */
	private int PageSize;
	
	/**
	 * @Description 总页数
	 */
	private int PageCount;
	
	/**
	 * @Description 当前页 
	 */
	private int CurrentPage=1;
	
	/**
	 * @Description 有没有上一页
	 */
	private boolean HasPrevious;
	/**
	 * @Description 当前页索引开始处 ，开始位置
	 */
	private int BeginIndex;
	/**
	 * @Description 有没有下一页 
	 */
	private boolean HasNext;
	/**
	 * @Description 是否首页 
	 */
	private boolean IsStart;
	/**
	 * @Description 是否最后一页 
	 */
	private boolean IsLast;
	
	public PageInfo(){
		
	}
	public PageInfo(int allRowCount, int pageSize, int page) {
		
		AllRowCount = allRowCount;//总索引数
		System.out.println("AllRowCount: "+AllRowCount);
		
		PageSize = pageSize;//每页显示的索引数
		
		PageCount = CountAllPage(allRowCount, pageSize);//总页数
		
		setCurrentPage(page);//修正当前页
		
		BeginIndex=getBeginIndex();//当前页索引开始处 
		
		init();//初始化boolean HasPrevious，HasNext,IsStart,IsLast，具体在140
	}

	
    
	/**
     * @Description 修正当前页
     * 
     */      
	public void setCurrentPage(int page) {
		
		if (page>=PageCount) {
			
			CurrentPage=PageCount;
		
		} else if(page<=1){
			
			CurrentPage = 1;
		
		} else {
			
			CurrentPage = page;
		
		}
	}

	/**
	 * @Decription 判断是否有上一页
	 * 
	 * @return true 有上一页
	 *         false 当前是第一页
	 */
	public boolean IsHavePrevious() {
		
		return CurrentPage>1;
	
	}
	
	/**
	 * @Description 判断是否有下一页
	 * 
	 * @return boolean
	 *         true 有下一页
	 *         false 当前是最后一页
	 */
	public boolean IsHaveNext() {
		
		return CurrentPage<PageCount;
	
	}
	
	/**
	 * @Description 判断是否为首页
	 * 
	 * @return boolean
	 */
	public boolean IsItStart() {
		
		return CurrentPage==1;
		
	}
	
	/**
	 * @Description 判断是否为末页
	 * 
	 * @return boolean
	 */
	public boolean IsItLast() {
		
		return CurrentPage==PageCount;
		
	}
	
	/**
	 * @Description 初始化boolean HasPrevious，HasNext,IsStart,IsLast
	 * 
	 * @return
	 */
	public void init() {
		HasPrevious=IsHavePrevious();
		HasNext=IsHaveNext();
		IsStart=IsItStart();
		IsLast=IsItLast();
	}
	/**
	 * @Description 计算总页数
	 * 
	 * @param AllRowCount 总索引数
	 * 
	 * @param PageSize 每页显示数
	 * 
	 * @return 总共页数
	 */
	public int CountAllPage(int AllRowCount , int PageSize) {
		//总记录数%每页记录数，向上取整
		return AllRowCount % PageSize == 0 ? AllRowCount / PageSize : AllRowCount / PageSize + 1;
	}
	
	/**
	 * @Description 获取当前页的首索引
	 * 
	 * @return 当前页的首索引
	 */
	//用来设置开始位置
	public int getBeginIndex() {
		
		if (CurrentPage<0) {
		
			return 0;
		
		}else {
			//当前页不为0，返回每页索引数*（当前页数-1）
			return PageSize*(CurrentPage-1);
		
		}
	
	}
	/* 当前页        开始位置          每页记录数
	 *  1       0        3
	 *  2       3        3
	 *  3       6        3 
	 * */
	
	/**
	 * @Description 获取下一页的页码或当前页
	 * 
	 * @return 下一页页码
	 */
	public int getNextPage() {
		
		if(IsItLast()) {
			return CurrentPage;
		}
		//当前页+1
		return CurrentPage+1;
	
	}
	
	/**
	 * @Description 获取上一页页码
	 * 
	 * @return 上一页页码或当前页
	 */
	public int getPreviousPage() {
		
		if (IsStart) {
			return CurrentPage;
		}
		
		return CurrentPage-1;
	}


	public int getAllRowCount() {
		return AllRowCount;
	}
	public void setAllRowCount(int allRowCount) {
		AllRowCount = allRowCount;
	}


	public int getPageSize() {
		return PageSize;
	}


	public int getPageCount() {
		return PageCount;
	}


	public int getCurrentPage() {
		return CurrentPage;
	}


	@Override
	public String toString() {
		return "PageInfo [AllRowCount=" + AllRowCount + ", PageSize=" + PageSize + ", PageCount=" + PageCount
				+ ", CurrentPage=" + CurrentPage + ", HasPrevious=" + HasPrevious + ", BeginIndex=" + BeginIndex
				+ ", HasNext=" + HasNext + ", IsStart=" + IsStart + ", IsLast=" + IsLast + "]";
	}
	
	
}
