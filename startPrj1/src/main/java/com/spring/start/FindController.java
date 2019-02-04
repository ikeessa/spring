package com.spring.start;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.service.BbsService;
import com.spring.vo.FindCriteria;
import com.spring.vo.PagingMaker;

@Controller
public class FindController {
	private static final Logger logger = LoggerFactory.getLogger(FindController.class);
	
	@Inject
	private BbsService bsvc;
	
	@RequestMapping("pageList")
	public void list(@ModelAttribute("fCri") FindCriteria fCri, Model model) throws Exception{
		logger.info(fCri.toString());
		
		model.addAttribute("list",bsvc.listCriteria(fCri));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setPageCri(fCri);
		
		pagingMaker.setTotalData(bsvc.totalPage());
		
		model.addAttribute("pagingMaker", pagingMaker);
	}
}
