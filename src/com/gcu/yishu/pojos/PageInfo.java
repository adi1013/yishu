package com.gcu.yishu.pojos;
/**
 * @Description ���ڼ�¼ҳ����Ϣ
 * 
 * @author Ladi
 */
public class PageInfo {
	
	/**
	 * @Description ��������
	 */
	private int AllRowCount;

	/**
	 * @Description ÿҳ��ʾ��������
	 */
	private int PageSize;
	
	/**
	 * @Description �ܹ��ж���ҳ
	 */
	private int PageCount;
	
	/**
	 * @Description ��ǰҳ 
	 */
	private int CurrentPage=1;
	
	/**
	 * @Description ��û����һҳ
	 */
	private boolean HasPrevious;
	/**
	 * @Description ��ǰҳ������ʼ�� 
	 */
	private int BeginIndex;
	/**
	 * @Description ��û����һҳ 
	 */
	private boolean HasNext;
	/**
	 * @Description �Ƿ���ҳ 
	 */
	private boolean IsStart;
	/**
	 * @Description �Ƿ����һҳ 
	 */
	private boolean IsLast;
	
	public PageInfo(int allRowCount, int pageSize, int page) {
		
		AllRowCount = allRowCount;
		
		PageSize = pageSize;
		
		PageCount = CountAllPage(allRowCount, pageSize);
		
		setCurrentPage(page);//������ǰҳ
		
		BeginIndex=getBeginIndex();
		
		
		init();
	}

	
    /**
     * @Description ������ǰҳ
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
	 * @Decription �ж��Ƿ�����һҳ
	 * 
	 * @return true ����һҳ
	 *         false ��ǰ�ǵ�һҳ
	 */
	public boolean IsHavePrevious() {
		
		return CurrentPage>1;
	
	}
	
	/**
	 * @Description �ж��Ƿ�����һҳ
	 * 
	 * @return boolean
	 *         true ����һҳ
	 *         false ��ǰ�����һҳ
	 */
	public boolean IsHaveNext() {
		
		return CurrentPage<PageCount;
	
	}
	
	/**
	 * @Description �ж��Ƿ�Ϊ��ҳ
	 * 
	 * @return boolean
	 */
	public boolean IsitStart() {
		
		return CurrentPage==1;
		
	}
	
	/**
	 * @Description �ж��Ƿ�Ϊĩҳ
	 * 
	 * @return boolean
	 */
	public boolean IsItLast() {
		
		return CurrentPage==PageCount;
		
	}
	
	/**
	 * @Description ��ʼ��boolean HasPrevious��HasNext,IsStart,IsLast
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
	 * @Description ������ҳ��
	 * 
	 * @param AllRowCount ��������
	 * 
	 * @param PageSize ÿҳ��ʾ��
	 * 
	 * @return �ܹ�ҳ��
	 */
	public int CountAllPage(int AllRowCount , int PageSize) {
		
		return AllRowCount % PageSize == 0 ? AllRowCount / PageSize : AllRowCount / PageSize + 1;
	}
	
	/**
	 * @Description ��ȡ��ǰҳ��������
	 * 
	 * @return ��ǰҳ��������
	 */
	public int getBeginIndex() {
		if (CurrentPage<0) {
		
			return 0;
		
		}else {
			
			return PageSize*(CurrentPage-1);
		
		}
	
	}
	
	/**
	 * @Description ��ȡ��һҳ��ҳ���ǰҳ
	 * 
	 * @return ��һҳҳ��
	 */
	public int getNextPage() {
		
		if(IsItLast()) {
			return CurrentPage;
		}
		
		return CurrentPage+1;
	
	}
	
	/**
	 * @Description ��ȡ��һҳҳ��
	 * 
	 * @return ��һҳҳ���ǰҳ
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
