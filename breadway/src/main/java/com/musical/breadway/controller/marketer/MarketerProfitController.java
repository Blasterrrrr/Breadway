package com.musical.breadway.controller.marketer;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.ReserveDTO;
import com.musical.breadway.dto.ScheduleDTO;
import com.musical.breadway.dto.SeatDTO;
import com.musical.breadway.dto.Venue_SeatsDTO;
import com.musical.breadway.mapper.marketer.MarketerProfitMapper;


@Controller
@SessionAttributes("marketer_UID")
public class MarketerProfitController {
	@Autowired
	MarketerProfitMapper marketerProfitMapper;


	@RequestMapping("/profit_Seat.mkt")
	public ModelAndView profit_Seat(HttpSession ses, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int rowCount = marketerProfitMapper.showgetCount(show_ID);
		if (endRow > rowCount) endRow = rowCount;
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;
		
		List<SeatDTO> get_allSeat = marketerProfitMapper.get_allSeat(show_ID);
		Integer profitAll = 0;
		int seatCount = 0;
		if(get_allSeat.size() != 0) {
			seatCount = get_allSeat.size();
			for(int i=0; i<seatCount; i++) {
				profitAll += get_allSeat.get(i).getSeat_Price() - (get_allSeat.get(i).getSeat_Price() * get_allSeat.get(i).getSeat_Discount() / 100);
			}
		}
		mav.addObject("profitAll", profitAll);
		
		
		List<ScheduleDTO> list = marketerProfitMapper.seatinfo(startRow, endRow,show_ID);
		List<Venue_SeatsDTO> totalSeatNumList = marketerProfitMapper.get_TotalSeatNum(show_ID);
		Integer totalSeatNum = 0;
		for(int i=0; i<totalSeatNumList.size(); i++) {
			totalSeatNum += totalSeatNumList.get(i).getSeat_Qty();
		}
	
		mav.addObject("show_ID", show_ID);
		mav.setViewName("marketer/marketerProfit/profit_Seat");
		mav.addObject("rowCount", rowCount);
		mav.addObject("pageBlock", pageBlock);
		mav.addObject("currentPage", currentPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageSize", pageSize);
		mav.addObject("pageCount", pageCount);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("schedulelist", list);
		mav.addObject("totalSeatNum", totalSeatNum);

		return mav;
	}
	
	
	@RequestMapping("/profit_Seat_Content.mkt")
	public ModelAndView profit_Seat_Content(HttpSession ses, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		String schedule_ID = req.getParameter("schedule_ID");
		List<Venue_SeatsDTO> framelist = marketerProfitMapper.venue_seatFrame(show_ID);
		String[] below  = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10"};
		List<SeatDTO> seatdto = marketerProfitMapper.getseat(schedule_ID);
		ses.setAttribute("schedule_ID", Integer.parseInt(schedule_ID));
		mav.setViewName("marketer/marketerProfit/profit_Seat_Content");
		mav.addObject("seatdto", seatdto);
		mav.addObject("framelist", framelist);
		mav.addObject("below", below);
		return mav;
	}
	
	
	@RequestMapping("/profit_Seat_Detail.mkt")
	public ModelAndView profit_Seat_Detail(HttpSession ses, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		Integer seat_ID = Integer.parseInt(req.getParameter("seat_ID"));
		Integer consumer_UID = marketerProfitMapper.get_consumerUID(seat_ID);
		ReserveDTO detail_list = marketerProfitMapper.seatdetail(seat_ID);
		ConsumerDTO cdto = marketerProfitMapper.get_consumerInfo(consumer_UID);
		mav.setViewName("marketer/marketerProfit/profit_Seat_Detail");
		mav.addObject("detail_list",detail_list);
		mav.addObject("cdto",cdto);
		return mav;
	}
	
	
	@RequestMapping("/profit_Seat_Reserved.mkt")
	public String profit_Seat_Reserved(HttpSession ses, HttpServletRequest req, @RequestParam Integer schedule_ID) {
		List<ReserveDTO> reservedList = marketerProfitMapper.get_allReservedBySchNum(schedule_ID);
		List<Integer> consumerUID_List = new ArrayList<Integer>();
		for(int i=0; i<reservedList.size(); i++) {
			consumerUID_List.add(reservedList.get(i).getConsumer_UID());
		}
		List<ConsumerDTO> cInfo = new ArrayList<ConsumerDTO>();
		for(int i=0; i<consumerUID_List.size(); i++) {
			cInfo.add(marketerProfitMapper.get_consumerInfo(consumerUID_List.get(i)));
		}
		ses.setAttribute("reservedList", reservedList);
		ses.setAttribute("cInfo", cInfo);
		
		
		String schedule_Date = req.getParameter("schedule_Date");
		System.out.println("schedule_Date "+schedule_Date);
		ses.setAttribute("schedule_Date", schedule_Date);
		
		return "marketer/marketerProfit/profit_Seat_Reserved";
	}
	
	
	@RequestMapping("/cancel_reserve.mkt")
	public String cancel_reserve(HttpSession ses, @RequestParam Integer order_Num, @RequestParam Integer schedule_ID) {
		List<Integer> seatIDList = marketerProfitMapper.get_seatID(order_Num);
		marketerProfitMapper.cancelReserve_byOrder(order_Num, schedule_ID);
		
		for(int i=0; i<seatIDList.size(); i++) {
			marketerProfitMapper.delete_Seat(seatIDList.get(i));
		}
		
		return "redirect:profit_Seat_Reserved.mkt?schedule_ID=" + schedule_ID + "&schedule_Date=" + ses.getAttribute("schedule_Date");
	}
	
	
	
	
	
}
