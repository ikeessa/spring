package com.spring.service;

import com.spring.dao.SeatDAO;
import com.spring.dao.StudentDAO;
import com.spring.vo.BbsVO;
import com.spring.vo.SeatVO;
import com.spring.vo.StudentVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class StudentService {

    @Inject
    private StudentDAO studentDAO;

    public void write(StudentVO studentVO) throws Exception {
        studentDAO.insert(studentVO);
    }

    public BbsVO read(Integer bid) throws Exception {
        return studentDAO.read(bid);
    }

    public void modify(StudentVO studentVO) throws Exception {
        studentDAO.update(studentVO);
    }

    public void remove(Integer bid) throws Exception {
        studentDAO.delete(bid);
    }

    public List<BbsVO> list(Integer bcount) throws Exception {
        return studentDAO.list(bcount);
    }
}
