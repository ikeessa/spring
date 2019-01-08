package com.spring.start;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*.xml")
public class MybatisTest {
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testSqlFactory() {
		System.out.println(sqlFactory);
	}
	
	@Test
	public void sessionTest() throws Exception {
		try (SqlSession sqlSessionTemplate = sqlFactory.openSession()){
			System.out.println(sqlSessionTemplate);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
