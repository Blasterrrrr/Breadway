package com.musical.breadway.controller.user;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.SeatDTO;
import com.musical.breadway.dto.Venue_SeatsDTO;
import com.musical.breadway.mapper.user.UserScheduleMapper;
import com.musical.breadway.mapper.user.SeatMapper;
import com.musical.breadway.mapper.user.UserShowMapper;

@Controller
public class ShowSeatController {
	@Autowired
	SeatMapper seatMapper;
	
	@Autowired
	UserShowMapper showMapper;
	
	@Autowired
	UserScheduleMapper scheduleMapper;
	
	@RequestMapping(value="/show_seats.do", method={RequestMethod.POST, RequestMethod.GET})
	public String moveVenuePage(@RequestParam(value="schedule") int schedule_id,
								HttpServletRequest req) {
		//결제를 진행을 하려던 유저가 결제 화면서 페이지 이동으로 인해 좌석 선택 session 남아있는지 확인
		HttpSession session = req.getSession();
		ConsumerDTO consumer = (ConsumerDTO) session.getAttribute("consumer");
		Object seat_session = session.getAttribute(consumer.getConsumer_ID());
		
		if(seat_session!=null) {			
			session.removeAttribute(consumer.getConsumer_ID());
		}

		//누군가 시트를 먼저 선택시 메세지 보내기
		String msg = req.getParameter("msg");
		if(msg == null) {			
			msg = "empty";
		}
		
		//공연장 가져오기
		List<Venue_SeatsDTO> venue = seatMapper.findSeatSection(schedule_id);
		Map<Venue_SeatsDTO, List<SeatDTO>> seat = new LinkedHashMap<Venue_SeatsDTO, List<SeatDTO>>();
		
		//공연장 좌석예약 조회한 후 좌석예약 정보 넣기
		for(Venue_SeatsDTO dto : venue) {			
			seat.put(dto, seatMapper.findCurrentStatusOfSeats(dto.getSeat_Section(), schedule_id));
		}
		
		req.setAttribute("seat", seat);
		req.setAttribute("schedule", schedule_id);
		req.setAttribute("msg", msg);
		
		return "show/seats";
	}
	
	@RequestMapping(value="/show_checkout.do", method={RequestMethod.GET, RequestMethod.POST})
	public String moveCheckoutPage(HttpServletRequest req) {
		String[] seat_num = req.getParameterValues("seatNum");
		String[] seat_name = req.getParameterValues("seatName");
		String[] seat_price = req.getParameterValues("seatPrice");		
		String[] seat_discount = req.getParameterValues("seatDiscount");
		
		List<SeatDTO> seat_dto = new ArrayList<SeatDTO>();
		
		for(int i=0; i<seat_num.length; i++) {
			SeatDTO dto = new SeatDTO();
			
			String seatName = seat_name[i];
			
			dto.setSeat_Number(seat_num[i]);
			dto.setSeat_Name(seatName);
			dto.setSeat_Price(Integer.parseInt(seat_price[i]));
			dto.setSeat_Discount(Integer.parseInt(seat_discount[i]));
			
			seat_dto.add(dto);
		}

		req.setAttribute("seat_dto", seat_dto);
		
		return "show/checkout";
	}
}
