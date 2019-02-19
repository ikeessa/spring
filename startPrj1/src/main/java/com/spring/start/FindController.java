package com.spring.start;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.service.BbsService;
import com.spring.vo.FindCriteria;
import com.spring.vo.PagingMaker;

@Controller
@RequestMapping("fbbs")
public class FindController {
	private static final Logger logger = LoggerFactory.getLogger(FindController.class);
	
	@Inject
	private BbsService bsvc;
	
	@RequestMapping("pageList")
	public void list(FindCriteria fCri, Model model) throws Exception{
		logger.info(fCri.toString());
		
		model.addAttribute("list",bsvc.listFind(fCri));
		
		PagingMaker pagingMaker = new PagingMaker();
		//PageCriteria pCri = new PageCriteria();
		
		pagingMaker.setPageCri(fCri);
		
		pagingMaker.setTotalData(bsvc.findCountData(fCri));
		pagingMaker.getPagingData();
		
		model.addAttribute("pagingMaker", pagingMaker);
		//model.addAttribute("pCri", pCri);
	}
}
