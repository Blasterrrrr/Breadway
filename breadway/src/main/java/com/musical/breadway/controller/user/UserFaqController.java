package com.musical.breadway.controller.user;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.FaqDTO;
import com.musical.breadway.dto.InquiryDTO;
import com.musical.breadway.mapper.user.UserFaqMapper;

//FAQ(자주묻는질문 정해진 질문 등등)
/* 키워드 검색
 * FAQ 작성
 * FAQ 수정
 * FAQ 삭제
 * FAQ 상세보기
*/
@Controller
public class UserFaqController {
	
	@Autowired
	UserFaqMapper userFaqMapper;
	
	@RequestMapping("faq_keywordList.do")
	public String faq_keywordList(HttpServletRequest req) throws UnsupportedEncodingException {
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		
		List<FaqDTO> list = userFaqMapper.faqKeywordList(keyword);
		req.setAttribute("keywordList", list);
		req.setAttribute("keyword", keyword);
		return "FAQ/faq_main";
	}
	
	@RequestMapping("/faq_main.do")//FAQ 리스트 떠야함
	public ModelAndView main(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		
		int rowCount = userFaqMapper.faqgetCount();
		int pageBlock = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageSize = 5;
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		if (endPage > pageCount) endPage = pageCount;
		if(endRow > rowCount) {
			endRow = rowCount;
		}
		
		List<FaqDTO> faq_list = userFaqMapper.listFAQ(startRow, endRow);
		
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
		System.out.println(endPage);
		
		mav.setViewName("FAQ/faq_main");
		
		return mav;
	}
	
	

	@RequestMapping("/faq_input.do")
	public ModelAndView input() {
		return new ModelAndView("FAQ/faq_input");
	}
	
	@RequestMapping("/faq_inputok.do")
	public ModelAndView inputok(FaqDTO dto) {
		int res = userFaqMapper.insertFAQ(dto);
		return new ModelAndView("redirect:faq_main.do");
	}
	
	
	@RequestMapping("/faq_content.do")
	public ModelAndView content(HttpServletRequest req, @RequestParam int num) {
		FaqDTO dto = userFaqMapper.getFAQ(num);
		ModelAndView mav = new ModelAndView("FAQ/faq_content", "getFAQ", dto);
		return mav;
	}
	
	@RequestMapping("faq_keyword.do")
	public ModelAndView byKeyword(HttpServletRequest req, FaqDTO dto) {
		ModelAndView mav = new ModelAndView();
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		List<FaqDTO> keyword_list = userFaqMapper.selectByKeyword(keyword);
		mav.setViewName("FAQ/faq_keyword");
		mav.addObject("keyword", keyword);
		mav.addObject("keyword_list", keyword_list);
		System.out.println(keyword_list);
		return mav;
	}
	
	@RequestMapping("faq_delete.do")
	public ModelAndView delete(HttpServletRequest req) {
		String num = req.getParameter("num");
		String msg = "FAQ가 정상적으로 삭제 되었습니다";
		String url = "redirect:faq_main.do";
		int res = userFaqMapper.deleteFAQ(Integer.parseInt(num));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("faq_update.do")
	public ModelAndView update(HttpServletRequest req) {
		String num = req.getParameter("num");
		FaqDTO dto = userFaqMapper.getFAQ(Integer.parseInt(num));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("FAQ/faq_update");
		mav.addObject("getFaq",dto);
		return mav;
	}
	
	@RequestMapping("faq_updateok.do")
	public ModelAndView updateok(HttpServletRequest req,FaqDTO dto) {
		int res = userFaqMapper.updateFAQ(dto);
		String msg = "FAQ가 정상적으로 수정 되었습니다";
		String url = "redirect:faq_main.do";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/faq_find.do")
	public String inquiryFind(HttpServletRequest req) {
		String question = req.getParameter("question");
		List<FaqDTO> list = userFaqMapper.faqFind(question);
		System.out.println(list);
		req.setAttribute("faqFind", list);
		req.setAttribute("mode", "find");
		return "FAQ/faq_main";	
	}
}
