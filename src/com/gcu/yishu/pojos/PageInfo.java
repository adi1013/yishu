package com.gcu.yishu.pojos;
/**
 * @Description 用于记录页面信息
 * 
 * @author Ladi
 */
public class PageInfo {
	
	/**
	 * @Description 总索引数
	 */
	private int AllRowCount;

	/**
	 * @Description 每页显示的索引数
	 */
	private int PageSize;
	
	/**
	 * @Description 总共有多少页
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
	 * @Description 当前页索引开始处 
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
	
	public PageInfo(int allRowCount, int pageSize, int page) {
		
		AllRowCount = allRowCount;
		
		PageSize = pageSize;
		
		PageCount = CountAllPage(allRowCount, pageSize);
		
		setCurrentPage(page);//修正当前页
		
		BeginIndex=getBeginIndex();
		
		
		init();
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
	public boolean IsitStart() {
		
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
		IsStart=IsitStart();
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
		
		return AllRowCount % PageSize == 0 ? AllRowCount / PageSize : AllRowCount / PageSize + 1;
	}
	
	/**
	 * @Description 获取当前页的首索引
	 * 
	 * @return 当前页的首索引
	 */
	public int getBeginIndex() {
		if (CurrentPage<0) {
		
			return 0;
		
		}else {
			
			return PageSize*(CurrentPage-1);
		
		}
	
	}
	
	/**
	 * @Description 获取下一页的页码或当前页
	 * 
	 * @return 下一页页码
	 */
	public int getNextPage() {
		
		if(IsItLast()) {
			return CurrentPage;
		}
		
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
