package com.spring.dao;

import com.spring.vo.MemberVO;

public interface MemberDAO {
	
	public String getTime();
	
	public void insertMember(MemberVO mvo);

}
