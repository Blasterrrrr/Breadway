package com.musical.breadway.controller.user;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.MarketerDTO;
import com.musical.breadway.mapper.user.UserMarketerMapper;

@Controller
public class UserMarketerController {

	@Autowired
	UserMarketerMapper userMarketerMapper;
	
	@RequestMapping("/signupMarketer.do")
	public String signup() {
		return "marketer/marketerCheck";
	}
	
	@RequestMapping("/marketer_check.do")
	public ModelAndView check(@RequestParam String marketer_Name,@RequestParam String marketer_Email,HttpServletRequest req) {
		String msg=null, url = null, view=null;
		ModelAndView mav = new ModelAndView();
	
		if(marketer_Email.matches(".*[§°-§æ§ø-§”∞°-∆R]+.*")) {
			msg="¿Ã∏ﬁ¿œø° «—±€¿∫ ¿‘∑¬«“ ºˆ æ¯Ω¿¥œ¥Ÿ. ¥ŸΩ√ »Æ¿Œ«ÿ¡÷ººø‰.";
			url = "musical_mainPage.do";
			view = "message";
		}else {
			if(marketer_Email.contains("@naver.com")) {
				boolean isCheck = userMarketerMapper.checkMarketer(marketer_Name, marketer_Email);
				if(isCheck) {
					msg = "¿ÃπÃ ∞°¿‘«— ¿Ã∑¬¿Ã ¿÷Ω¿¥œ¥Ÿ.";
					url = "login.do";
					view = "message";
				}else {
					mav.addObject("marketer_Name",marketer_Name);
					mav.addObject("marketer_Email",marketer_Email);
					view="marketer/signupMarketerForm";
				}
			}else {
				msg="¿Ã∏ﬁ¿œ ¡÷º“∞° ø¿∑˘¿‘¥œ¥Ÿ!! @naver.com¿∏∑Œ ∞°¿‘«ÿ¡÷ººø‰";
				url="musical_mainPage.do";
				view = "message";
			}	
		}
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName(view);
		return mav;
	}
	
	@RequestMapping("/marketer_IdCheckForm.do")
	public String marketerIdCheckForm() {
		return "marketer/IdCheckForm";
	}
	@RequestMapping("/marketer_idCheck_ok.do")
	public ModelAndView marketerIdCheck(@RequestParam String marketer_ID) {
		ModelAndView mav = new ModelAndView("marketer/idCheckOk");
		int res = userMarketerMapper.marketerIDCheck(marketer_ID);
		mav.addObject("res",res);
		mav.addObject("marketer_ID",marketer_ID);
		return mav;
	}
	@RequestMapping("/marketer_Input.do")
	public String insertMarketer(MarketerDTO dto)throws Exception {
		userMarketerMapper.insertMarketer(dto);
		return "redirect:/musical_mainPage.do";
	}
	
	@RequestMapping(value ="/marketer_joinConfirm.do", method=RequestMethod.GET)
	public ModelAndView emailConfirm(HttpServletRequest req,@ModelAttribute("dto") MarketerDTO dto)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String authKey = req.getParameter("authKey");
		
		if(dto.getAuthKey() == authKey) {
		int status = 0;
		dto.setMarketer_Status(status);
		userMarketerMapper.marketerupdateStatus(dto);
		mav.addObject("marketer_Status",status);
		}
		mav.setViewName("musical/mainPage");
		return mav;
	}
	
}