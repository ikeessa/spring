package com.spring.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingMaker {
	private int totalData;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int PageNum = 10;
	
	private PageCriteria pageCri;
	
	public void setpageCria(PageCriteria pageCri) {
		this.pageCri = pageCri; 
	}
	
	public void setTotalData(int totalData) {
		this.totalData = totalData;
	}
	
	public void getPagingData() {
		endPage = (int) (Math.ceil(pageCri.getPage()/(double)PageNum)*PageNum);
		
		startPage = (endPage - PageNum)+1;
		
		int finalEndPage = (int) (Math.ceil(totalData/(double)pageCri.getNumperPage()));
		
		if(endPage > finalEndPage) {
			endPage = finalEndPage;
		}
	
	prev = startPage ==1? false : true;
	next = endPage * pageCri.getNumperPage() >= totalData ? false : true;
	}
	
	public String makeURI(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("numPerPage", pageCri.getNumperPage())
				.build();
		
		return uriComponents.toUriString();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPageNum() {
		return PageNum;
	}

	public void setPageNum(int pageNum) {
		PageNum = pageNum;
	}

	public PageCriteria getPageCri() {
		return pageCri;
	}

	public void setPageCri(PageCriteria pageCri) {
		this.pageCri = pageCri;
	}

	public int getTotalData() {
		return totalData;
	}
}
