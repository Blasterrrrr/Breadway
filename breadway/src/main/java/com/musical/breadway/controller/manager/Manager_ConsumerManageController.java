package com.musical.breadway.controller.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.MarketerDTO;
import com.musical.breadway.mapper.manager.Manager_ConsumerManageMapper;

@Controller
public class Manager_ConsumerManageController {
	
	@Autowired
	private Manager_ConsumerManageMapper consumermanageMapper;
	
	
	@RequestMapping("/managerconsumer_index.do")//관리자페이지에서 회원 관리 눌렀을때 회원들의 리스트를 가지고 이동
	public String index(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int rowCount = consumermanageMapper.ManagerconsumergetCount();
		int number = rowCount - startRow + 1;
		if (endRow > rowCount) endRow = rowCount;
		List<ConsumerDTO> list = consumermanageMapper.ManagerlistConsumer(String.valueOf(startRow),String.valueOf(endRow));
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;
		
		req.setAttribute("number", number);
		req.setAttribute("rowCount", rowCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("listConsumer", list);
		return "manager/consumermanage/consumermanage_index";
	}
	
	@RequestMapping("/managerconsumer_search.do")
	public ModelAndView search(HttpServletRequest req) {
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
		String consumersearch = req.getParameter("consumersearch");
		String consumerString = req.getParameter("consumerString");
		List<ConsumerDTO> list = consumermanageMapper.ManagersearchConsumer(consumersearch,consumerString);
		mav.setViewName("manager/consumermanage/consumermanage_search");
		mav.addObject("searchList", list);
		mav.addObject("consumersearch", consumersearch);
		mav.addObject("consumerString", consumerString);
		return mav;
	}
	
	@RequestMapping("/managerconsumer_update.do")
	public String update(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		HttpSession session = req.getSession();
		Integer consumer_uid = (Integer)session.getAttribute("managerconsumer_uid");
		String uid = req.getParameter("uid");
		System.out.println(consumer_uid);
		if(consumer_uid != null) {
			ConsumerDTO dto = consumermanageMapper.ManagergetConsumer(String.valueOf(consumer_uid));
			req.setAttribute("getConsumer", dto);
			return "manager/consumermanage/consumermanage_update";
		}
		ConsumerDTO dto = consumermanageMapper.ManagergetConsumer(uid);
		req.setAttribute("getConsumer", dto);
		return "manager/consumermanage/consumermanage_update";
	}
	
	@RequestMapping("/managerconsumer_update_ok.do")
	public ModelAndView updateok(HttpServletRequest req,ConsumerDTO dto) {
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
		HttpSession session = req.getSession();
		String msg = "수정 되었습니다.";
		String url = "managerconsumer_index.do";
		int res1 = consumermanageMapper.Managerconsumeridcheck(dto.getConsumer_ID());
		if (res1 == 1) {
			msg = "중복되는 아이디 입니다. 다시 입력해 주세요.";
			url = "managerconsumer_update.do";
			session.setAttribute("managerconsumer_uid", dto.getConsumer_UID());
			mav.setViewName("manager/message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		int res2 = consumermanageMapper.ManagerupdateConsumer(dto);
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/managerconsumer_delete.do")
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
		String uid = req.getParameter("uid");
		String msg = "삭제 되었습니다.";
		String url = "managerconsumer_index.do";
		int res = consumermanageMapper.ManagerdeleteConsumer(uid);
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
}
