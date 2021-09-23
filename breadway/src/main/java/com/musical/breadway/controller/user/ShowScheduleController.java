package com.musical.breadway.controller.user;

import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.ScheduleDTO2;
import com.musical.breadway.dto.Venue_SeatsDTO;
import com.musical.breadway.mapper.user.UserScheduleMapper;
import com.musical.breadway.mapper.user.SeatMapper;

@Controller
public class ShowScheduleController {
	@Autowired
	UserScheduleMapper scheduleMapper;
	@Autowired
	SeatMapper seatMapper;
	
	private Calendar cal = Calendar.getInstance();
	
	@RequestMapping(value="/show_calendar.do", method={RequestMethod.GET, RequestMethod.POST})
	public String moveShowSchedulePage(HttpServletRequest req,
										@RequestParam(value="month", defaultValue="first") String month_param,
										@RequestParam(value="last_date") String last_param,
										@RequestParam(value="theatre_id") int theatre_id) {		
		int show_id = Integer.parseInt(req.getParameter("show_id"));
		int current_month = getCurrentMonth();
		int last_month = getLastMonth(last_param);		
		int month = getMonth(month_param);
		int year = cal.get(Calendar.YEAR);
		int venue_seat_qty = getVenueSeatQty(theatre_id);
		
		HttpSession session = req.getSession();
		ConsumerDTO consumer = (ConsumerDTO) session.getAttribute("consumer");
		
		if(consumer==null) {
			return "redirect:login.do";
		}
		
		Map<Integer, List<ScheduleDTO2>> days = makeShowScheduleCalendar(year, month, show_id);

		req.setAttribute("month", month+1);
		req.setAttribute("year", year);
		req.setAttribute("days", days);
		//공연 일정만 조회하게끔 현재 달과 공연 마지막 달 req로 보내주기
		req.setAttribute("currentMonth", current_month);
		req.setAttribute("lastMonth", last_month);
		req.setAttribute("venue_seat_qty", venue_seat_qty);
		
		return "show/schedule";
	}
	
	private Map<Integer, List<ScheduleDTO2>> makeShowScheduleCalendar(int year, int month, int show_id) {		
		cal.set(year, month, 1);
		int first_day = cal.get(Calendar.DAY_OF_WEEK);
		int last_day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);		
		String start_date = getDateFormat("start");

		cal.set(year, month, last_day);
		int last_week = cal.get(Calendar.WEEK_OF_MONTH);		
		String end_date = getDateFormat("end");
		
		List<ScheduleDTO2> schedule = scheduleMapper.findSchedule(start_date, end_date, show_id);		
		Map<Integer, List<ScheduleDTO2>> days = new TreeMap<Integer, List<ScheduleDTO2>>();
		
		//날짜마다 스케쥴 데이터가 있는지 담아낸다.
		for(int i=1; i<=(last_week*7); i++) {
			if(first_day > i || (last_day+first_day) <= i) {
        		days.put(i-(first_day-1), null);
        	}else {
        		addScheduleOnDate(schedule, days, i-(first_day-1));
        	}
		}
		
		return days;
	}
	
	//날짜마다 스케쥴 조회 후 정보를 담아낸다
	private void addScheduleOnDate(List<ScheduleDTO2> schedule,
									Map<Integer, List<ScheduleDTO2>> days, int day) {
		List<ScheduleDTO2> sList= new ArrayList<ScheduleDTO2>();
        for(ScheduleDTO2 list : schedule) { 
        	int getDay = list.getSchedule_date().toLocalDate().getDayOfMonth();
        	if(getDay == day) {
        		sList.add(list);
        	}       	
		}
        
        days.put(day, sList); 
	}
	
	//오라클 내 날짜 범위 조회 때문에 day 매개변수 추가
	private String getDateFormat(String day) {
		SimpleDateFormat month_format = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
		
		String current_date = month_format.format(System.currentTimeMillis());
		String cal_date = month_format.format(cal.getTime());		
		String date = null;	
		
		//달력 날짜와 시스템 날짜가 같을 경우 현재 날짜부터
		if(current_date.equals(cal_date) && day.equals("start")) {
			date = date_format.format(System.currentTimeMillis());
		}else {
			date = date_format.format(cal.getTime());
		}
		
		return date;
	}
	
	//이번달 가져오기
	private int getCurrentMonth() {
		SimpleDateFormat month_format = new SimpleDateFormat("MM");
		String month_str = month_format.format(System.currentTimeMillis());
		int month = Integer.parseInt(month_str);

		return month;
	}
	
	//마지막 공연 달 가져오기
	private int getLastMonth(String last_param) {
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(last_param);
			String date_str = new SimpleDateFormat("MM").format(date);
			int month = Integer.parseInt(date_str);

			return month;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return 0;
	}
	
	private int getMonth(String month) {
		if(month.equals("next")) {
			cal.add(Calendar.MONTH, 1);
		}else if(month.equals("last")) {
			cal.add(Calendar.MONTH, -1);
		}else {
			cal.set(Calendar.MONTH , getCurrentMonth()-1);
		}
		
		return cal.get(Calendar.MONTH);
	}
	
	//매진처리를 위해 공연장 시트 수 가져오기
	private int getVenueSeatQty(int theatre_id) {
		int qty = 0;
		
		List<Venue_SeatsDTO> seats = seatMapper.findVenueSeatQty(theatre_id);
		for(Venue_SeatsDTO dto : seats) {
			qty += dto.getSeat_Qty();
		}
		
		return qty;
	}
}
