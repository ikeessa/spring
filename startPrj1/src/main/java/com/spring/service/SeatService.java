package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import com.spring.dao.SeatDAO;
import com.spring.vo.SeatVO;
import org.springframework.stereotype.Service;
import com.spring.vo.BbsVO;

@Service
public class SeatService {

    @Inject
    private SeatDAO seatDAO;

    public void write(SeatVO seatVO) throws Exception {
        seatDAO.insert(seatVO);
    }

    public BbsVO read(Integer bid) throws Exception {
        return seatDAO.read(bid);
    }

    public void modify(SeatVO seatVO) throws Exception {
        seatDAO.update(seatVO);
    }

    public void remove(Integer bid) throws Exception {
        seatDAO.delete(bid);
    }

    public List<BbsVO> list(Integer bcount) throws Exception {
        return seatDAO.list(bcount);
    }
}
