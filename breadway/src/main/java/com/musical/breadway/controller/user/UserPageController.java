package com.musical.breadway.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.musical.breadway.dto.ShowDTO;
import com.musical.breadway.mapper.user.UserShowMapper;

@Controller
public class UserPageController {
	HttpSession session;
	

	@Autowired UserShowMapper userShowMapper;
	
	//메인페이지
	@RequestMapping("/musical_mainPage.do")
	public String MainPage(HttpServletRequest req) {
		String mode;
		if(req.getParameter("mode") == null) {
		List<ShowDTO> list = userShowMapper.getAllShowList();
		req.setAttribute("allShowList", list);
		System.out.println(list);
		mode = "all";
		req.setAttribute("mode", mode);
		}else {
			String show_name = req.getParameter("show_Name");
				if(show_name != null) {
					Map<String, String> map = new HashMap<String, String>();
					map.put("show_name", show_name);
					List<Map<String, String>> findList = userShowMapper.getMainFindList(map);
					System.out.println(findList);	
					req.setAttribute("findList", findList);
				}
				mode = "find";
				req.setAttribute("mode", mode);
				
		}
		System.out.println("mode는 : " + mode);
		return "musical/mainPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
