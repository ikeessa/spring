package com.spring.start;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice //컨트롤러에서 발생하는 Exception 을 전문적으로 처리하는 클래스
public class CommonExcepetionAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonExcepetionAdvice.class);
	
	/*@ExceptionHandler(Exception.class)
	public String common(Exception e) {
		logger.info(e.toString());
		
		return "err_exception";
	}*/
	
	@ExceptionHandler(Exception.class)
	private ModelAndView errMav(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/err_exception");
		mav.addObject("exception",e);
		
		return mav;
	}
}
