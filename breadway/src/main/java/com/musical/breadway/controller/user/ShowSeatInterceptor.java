package com.musical.breadway.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.musical.breadway.dto.ConsumerDTO;

public class ShowSeatInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		int show_id = Integer.parseInt(request.getParameter("show_id"));
		String schedule = request.getParameter("schedule");	
		String[] seat_num = request.getParameterValues("seatNum");
		String[] seat_key = new String[seat_num.length];
		for(int i=0; i<seat_num.length; i++) {
			seat_key[i] = schedule + seat_num[i];
			
			//해당 좌석에 이미 누군가 먼저 선택을 했는지 체크
			if(ShowSeatStatusManager.getInstance().checkCurrentStatusOfSeat(seat_key[i])) {
				response.sendRedirect(request.getContextPath() + "/show_seats.do?schedule=" + schedule + "&msg=select");
				return false;
				}
			}
		
		//시트 선택 대기 악용 방지를 위해 session 추가	
		HttpSession session = request.getSession();
		ConsumerDTO consumer = (ConsumerDTO) session.getAttribute("consumer");
		String consumer_id = consumer.getConsumer_ID();
		
		for(int i=0; i<seat_num.length; i++) {
			//아무도 좌석을 선택 안했을 시 좌석 체크 기록을 남긴다.	
			ShowSeatStatusManager.getInstance().setStatusOfSeat(seat_key[i], consumer_id);
			System.out.println(seat_key[i] + "시트를 선택 하였습니다.");
		}	
		
		ShowSeatStatusManager.getInstance().setSeatSession(session, consumer_id);
		
		return true;
	}

}
