package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.BbsDAO;
import com.spring.vo.BbsVO;

@Service
public class BbsServiceImpl implements BbsService {
	
	@Inject
	private BbsDAO bdao;
	
	@Override
	public void write(BbsVO bvo) throws Exception {
		bdao.insert(bvo);
	}

	@Override
	public BbsVO read(Integer bid) throws Exception {
		return bdao.read(bid);
	}

	@Override
	public void modify(BbsVO bvo) throws Exception {
		bdao.update(bvo);
	}

	@Override
	public void remove(Integer bid) throws Exception {
		bdao.delete(bid);
	}

	@Override
	public List<BbsVO> list(Integer bcount) throws Exception {
		return bdao.list(bcount);
	}
	
	@Override
	public int totalPage() throws Exception {
		return bdao.readAll();
	}

}
