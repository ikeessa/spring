package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;

@Repository //DAO를 스프링에 인식하겟다.
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String getTime() {
		return sqlSession.selectOne("getTime");
		//return sqlSession.selectOne(namespace+".getTime");
	}

	@Override
	public void insertMember(MemberVO mvo) {
		sqlSession.insert("insertMember",mvo);
		//sqlSession.selectOne(namespace+".insertMember",mvo);
	}
}
