package com.musical.breadway.controller.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.InquiryDTO;
import com.musical.breadway.mapper.manager.Manager_InquiryMapper;

@Controller
public class Manager_InquiryController {
	
	@Autowired
	Manager_InquiryMapper inquiryMapper;
	
	
	@RequestMapping("/managerinquiry_main.do")
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
		int rowCount = inquiryMapper.ManagerinqgetCount();
		int pageBlock = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageSize = 5;
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		if(endRow > rowCount) {
			endRow = rowCount;
		}
		List<InquiryDTO> inq_list = inquiryMapper.ManagerlistInquiry(String.valueOf(startRow), String.valueOf(endRow));
		mav.addObject("rowCount", rowCount);
		mav.addObject("pageBlock", pageBlock);
		mav.addObject("currentPage", currentPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageSize", pageSize);
		mav.addObject("pageCount", pageCount);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("inq_list", inq_list);
		mav.setViewName("manager/inquiry/inquiry_main");
		return mav;
	}
	
	@RequestMapping("/managerinquiry_keyword.do")
	public ModelAndView keword(HttpServletRequest req) {
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
		System.out.println(keyword);
		if (keyword.equals("")) {
			mav.setViewName("manager/inquiry/inquiry_keyword");
			mav.addObject("keyword", keyword);
			mav.addObject("keyword_list", null);
			return mav;
		}
		keyword = "%"+keyword+"%";
		List<InquiryDTO> list = inquiryMapper.Managerinquirykeyword(keyword);
		mav.setViewName("manager/inquiry/inquiry_keyword");
		mav.addObject("keyword", keyword);
		mav.addObject("keyword_list", list);
		return mav;
	}
	
	@RequestMapping("/managerinquiry_content.do")
	public ModelAndView content(HttpServletRequest req) {
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
		String re_step = req.getParameter("re_step");
		String re_level = req.getParameter("re_level");
		String re_group = req.getParameter("re_group");
		InquiryDTO inq = inquiryMapper.ManagergetInquiry(Integer.parseInt(num),Integer.parseInt(re_step),Integer.parseInt(re_level),Integer.parseInt(re_group));
		mav.setViewName("manager/inquiry/inquiry_content");
		mav.addObject("getInquiry",inq);
		return mav;
	}
	
	@RequestMapping("/managerinquiry_writeForm.do")
	public ModelAndView writeForm(HttpServletRequest req){
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
		String re_level = req.getParameter("re_level");
		String re_group = req.getParameter("re_group");	
		mav.setViewName("manager/inquiry/inquiry_writeForm");
		mav.addObject("num", num);
		mav.addObject("re_level", re_level);
		mav.addObject("re_group", re_group);
		return mav;
	}
	
	@RequestMapping("/managerinquiry_writePro.do")
	public String writeOk(HttpServletRequest req , InquiryDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		int res = inquiryMapper.ManagerinsertInquiry(dto);
		return "redirect:managerinquiry_main.do";
	}
	
	@RequestMapping("/managerinquiry_delete.do")
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
		String msg = "문의가 정상적으로 삭제 되었습니다.";
		String url = "managerinquiry_main.do";
		int res = inquiryMapper.ManagerdeleteInquiry(Integer.parseInt(num));
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/managerinquiry_updateForm.do")
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
		String re_step = req.getParameter("re_step");
		String re_level = req.getParameter("re_level");
		String re_group = req.getParameter("re_group");
		InquiryDTO inq = inquiryMapper.ManagergetInquiry(Integer.parseInt(num),Integer.parseInt(re_step),Integer.parseInt(re_level),Integer.parseInt(re_group));
		mav.setViewName("manager/inquiry/inquiry_update");
		mav.addObject("getInquiry",inq);
		return mav;
	}
	
	@RequestMapping("/managerinquiry_updateok.do")
	public ModelAndView updateok(HttpServletRequest req,InquiryDTO dto) {
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
		int res = inquiryMapper.ManagerupdateInquiry(dto);
		String msg = "문의가 정상적으로 수정 되었습니다";
		String url = "managerinquiry_main.do";
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
}