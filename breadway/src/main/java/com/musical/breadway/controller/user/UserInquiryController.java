package com.musical.breadway.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.InquiryDTO;
import com.musical.breadway.mapper.user.UserInquiryMapper;

@Controller
public class UserInquiryController {
	
	@Autowired
	UserInquiryMapper userInquiryMapper;
	HttpSession session;

	
	@RequestMapping("/inquiry_myInquiry.do")
	public ModelAndView main(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		session = req.getSession();
		if(session.getAttribute("consumer") == null ){
			String msg = "로그인을 먼저 해주세요.";
			String url="login.do";
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					mav.setViewName("message");
					return mav;
		}
		
		String pageNum = req.getParameter("pageNum");
		System.out.println(pageNum);
		
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		ConsumerDTO dto = (ConsumerDTO)session.getAttribute("consumer");
		int consumer_uid =  dto.getConsumer_UID();
		int rowCount = userInquiryMapper.inqgetCount((consumer_uid));
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
		List<InquiryDTO> inq_list = userInquiryMapper.listInquiry(String.valueOf(startRow), String.valueOf(endRow), consumer_uid);
		List<InquiryDTO> inq_list_Answer = userInquiryMapper.listInquiryAnswer(consumer_uid);
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
		mav.addObject("inq_list_Answer", inq_list_Answer);
		mav.setViewName("inquiry/inquiry_myInquiryList");
		return mav;
	}
	
	@RequestMapping("/inquiry_keyword.do")
	public ModelAndView keword(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String keyword = req.getParameter("keyword");	
		List<InquiryDTO> list = null;
		mav.setViewName("inquiry/inquiry_keyword");
		mav.addObject("keyword", keyword);
		mav.addObject("keyword_list", list);
		return mav;
	}
	
	
	
	@RequestMapping("/inquiry_content.do")
	public ModelAndView content(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String num = req.getParameter("num");
		Map<String, Integer> map = new HashMap<String, Integer>();
		String re_level = req.getParameter("re_level");
		System.out.println(re_level);
		String re_group = req.getParameter("re_group");
		System.out.println(re_group);
		map.put("re_level", Integer.parseInt(re_level));
		map.put("re_group", Integer.parseInt(re_group));
		System.out.println("받은 num값 : " + num);
		InquiryDTO inq = userInquiryMapper.getInquiry(Integer.parseInt(num));
		InquiryDTO inqAnswer = userInquiryMapper.getInquiryAnswer(map);
		mav.setViewName("inquiry/inquiry_content");
		mav.addObject("getInquiry",inq);
		mav.addObject("getInquiryAnswer",inqAnswer);
		return mav;
	}
	
	@RequestMapping("/inquiry_writeForm.do")
	public ModelAndView writeForm(HttpServletRequest req){
		session = req.getSession();
		if(session.getAttribute("consumer") == null ){
			ModelAndView mav = new ModelAndView();
			String msg = "로그인을 먼저 해주세요.";
			String url="login.do";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;	}
		int num = 0, re_step = 0, re_level = 0, re_group = 0;
		String snum = req.getParameter("num");
		if (snum != null){
			num = Integer.parseInt(snum);
			re_step = Integer.parseInt(req.getParameter("re_step"));
			re_level = Integer.parseInt(req.getParameter("re_level"));
			re_group = Integer.parseInt(req.getParameter("re_group"));
		}
		ModelAndView mav = new ModelAndView("inquiry/inquiry_writeForm");
		mav.addObject("num", num);
		mav.addObject("re_step", re_step);
		mav.addObject("re_level", re_level);
		mav.addObject("re_group", re_group);
		System.out.println(num);
		System.out.println(re_step);
		System.out.println("보냄");
		return mav;
	}
	
	@RequestMapping("/inquiry_writePro.do")
	public ModelAndView writeOk(HttpServletRequest req , InquiryDTO dto) {
		ModelAndView mav = new ModelAndView();
		int res = 0;
		if (dto.getNum() == 0) {//게시판에서 새글일때 이 if 문을 통과해야 했지만 관리자는 답글만 달기 때문에 필요 없을듯 하다
			int maxNum = userInquiryMapper.maxInquiry();
			dto.setRe_group(maxNum+1);
		}else{
			res = userInquiryMapper.setInquiry(String.valueOf(dto.getRe_group()), String.valueOf(dto.getRe_step()));
			dto.setRe_step(dto.getRe_step() + 1);
			dto.setRe_level(dto.getRe_level() + 1);
		}
		session = req.getSession();
		ConsumerDTO cdto = (ConsumerDTO)session.getAttribute("consumer");
		System.out.println(cdto.getConsumer_UID());
		res = userInquiryMapper.insertInquiry(dto);
		String msg = "문의를 등록하였습니다..";
		String url = "inquiry_myInquiry.do";
		int num = dto.getNum();
		mav.setViewName("message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/inquiry_delete.do")
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String num = req.getParameter("num");
		String msg = "삭제 되었습니다.";
		String url = "inquiry_myInquiry.do";
		int res = userInquiryMapper.deleteInquiry(Integer.parseInt(num));
		mav.setViewName("message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/inquiry_updateForm.do")
	public ModelAndView update(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String num = req.getParameter("num");
		InquiryDTO inq = userInquiryMapper.getInquiry(Integer.parseInt(num));
		mav.setViewName("inquiry/inquiry_update");
		mav.addObject("getInquiry",inq);
		return mav;
	}
	
	@RequestMapping("/inquiry_updateok.do")
	public ModelAndView updateok(HttpServletRequest req,InquiryDTO dto) {
		int res = userInquiryMapper.updateInquiry(dto);
		String msg = "문의가 정상적으로 수정 되었습니다";
		String url = "inquiry_myInquiry.do";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
}
