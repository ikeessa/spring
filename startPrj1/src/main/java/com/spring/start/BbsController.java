package com.spring.start;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.BbsService;
import com.spring.vo.BbsVO;
import com.spring.vo.FindCriteria;
import com.spring.vo.Page;
import com.spring.vo.PageCriteria;
import com.spring.vo.PagingMaker;

@Controller
@RequestMapping("/bbs/*")
public class BbsController {

	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);

	@Inject
	private BbsService bsvc;
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGet(@RequestParam("fCri") FindCriteria fCri) throws Exception {
		logger.info("게시글 입력 get");
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePost(BbsVO bvo, RedirectAttributes reAttr) throws Exception {
		logger.info("게시글 입력 post");
		logger.info(bvo.toString());

		bsvc.write(bvo);
		reAttr.addFlashAttribute("result", "Success");

		// return "/bbs/resultOk";
		return "redirect:/bbs/pageList";
	}

	@RequestMapping("list")
	public void list(Model model) throws Exception {
		logger.info("게시판 목록");

		Page page = new Page();
		logger.info("1");
		double pageCount = 0;
		int listView = 0;
		logger.info("2");
		page.setListCount(10);
		page.setPageSize(5);
		logger.info("3");
		// page.setTotalPage(bsvc.totalPage());
		//logger.info(page.getTotalPage());
		System.out.println(page.getTotalPage());
		logger.info("4");
		pageCount = Math.ceil((double) page.getTotalPage() / page.getListCount());
		logger.info("5");
		listView = (page.getTotalPage() / page.getListCount()) * 10 + (page.getTotalPage() % page.getListCount());

		// paging.setTotalCount(totalCount);
		logger.info("전체 페이지 수 : " + page.getTotalPage());
		model.addAttribute("list", bsvc.list(listView));
	}

	@RequestMapping("read")
	public void read(@RequestParam("bid") int bid, Model model) throws Exception {
		logger.info("게시판 read");
		model.addAttribute("bbsVO", bsvc.read(bid));
	}

	@RequestMapping("modify")
	public void modify(BbsVO bbsVO) throws Exception {
		logger.info("게시판 modify");
	}

	@RequestMapping("modifyOk")
	public String modifyOk(BbsVO bbsVO) throws Exception {
		logger.info("게시판 modifyOk");
		logger.info(bbsVO.toString());
		bsvc.modify(bbsVO);
		return "redirect:/bbs/pageList";
	}

	@RequestMapping("remove")
	public String remove(@RequestParam("bid") int bid, Model model) throws Exception {
		logger.info("게시판 delete");
		bsvc.remove(bid);
		return "redirect:/bbs/pageList";
	}

	/*
	 * @RequestMapping(value = "list", method = RequestMethod.GET) public
	 * ModelAndView list(Sample sample) throws Exception { try { // (Before)
	 * Doing...
	 * 
	 * Paging paging = new Paging(); paging.setPageNo(1); paging.setPageSize(10);
	 * paging.setTotalCount(totalCount);
	 * 
	 * // (After) Doing... } catch (Exception e) { throw e; } }
	 */
	
	@RequestMapping("/pageList")
	public void pageList(PageCriteria pageCri, Model model) throws Exception {
		logger.info("게시판 Criteria");
		model.addAttribute("list", bsvc.listCriteria(pageCri));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setpageCria(pageCri);
		pagingMaker.setTotalData(bsvc.totalPage());
		pagingMaker.getPagingData();
		
		System.out.println("전체페이지 수  db 연동:"+bsvc.totalPage());
		System.out.println("전체페이지 수 :"+pagingMaker.getTotalData());
		System.out.println("start페이지 :"+pagingMaker.getStartPage());
		System.out.println("end페이지 :"+pagingMaker.getEndPage());
		model.addAttribute("pagingMaker", pagingMaker);
	}

}
