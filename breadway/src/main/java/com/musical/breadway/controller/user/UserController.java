package com.musical.breadway.controller.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.MarketerDTO;
import com.musical.breadway.mapper.user.UserMapper;


//user들이 로그인할때 컨트롤 하는 클래스9
@Controller
public class UserController {
	HttpSession session;
	String msg;
	String url;
	
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/consumer_login_ok.do")
	public ModelAndView consumerLogin(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		String csaveId = req.getParameter("csaveId");
		System.out.println("고객 아이디 저장여부:"+csaveId);
		
		String root = req.getParameter("root");
		System.out.println(root);

			String consumer_ID = req.getParameter("consumer_ID");
			String consumer_Password = req.getParameter("consumer_Password");
			
			ConsumerDTO dto = new ConsumerDTO();
			dto.setConsumer_ID(consumer_ID);
			dto.setConsumer_Password(consumer_Password);
					
			ConsumerDTO consumer= userMapper.selectConsumer(dto);
			
	
			if(consumer != null) {
				System.out.println(consumer.getConsumer_Status());
				if(consumer.getConsumer_Status()==100) {
					String msg = "이메일 인증을 해주세요.";
					String url = "musical_mainPage.do";
					mav.addObject("msg", msg);
					mav.addObject("url", url);
					mav.setViewName("message");
					return mav;
				}else {
					HttpSession session = req.getSession();
					String consumer_Name= consumer.getConsumer_Name();
					System.out.println("접속하시분 이름은:"+consumer_Name);
					session.setAttribute("consumer", consumer);
					
					msg = consumer.getConsumer_Name()+"님이 로그인에 성공했습니다.";
					
					String redirectURL = (String) session.getAttribute("prevPage");
					if(redirectURL != null) {
						String url = redirectURL;
						System.out.println("이전페이지 url =" + url);
						mav.addObject("url", url);
						session.removeAttribute("prevPage");		
					}else if(!root.trim().equals("")  ) {
						String url = root;
						System.out.println("url=root 값" + url);
						mav.addObject("url", url);
					}else {
						String url = "musical_mainPage.do";
						System.out.println(url);
						mav.addObject("url", url);
					}
				
					mav.addObject("msg", msg);
					mav.setViewName("message");
					
					if(csaveId!=null) {
						Cookie cookie = new Cookie("csaveId",consumer.getConsumer_ID());
						cookie.setMaxAge(60*60*24*7);//7일동안 저장
						resp.addCookie(cookie);
					}else {
						Cookie cookie = new Cookie("csaveId",consumer.getConsumer_ID());
						cookie.setMaxAge(0); //저장하지마!!!!
						resp.addCookie(cookie);
					}
				}
			}else {
				String msg = "아이디,비밀번호를 확인해주세요";
				String url = "login.do";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("message");
			}
			return mav;
		}
		
	
		@RequestMapping("/marketer_login_ok.do")
		public ModelAndView marketerLogin(HttpServletRequest req, HttpServletResponse resp) {
			ModelAndView mav = new ModelAndView();
			String msaveId = req.getParameter("msaveId");
			System.out.println("판매자 아이디 저장여부:"+msaveId);
			String marketer_ID = req.getParameter("marketer_ID");
			String marketer_Password = req.getParameter("marketer_Password");
			
			MarketerDTO dto = new MarketerDTO();
			dto.setMarketer_ID(marketer_ID);
			dto.setMarketer_Password(marketer_Password);
					
			MarketerDTO marketer= userMapper.selectMarketer(dto);
			
			if(marketer != null) {
				HttpSession session = req.getSession();
				if(marketer.getMarketer_Status() == 777){ //관리자 ㄱㅖ정
					session.setAttribute("admin", marketer);
					msg = "관리자 모드로 로그인 되었습니다.";
					url = "manager_index.do";
					if(msaveId!=null) {
						Cookie cookie = new Cookie("msaveId",marketer.getMarketer_ID());
						cookie.setMaxAge(60*60*24*7);//7일동안 저장
						resp.addCookie(cookie);
					}else {
						Cookie cookie = new Cookie("msaveId",marketer.getMarketer_ID());
						cookie.setMaxAge(0); //저장하지마!!!!
						resp.addCookie(cookie);
					}
				}else if(marketer.getMarketer_Status() == -1) { //회원가입 후 이메일 미인증
					msg = "이메일 인증을 해주세요.";
					url = "musical_mainPage.do";
				}else if(marketer.getMarketer_Status() == 0){ //회원가입 후 관리자 승인 기다리는 중
					url = "musical_mainPage.do";
					msg="관리자의 승인을 기다려주세요.";
				}else if(marketer.getMarketer_Status() == 1) { //정식 회원
					session.setAttribute("marketer_UID", marketer.getMarketer_UID());
					System.out.println("usercontroller marketerUID="+marketer.getMarketer_UID());
					session.setAttribute("marketer", marketer);
					msg = "로그인에 성공했습니다.";
					url = "myPage.mkt";
					if(msaveId!=null) {
						Cookie cookie = new Cookie("msaveId",marketer.getMarketer_ID());
						cookie.setMaxAge(60*60*24*7);//7일동안 저장
						resp.addCookie(cookie);
						System.out.println(cookie);
					}else {
						Cookie cookie = new Cookie("msaveId",marketer.getMarketer_ID());
						cookie.setMaxAge(0); //저장하지마!!!!
						resp.addCookie(cookie);
						System.out.println(cookie);
					}
				}
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("message");
			}else { // 아이디 비밀번호 오류
				String msg = "아이디,비밀번호를 확인해주세요";
				String url = "login.do";
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				mav.setViewName("message");
			}	
			System.out.println("이동하는 url=" + url);
			return mav;
		}

	
	
	//로그인 체크
		@RequestMapping("/musical_loginCheck.do")
		public String LoginCheck(HttpServletRequest req) {
			String root = req.getParameter("root");
			System.out.println(root);
			session = req.getSession();
			System.out.println("session:"+session.getAttribute("consumer"));
			if(session.getAttribute("consumer") ==null && session.getAttribute("marketer") == null ){
				msg = "로그인을 먼저 해주세요.";
				url="login.do";
						req.setAttribute("msg", msg);
						System.out.println("msg = " + msg);
						req.setAttribute("url", url);
						System.out.println("url = " + url);
						req.setAttribute("root", root);
						System.out.println("root = " + root);
						return "message";
		}else {
			return "redirect:"+root;

		}

	}
	
	
		@RequestMapping("/consumer_findID.do")
		public ModelAndView CfindId(@RequestParam String consumer_Name,@RequestParam String consumer_Email) throws Exception {
			boolean isCheck = userMapper.CfindID(consumer_Name, consumer_Email);
			
			String msg = null, url = null;
			if(isCheck) {
				msg = "결과를 가입하신 이메일로 전송했습니다. 메일을 확인해주세요!";
				url = "login.do";
			}else {
				msg = "해당하는 정보로는 찾는 아이디가 없습니다. 다시 시도 해주세요";
				url = "Cfind.do?mode=id";
			}
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
			
		}
		@RequestMapping("/consumer_findPW.do")
		public ModelAndView CfindPw(@RequestParam String consumer_Name,@RequestParam String consumer_ID, @RequestParam String consumer_Email) throws Exception{
			boolean isCheck = userMapper.CfindPW(consumer_Name,consumer_ID,consumer_Email);
			
			String msg = null, url = null;
			if(isCheck) {
				msg = "결과를 이메일로 전송했습니다. 메일을 확인해주세요!";
				url = "login.do";
			}else {
				msg = "해당하는 정보가 없습니다. 다시 시도 해주세요";
				url = "Cfind.do?mode=pw";
			}
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}
		
		@RequestMapping("/marketer_findID.do")
		public ModelAndView MfindId(@RequestParam String marketer_Name,@RequestParam String marketer_Email) throws Exception {
			boolean isCheck = userMapper.MfindID(marketer_Name, marketer_Email);
		
			String msg = null, url = null;
			if(isCheck) {
				msg = "결과를 가입하신 이메일로 전송했습니다. 메일을 확인해주세요!";
				url = "login.do";
			}else {
				msg = "해당하는 정보로는 찾는 아이디가 없습니다. 다시 시도 해주세요";
				url = "Mfind.do?mode=id";
			}
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
		
			return mav;
			
		}
		@RequestMapping("/marketer_findPW.do")
		public ModelAndView MfindPw(@RequestParam String marketer_Name,@RequestParam String marketer_ID, @RequestParam String marketer_Email) throws Exception{
			boolean isCheck = userMapper.MfindPW(marketer_Name,marketer_ID,marketer_Email);
			
			String msg = null, url = null;
			if(isCheck) {
				msg = "결과를 이메일로 전송했습니다. 메일을 확인해주세요!";
				url = "login.do";
			}else {
				msg = "해당하는 정보가 없습니다. 다시 시도 해주세요";
				url = "Mfind.do?mode=pw";
			}
			ModelAndView mav = new ModelAndView("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}
		
		@RequestMapping("/logout.do")
		public ModelAndView logout(HttpSession session, HttpServletRequest req) {
			session.removeAttribute("consumer");
			session.invalidate();
			
			System.out.println(session);
			ModelAndView mav = new ModelAndView();
			String msg = "로그아웃 했습니다. 홈으로 돌아갑니다..";
			String url = "musical_mainPage.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			mav.setViewName("message");
			return mav;
		}
	}

