package com.spring.vo;

public class PageCriteria {
	
	private int page;
	private int numPerPage;
	
	public PageCriteria() {
		this.page =2;
		this.numPerPage =10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
			return;
		}
		this.page = page;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		if(numPerPage <=0) {
			this.numPerPage =10;
			return;
		}
		this.numPerPage = numPerPage;
	}
	
	public int getStartPage() {
		return (this.page-1)*numPerPage;
	}
	
	@Override
	public String toString() {
		return "PageCriteria [page="+page+",numPerPage="+numPerPage+"]";
	}
}
