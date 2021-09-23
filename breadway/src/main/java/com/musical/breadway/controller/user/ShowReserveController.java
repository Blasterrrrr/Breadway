package com.musical.breadway.controller.user;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.musical.breadway.dto.ReserveDTO;
import com.musical.breadway.mapper.user.UserReserveMapper;

@Controller
public class ShowReserveController {
	@Autowired
	UserReserveMapper reserveMapper;
	
	//결제 완료 페이지
	@RequestMapping("/show_reserve.do")
	public String moveShowReservePage(HttpServletRequest req) {
		int show_id = Integer.parseInt(req.getParameter("showID"));
		
		//intereceptor에서 설정한 session 값으로 현재 주문 번호 가져오기
		HttpSession session = req.getSession();
		int order_num = (Integer)session.getAttribute("order_num");		
		List<ReserveDTO> reserveList = reserveMapper.findReserveSeat(order_num);		
		
		req.setAttribute("reserve", reserveList);
		
		return "show/reserve";
	}
}
