package com.musical.breadway;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller

public class IndexController {

	@RequestMapping("/")
	public String home(){
		return "redirect:musical_mainPage.do";
	}
	@RequestMapping("/login.do")
	public String login(HttpServletRequest req) {
		String root = req.getParameter("root");
		if(root == null) {
			String referrer = req.getHeader("Referer");
			req.getSession().setAttribute("prevPage", referrer);
		}
		req.setAttribute("root", root);
		return "login";
	}
}
