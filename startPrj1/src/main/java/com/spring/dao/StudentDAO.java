package com.spring.dao;

import com.spring.vo.BbsVO;
import com.spring.vo.StudentVO;
import org.apache.ibatis.session.SqlSession;

import javax.inject.Inject;
import java.util.List;

public class StudentDAO {
    @Inject
    private SqlSession sqlSession; //db 연동

    public void insert(StudentVO studentVO) throws Exception {
        sqlSession.insert("insert",studentVO);
    }

    public BbsVO read(Integer bid) throws Exception {
        return sqlSession.selectOne("read", bid);
    }

    public void update(StudentVO studentVO) throws Exception {
        sqlSession.update("update", studentVO);
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
