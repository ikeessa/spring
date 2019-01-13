package com.spring.dao;

import java.util.List;

import com.spring.vo.BbsVO;

public interface BbsDAO {
	public void insert(BbsVO bvo) throws Exception;
	
	public BbsVO read(Integer bid) throws Exception;
	
	public void update(BbsVO bvo) throws Exception;
	
	public void delete(Integer bid) throws Exception;
	
	public List<BbsVO> list(Integer bcount) throws Exception;
	
	public int readAll() throws Exception;
}
