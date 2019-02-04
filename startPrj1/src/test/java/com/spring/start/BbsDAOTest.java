package com.spring.start;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.spring.dao.BbsDAO;
import com.spring.vo.BbsVO;
import com.spring.vo.PageCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BbsDAOTest {
	
	@Inject 
	private BbsDAO bdao;
	
	private static Logger logger = LoggerFactory.getLogger(BbsDAOTest.class);
	
	/*@Test
	public void insertTest() throws Exception{
		BbsVO bvo = new BbsVO();
		bvo.setSubject("test 제목1");
		bvo.setContent("test 내용1");
		bvo.setWriter("test 작성자1");
		
		bdao.insert(bvo);
	}
	
	@Test
	public void readTest() throws Exception{
		logger.info(bdao.read(1).toString());
	}
	
	@Test
	public void updateTest() throws Exception{
		BbsVO bvo = new BbsVO();
		bvo.setBid(1);
		bvo.setSubject("test 제목 수정");
		bvo.setContent("test 내용 수정");
		bvo.setWriter("test 작성자 수정");
		bdao.update(bvo);
	}
	
	@Test
	public void deleteTest() throws Exception{
		bdao.delete(4);
	}
	
	@Test
	public void listTest() throws Exception{
		logger.info(bdao.list().toString());
	}
	
	@Test
	public void PageCriteriaTest() throws Exception{
		PageCriteria pageCri = new PageCriteria();
		pageCri.setPage(3);
		pageCri.setNumperPage(15);
		System.out.println(pageCri.toString());
		System.out.println(bdao.listCriteria(pageCri));
		}
	
	@Test
	public void uriTest() throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/bbs/read")
				.queryParam("bid", 100)
				.queryParam("numPerPage", 20)
				.build();
		
		logger.info("/bbs/read?bid=100&numPerPage=20");
		logger.info(uriComponents.toString());
	}
	*/
}
