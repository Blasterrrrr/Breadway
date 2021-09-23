package com.musical.breadway.controller.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.FaqDTO;
import com.musical.breadway.mapper.manager.Manager_FaqMapper;

//FAQ(자주묻는질문 정해진 질문 등등)
/* 키워드 검색
 * FAQ 작성
 * FAQ 수정
 * FAQ 삭제
 * FAQ 상세보기
*/
@Controller
public class Manager_FaqController {
	
	@Autowired
	Manager_FaqMapper faqMapper;
	
	
	@RequestMapping("/managerfaq_main.do")//FAQ 리스트 떠야함
	public ModelAndView main(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		
		int rowCount = faqMapper.ManagerfaqgetCount();
		int pageBlock = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageSize = 10;
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		if(endRow > rowCount) {
			endRow = rowCount;
		}
		
		List<FaqDTO> faq_list = faqMapper.ManagerlistFAQ(startRow, endRow);
		
		mav.addObject("rowCount", rowCount);
		mav.addObject("pageBlock", pageBlock);
		mav.addObject("currentPage", currentPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageSize", pageSize);
		mav.addObject("pageCount", pageCount);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("faq_list", faq_list);
		
		mav.setViewName("manager/FAQ/faq_main");
		
		return mav;
	}

	@RequestMapping("/managerfaq_input.do")
	public ModelAndView input(HttpServletRequest req) {
		ModelAndView mav= new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		mav.setViewName("manager/FAQ/faq_input");
		return mav;
	}
	
	@RequestMapping("/managerfaq_inputok.do")
	public ModelAndView inputok(HttpServletRequest req,FaqDTO dto) {
		ModelAndView mav= new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		int res = faqMapper.ManagerinsertFAQ(dto);
		mav.setViewName("redirect:managerfaq_main.do");
		return mav;
	}
	
	
	@RequestMapping("/managerfaq_content.do")
	public ModelAndView content(HttpServletRequest req, @RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		FaqDTO dto = faqMapper.ManagergetFAQ(num);
		mav.setViewName("manager/FAQ/faq_content");
		mav.addObject("getFAQ", dto);
		return mav;
	}
	
	@RequestMapping("/managerfaq_keyword.do")
	public ModelAndView byKeyword(HttpServletRequest req, FaqDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String keyword = req.getParameter("keyword");	
		List<FaqDTO> keyword_list = faqMapper.ManagerselectByKeyword(keyword);
		mav.setViewName("manager/FAQ/faq_keyword");
		mav.addObject("keyword", keyword);
		mav.addObject("keyword_list", keyword_list);
		return mav;
	}
	
	@RequestMapping("/managerfaq_delete.do")
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String num = req.getParameter("num");
		String msg = "FAQ가 정상적으로 삭제 되었습니다";
		String url = "managerfaq_main.do";
		int res = faqMapper.ManagerdeleteFAQ(Integer.parseInt(num));
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/managerfaq_update.do")
	public ModelAndView update(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String num = req.getParameter("num");
		FaqDTO dto = faqMapper.ManagergetFAQ(Integer.parseInt(num));
		mav.setViewName("manager/FAQ/faq_update");
		mav.addObject("getFaq",dto);
		return mav;
	}
	
	@RequestMapping("/managerfaq_updateok.do")
	public ModelAndView updateok(HttpServletRequest req,FaqDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		int res = faqMapper.ManagerupdateFAQ(dto);
		String msg = "FAQ가 정상적으로 수정 되었습니다";
		String url = "managerfaq_main.do";
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
}
