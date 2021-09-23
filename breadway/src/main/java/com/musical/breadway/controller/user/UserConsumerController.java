package com.musical.breadway.controller.user;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.mapper.user.UserConsumerMapper;

@Controller
public class UserConsumerController {

	HttpSession session;
	@Autowired
	private UserConsumerMapper consumerMapper;

	
	@RequestMapping("/consumer_check.do")
	public ModelAndView checkConsumer(@RequestParam String consumer_Name,@RequestParam String consumer_Email) {
		String msg = null, url = null, view = null;
		ModelAndView mav = new ModelAndView();
		
		if(consumer_Email.matches(".*[¤¡-¤¾¤¿-¤Ó°¡-ÆR]+.*")) {
			msg="ÀÌ¸ÞÀÏ¿¡ ÇÑ±ÛÀº ÀÔ·ÂÇÒ ¼ö ¾ø½À´Ï´Ù. ´Ù½Ã È®ÀÎÇØÁÖ¼¼¿ä.";
			url = "login.do";
			view = "message";
		}else {
			if(consumer_Email.contains("@naver.com")) {
				boolean isCheck = consumerMapper.checkConsumer(consumer_Name, consumer_Email);
					if(isCheck) {
						msg = "ÀÌ¹Ì °¡ÀÔÇÑ ÀÌ·ÂÀÌ ÀÖ½À´Ï´Ù.";
						url = "login.do";
						view = "message";
					}else {
						mav.addObject("consumer_Name",consumer_Name);
						mav.addObject("consumer_Email",consumer_Email);
						view="consumer/signupConsumerForm";
					}
				}else {
					msg="ÀÌ¸ÞÀÏ ÁÖ¼Ò°¡ ¿À·ùÀÔ´Ï´Ù!! @naver.comÀ¸·Î °¡ÀÔÇØÁÖ¼¼¿ä";
					url="login.do";
					view = "message";
				}
		}
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName(view);
		return mav;
	}
	@RequestMapping("/consumer_IdCheckForm.do")
	public String idCheck() {
		return "consumer/IdCheckForm";
	}
	@RequestMapping("/consumer_idCheck_ok.do")
	public ModelAndView consumerIdCheck(@RequestParam String consumer_ID) {
		ModelAndView mav = new ModelAndView("consumer/idCheckOk");
		int res = consumerMapper.duplecateID(consumer_ID);
		mav.addObject("res",res);
		mav.addObject("consumer_ID",consumer_ID);
		return mav;
	}
	
	@RequestMapping("/consumer_Input.do")
	public String insertConsumer(ConsumerDTO dto) throws Exception{
		consumerMapper.insertConsumer(dto);
		return "redirect:musical_mainPage.do";	
	}
	
	@RequestMapping(value ="/joinConfirm.do", method=RequestMethod.GET)
	public ModelAndView emailConfirm(HttpServletRequest req,@ModelAttribute("dto") ConsumerDTO dto)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String authKey = req.getParameter("authKey");
		
		if(dto.getAuthKey() == authKey) {
		int status = 99;
		dto.setConsumer_Status(status);
		consumerMapper.updateStatus(dto);
		mav.addObject("consumer_Status",status);
		}
		mav.setViewName("index");
		return mav;
	}
	//¸¶ÀÌÆäÀÌÁö·Î ÀÌµ¿
	@RequestMapping("/consumer_mypage.do")
	public String mypage(HttpServletRequest req) {
		session = req.getSession();
		if(session.getAttribute("consumer") == null){
			String msg = "·Î±×ÀÎÀ» ¸ÕÀú ÇØÁÖ¼¼¿ä.";
			String url="login.do";
					req.setAttribute("msg", msg);
					req.setAttribute("url", url);
					return "message";
			}
		ConsumerDTO dto = (ConsumerDTO)session.getAttribute("consumer");
		System.out.println("PageContoller¿¡¼­ id°ª ¹ÞÀ½ : " + dto.getConsumer_ID());
		System.out.println("¼öÁ¤ ÈÄ :"+dto.getConsumer_UID());
		req.setAttribute("consumerDTO", dto);
		return "musical/myPage";
	}
	@RequestMapping("/consumer_edit.do")
	public String editConsumer(HttpServletRequest req) {
		HttpSession session = req.getSession();
		ConsumerDTO consumer = (ConsumerDTO)session.getAttribute("consumer");
		ConsumerDTO dto = consumerMapper.editConsumer(consumer.getConsumer_UID());
		req.setAttribute("getConsumer", dto);
		System.out.println("getConsumer dto ="+dto.getConsumer_UID());
		return "consumer/editForm";
	}
	@RequestMapping("/consumer_edit_ok.do")
	public ModelAndView updateConsumer(HttpServletRequest req,ConsumerDTO dto) {
		String msg=null,url = null;
		HttpSession session = req.getSession();
		
		session.removeAttribute("consumer");
		int res = consumerMapper.updateConsumer(dto);
		if(res>0) {
			session.setAttribute("consumer", dto);
			System.out.println("¼öÁ¤ ÈÄ :"+dto.getConsumer_Phone());
			System.out.println("¼öÁ¤ ÈÄ :"+dto.getConsumer_UID());
			msg="È¸¿øÁ¤º¸°¡ ¼öÁ¤µÇ¾ú½À´Ï´Ù.";
			url ="consumer_mypage.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("message");
		return mav;
	}
	
	@RequestMapping("/consumer_sescession_ok.do")
	public ModelAndView deleteConsumer(HttpServletRequest req) {
		String consumer_Password = req.getParameter("consumer_Password");
		HttpSession session = req.getSession();
		String sescesionText = "±×µ¿¾È °¨»çÇß½À´Ï´Ù.";
		String consumerText = req.getParameter("sescessiontext");
		System.out.println("°í°´Å»Åð¹®±¸ÀÔ·Â :"+consumerText.trim());
		System.out.println("ÁöÁ¤Å»Åð¹®±¸:"+sescesionText.trim());
		String msg=null,url= null;
	
		if(!sescesionText.trim().equals(consumerText.trim())) {
			msg = "È¸¿øÅ»Åð¹®±¸¸¦ Àß¸ø ÀÔ·ÂÇß½À´Ï´Ù. ´Ù½Ã ÀÔ·ÂÇØÁÖ¼¼¿ä.";
			url = "consumer_mypage.do";
		}else {
			ConsumerDTO dto = (ConsumerDTO)session.getAttribute("consumer");
			System.out.println("controller:"+dto.getConsumer_UID());
			System.out.println("controller: "+consumer_Password);
			int check = consumerMapper.deletePreCheck(dto.getConsumer_UID());
			if(check>0) {
				msg = "¿¹¸Å³»¿ªÀÌ ÀÖ½À´Ï´Ù. ¿¹¸Å¸¦ Ãë¼ÒÇÏ°í ÁøÇàÇØÁÖ¼¼¿ä.";
				url = "musical_myBuyPage.do";
			}else {
				int res = consumerMapper.deletConsumer(dto.getConsumer_UID(),consumer_Password);
				if(res>0) {
					session.invalidate();
					msg = "È¸¿øÁ¤º¸°¡ »èÁ¦µÇ¾ú½À´Ï´Ù.";
					url = "musical_mainPage.do";
				}else {
					msg= "ºñ¹Ð¹øÈ£°¡ ¸ÂÁö ¾Ê½À´Ï´Ù.";
					url = "consumer_mypage.do";
				}
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("message");
		
		return mav;
	}

	
	
}