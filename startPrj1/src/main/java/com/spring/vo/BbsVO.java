package com.spring.vo;

import java.util.Date;

public class BbsVO {
	private Integer bid;
	private String subject;
	private String content;
	private String writer;
	private Date regdate;
	private int hit;
	
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "BbsVO [bid=" + bid + ", subject=" + subject + ", content="
				+ content + ", writer=" + writer + ", regdate=" + regdate
				+ ", hit=" + hit + "]";
	}
}
