package com.musical.breadway.controller.user;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.ReserveDTO;
import com.musical.breadway.dto.SeatDTO;
import com.musical.breadway.mapper.user.UserReserveMapper;
import com.musical.breadway.mapper.user.UserScheduleMapper;
import com.musical.breadway.mapper.user.SeatMapper;

public class ShowReserveInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	UserReserveMapper reserveMapper;
	
	@Autowired
	SeatMapper seatMapper;
	
	@Autowired
	UserScheduleMapper scheduleMapper;	

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		//거래가 완전히 마친 후 관련 session 정보들 지우기
		HttpSession session = request.getSession();	
		ConsumerDTO consumer = (ConsumerDTO) session.getAttribute("consumer");
		String consumer_id = consumer.getConsumer_ID();
				
		session.removeAttribute(consumer_id);
		session.removeAttribute("order_num");
		session.removeAttribute("getShow");
		session.removeAttribute("schedule_date");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		
		String[] seatNum = request.getParameterValues("seatNum");
		String[] seatName = request.getParameterValues("seatName");
		String[] seatPrice = request.getParameterValues("seatPrice");
		String[] seatDiscount = request.getParameterValues("seatDiscount");
		int schedule = Integer.parseInt(request.getParameter("schedule"));
		int show_id = Integer.parseInt(request.getParameter("showID"));
		
		int size = seatNum.length;
		
		HttpSession session = request.getSession();	
		ConsumerDTO consumer = (ConsumerDTO) session.getAttribute("consumer");
		int consumer_uid = consumer.getConsumer_UID();

		//예약할 좌석 데이터들을 DTO에 담은 후 저장
		List<SeatDTO> seatList = new ArrayList<SeatDTO>();
		
		for(int i=0; i<size; i++) {
			int price = Integer.parseInt(seatPrice[i]);
			int discount = Integer.parseInt(seatDiscount[i]);
			
			SeatDTO dto = setSeatDTO(seatNum[i], seatName[i], price, discount, schedule, consumer_uid);
			seatList.add(dto);
		}
		
		//예약된 시트개수 저장
		scheduleMapper.updateSeatQtyOnSchedule(size, schedule);
		
		//시트정보 저장 후 아이디 가져오기
		seatMapper.insertReserveSeat(seatList);		
		seatList = seatMapper.findSeatKey(schedule, seatList);
		
		//예약번호 생성 후 가져오기
		int order_num = reserveMapper.insertReserveNumber(consumer_uid);
		
		//예약 정보 DTO에 담은 후 저장
		List<ReserveDTO> reserveList = new ArrayList<ReserveDTO>();
		
		for(SeatDTO seat : seatList) {
			ReserveDTO dto = setReserveDTO(seat.getSeat_ID(), seat.getSeat_Name(),
							 seat.getSeat_Price(), seat.getSeat_Discount(), show_id, consumer_uid, order_num, schedule);			
			reserveList.add(dto);
		}
		
		int result_reserve = reserveMapper.insertReserve(reserveList);
		
		if(result_reserve==0) {
			return false;
		}
		
		//완료 후 해당 시트 선택 잠금 풀기 & controller에서 예매 내역 조회를 위해 예매번호 동시에 저장			
		session.setAttribute("order_num", order_num);
				
		return true;
	}
	
	private SeatDTO setSeatDTO(String seat_number, String seat_name, int seat_price,
								int seat_discount, int schedule_id, int seat_consumer_uid) {
		SeatDTO dto = new SeatDTO();
		
		dto.setSeat_Number(seat_number);
		dto.setSeat_Name(seat_name);
		dto.setSeat_Price(seat_price);
		dto.setSeat_Discount(seat_discount);
		dto.setSchedule_ID(schedule_id);
		dto.setSeat_Consumer_UID(seat_consumer_uid);
		
		return dto;
	}

	private ReserveDTO setReserveDTO(int seat_id, String seat_name, int seat_price, int seat_discount,
									 int show_id, int consumer_uid, int order_num, int schedule_id) {
		ReserveDTO dto = new ReserveDTO();
		
		dto.setSeat_ID(seat_id);
		dto.setSeat_Name(seat_name);
		dto.setSeat_Price(seat_price);
		dto.setSeat_Discount(seat_discount);
		dto.setShow_ID(show_id);
		dto.setConsumer_UID(consumer_uid);
		dto.setOrder_Num(order_num);
		dto.setSchedule_ID(schedule_id);
		
		return dto;
	}
}
