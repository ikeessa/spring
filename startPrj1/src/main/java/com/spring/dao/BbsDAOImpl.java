package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.BbsVO;
import com.spring.vo.PageCriteria;

@Repository
public class BbsDAOImpl implements BbsDAO {
	
	@Inject
	private SqlSession sqlSession; //db 연동

	@Override
	public void insert(BbsVO bvo) throws Exception {
		sqlSession.insert("insert",bvo);
	}

	@Override
	public BbsVO read(Integer bid) throws Exception {
		return sqlSession.selectOne("read", bid);
	}

	@Override
	public void update(BbsVO bvo) throws Exception {
		sqlSession.update("update", bvo);
	}

	@Override
	public void delete(Integer bid) throws Exception {
		sqlSession.delete("delete", bid);
	}

	@Override
	public List<BbsVO> list(Integer bcount) throws Exception {
		return sqlSession.selectList("list");
	}
	
	@Override
	public int readAll() throws Exception {
		return sqlSession.selectOne("readAll");
	}
	
	/*@Override
	public List<BbsVO> listPage(int page) throws Exception {
		if(page <=0){
			page=1;
		}
		
		page = (page-1) * 10;
		
		return sqlSession.selectList("listPage",page);
	}*/
	
	@Override
	public List<BbsVO> listCriteria(PageCriteria pageCri) throws Exception {
		return sqlSession.selectList("listCriteria",pageCri);
	}
}
