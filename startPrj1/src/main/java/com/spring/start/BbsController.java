package com.spring.start;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.BbsService;
import com.spring.vo.BbsVO;

@Controller
@RequestMapping("/bbs/*")
public class BbsController {

	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	@Inject
	private BbsService bsvc;
	
	@RequestMapping(value = "/write",method=RequestMethod.GET)
	public void writeGet(BbsVO bvo, Model model) throws Exception{ 
		logger.info("게시글 입력 get");
	}
	
	@RequestMapping(value = "/write",method=RequestMethod.POST)
	public String writePost(BbsVO bvo, Model model) throws Exception{ 
		logger.info("게시글 입력 post");
		logger.info(bvo.toString());
		
		bsvc.write(bvo);
		model.addAttribute("result","게시판 등록");
		
		return "/bbs/resultOk";
	}
}
