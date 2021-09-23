package com.musical.breadway.controller.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.mapper.user.UserConsumerMapper;
import com.musical.breadway.mapper.user.UserReserveMapper;

@Controller
public class UserMyInfoController {
	
	HttpSession session;

	@Autowired UserReserveMapper reserveMapper;
	
		//나의 예매내역 리스트 보여주기
		@RequestMapping("/musical_myBuyPage.do")
		public String MyReservePage(HttpServletRequest req) {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "로그인을 먼저 해주세요.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";
				}

			ConsumerDTO dto = (ConsumerDTO)session.getAttribute("consumer");
			List<Map<String, String>> reserveList = reserveMapper.getReserveList(dto.getConsumer_UID());
			System.out.println("reserveList:"+reserveList);
			req.setAttribute("reserveList", reserveList);
			return "musical/myBuyPage";
		}
		
		//나의 예매 취소 내역 리스트 보여주기
		@RequestMapping("/musical_myCancelPage.do")
		public String MyReserveCancelPage(HttpServletRequest req) {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "로그인을 먼저 해주세요.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}

			ConsumerDTO dto = (ConsumerDTO)session.getAttribute("consumer");
			System.out.println("controller consumer_UID:"+dto.getConsumer_UID());
			List<Map<String, String>> reserveCancelList = reserveMapper.getReserveCancelList(dto.getConsumer_UID());
			System.out.println(reserveCancelList);
			req.setAttribute("reserveCancelList", reserveCancelList);
			return "musical/myCancelPage";
		}

	//내가 예매한 뮤지컬 상세내역
		@RequestMapping("/musical_musicalInfo.do")
		public String MyReserveInfoPage(HttpServletRequest req) {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "로그인을 먼저 해주세요.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}
			int order_num = Integer.parseInt(req.getParameter("order_Num"));
			List<Map<String, String>> reserveShow = reserveMapper.getReserveShow(order_num);
			System.out.println("나가는 값 : " + reserveShow);
			req.setAttribute("show", reserveShow);
			return "musical/musicalInfo";
		}
		
		//내가 취소한 뮤지컬 상세내역
		@RequestMapping("/musical_musicalCancelInfo.do")
		public String MyReserveCancelInfoPage(HttpServletRequest req) throws ParseException {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "로그인을 먼저 해주세요.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}
				int order_num = Integer.parseInt(req.getParameter("order_Num"));
				System.out.println("상세보기 페이지로 넘어온 order_num : " + order_num);
				List<Map<String, String>> reserveShow = reserveMapper.getReserveCancelShow(order_num);
				System.out.println("나가는 값 : " + reserveShow);
				req.setAttribute("show", reserveShow);
				//공연날짜와 오늘 날짜 차이 계산
				int MILLI_SECONDS_PER_DAY = 24 * 60 * 60 * 1000;
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date startDate = sdf.parse(reserveShow.get(0).get("RESERVE_CANCEL_DATE"));
				Date endDate = sdf.parse(reserveShow.get(0).get("SCHEDULE_DATE"));
				long difference = (endDate.getTime() - startDate.getTime()) / MILLI_SECONDS_PER_DAY;
				System.out.println(difference);
				req.setAttribute("difference", difference);
				int percent;
				if(difference > 29) {
					percent = 100; //30일이후부터 위약금 없음
					req.setAttribute("percent", percent);
				} else if(6 < difference &&  difference< 30) {
					percent = 90; //7일전부터 30일 전까지는 90프로 환불
					req.setAttribute("percent", percent);
				}	else if(3 < difference && difference < 7) {
					percent =80; //6일 전부터 4일전까지는 80프로 환불
					req.setAttribute("percent", percent);
				} else if(0<difference  && difference < 4) {
					percent =60; //3일 전부터 하루전까지는 60프로 환불
					req.setAttribute("percent", percent);
				}
				return "musical/MyCancelInfoPage";
		}
		
		//뮤지컬 예매 취소로 이동하기
		@RequestMapping("/musical_reserveCancel.do")
		public String ReserveCancel(HttpServletRequest req) throws ParseException {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "로그인을 먼저 해주세요.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}
			String order_num = req.getParameter("order_Num");
			System.out.println("order_num값 : " + order_num);
			List<Map<String, String>> list = reserveMapper.getReserveData(Integer.parseInt(order_num));
			System.out.println(String.valueOf(list.get(0).get("ORDER_NUM")));
			List<Map<String, String>> reserveShow = reserveMapper.getReserveShow(Integer.parseInt(String.valueOf(list.get(0).get("ORDER_NUM"))));
			System.out.println("나가는 값 : " + reserveShow);
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(date);
			System.out.println(today);
			req.setAttribute("today", today);
			System.out.println(reserveShow.get(0).get("SCHEDULE_DATE"));
		
			//공연날짜와 오늘 날짜 차이 계산
			int MILLI_SECONDS_PER_DAY = 24 * 60 * 60 * 1000;
			String inputStartDate = today;
			Date startDate = sdf.parse(inputStartDate);
			Date endDate = sdf.parse(reserveShow.get(0).get("SCHEDULE_DATE"));
			long difference = (endDate.getTime() - startDate.getTime()) / MILLI_SECONDS_PER_DAY;
			System.out.println(difference);
			req.setAttribute("difference", difference);
			int percent;
			if(difference > 9) {
				percent = 100; //10일이후부터 위약금 없음
				req.setAttribute("percent", percent);
			} else if(6 < difference &&  difference< 10) {
				percent = 90; //9일전부터 7일 전까지는 90프로 환불
				req.setAttribute("percent", percent);
			}	else if(2 < difference && difference < 7) {
				percent =80; //6일 전부터 3일전까지는 80프로 환불
				req.setAttribute("percent", percent);
			} else if(0<difference  && difference < 3) {
				percent =70; //2일 전부터 하루전까지는 70프로 환불
				req.setAttribute("percent", percent);
			}
			System.out.println(reserveShow);
			req.setAttribute("reserveData", reserveShow);
			return "musical/reserveCancelPage";
		}
		
		@RequestMapping("/musical_reserveCancelOk.do")
		public String ReserveCancelOk(HttpServletRequest req) {
			session = req.getSession();
			if(session.getAttribute("consumer") == null ){
				String msg = "로그인을 먼저 해주세요.";
				String url="login.do";
						req.setAttribute("msg", msg);
						req.setAttribute("url", url);
						return "message";}
			String order_num = req.getParameter("order_Num");
			String cancelPrice = req.getParameter("cancelPrice");
			System.out.println("환불금액: " + cancelPrice);
			System.out.println("오더 넘 : " + order_num);
			List<Map<String, String>> list = reserveMapper.getReserveData(Integer.parseInt(order_num));
			System.out.println("시트id : " + String.valueOf(list.get(0).get("SEAT_ID")));
			for(Map<String, String> num : list) {
			int res1 = reserveMapper.reserveCancel(Integer.parseInt(String.valueOf(num.get("ORDER_NUM"))));
			int res2 = reserveMapper.deleteSeat(Integer.parseInt(String.valueOf(num.get("SEAT_ID"))));
			}
			String msg = "예매를 취소하였습니다.";
			String url="musical_myBuyPage.do";
					req.setAttribute("msg", msg);
					req.setAttribute("url", url);
					return "message";
		}
		
		
}
