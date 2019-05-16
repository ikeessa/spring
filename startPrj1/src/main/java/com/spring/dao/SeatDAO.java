package com.spring.dao;


import com.spring.vo.BbsVO;
import com.spring.vo.FindCriteria;
import com.spring.vo.PageCriteria;
import com.spring.vo.SeatVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class SeatDAO {

        @Inject
        private SqlSession sqlSession; //db 연동

        public void insert(SeatVO seatVO) throws Exception {
            sqlSession.insert("insert",seatVO);
        }

        public BbsVO read(Integer bid) throws Exception {
            return sqlSession.selectOne("read", bid);
        }

        public void update(SeatVO seatVO) throws Exception {
            sqlSession.update("update", seatVO);
        }

        public void delete(Integer bid) throws Exception {
            sqlSession.delete("delete", bid);
        }

        public List<BbsVO> list(Integer bcount) throws Exception {
            return sqlSession.selectList("list");
        }

        public int readAll() throws Exception {
            return sqlSession.selectOne("readAll");
        }
}
