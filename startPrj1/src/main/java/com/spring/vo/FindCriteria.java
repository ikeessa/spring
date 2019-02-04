package com.spring.vo;

public class FindCriteria extends PageCriteria { //page, numberPage 값 유지하기 위함
	private String findType;
	private String keyword;
	
	public String getFindType() {
		return findType;
	}
	public void setFindType(String findType) {
		this.findType = findType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return super.toString()+"type:"+getFindType()+", keyword"+getKeyword();
	}
}
