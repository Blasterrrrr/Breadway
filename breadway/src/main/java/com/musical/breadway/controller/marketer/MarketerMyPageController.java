package com.musical.breadway.controller.marketer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.musical.breadway.dto.MarketerDTO;
import com.musical.breadway.dto.ShowDTO;
import com.musical.breadway.mapper.marketer.MarketerProfileMapper;
import com.musical.breadway.mapper.marketer.MarketerShowMapper;


@Controller
@SessionAttributes("marketer_UID")
public class MarketerMyPageController {
	@Autowired
	MarketerProfileMapper marketerProfileMapper;
	@Autowired
	MarketerShowMapper marketerShowMapper;
	
	
	@RequestMapping("/marketer_top")
	public String top() {
		return "marketer/marketer_top";
	}
	
	@RequestMapping("/myPage.mkt")
	public String myPage(HttpSession ses, HttpServletRequest req) {
		Integer marketer_UID = (Integer) ses.getAttribute("marketer_UID");
		List<MarketerDTO> profile_list = marketerProfileMapper.profile_list(marketer_UID);
		ses.setAttribute("profile_list", profile_list);
		
		List<ShowDTO> list_allShow = marketerShowMapper.list_allShow(marketer_UID);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date today = new Date();
		List<ShowDTO> list_plzShow = new  ArrayList<ShowDTO>();
		List<ShowDTO> list_willShow = new  ArrayList<ShowDTO>();
		List<ShowDTO> list_nowShow = new  ArrayList<ShowDTO>();
		List<ShowDTO> list_doneShow = new  ArrayList<ShowDTO>();
		
		
		
        try {
			for(int i=0; i<list_allShow.size(); i++) {
				String getStartDate = list_allShow.get(i).getStartDate();
				String getEndDate = list_allShow.get(i).getEndDate();
				Date startDate = sdf.parse(getStartDate);
				Date endDate = sdf.parse(getEndDate);
				if(today.getTime() < startDate.getTime()) {
					if(list_allShow.get(i).getShow_Status()==0 || list_allShow.get(i).getShow_Status()==2) {
						list_plzShow.add(list_allShow.get(i));
					}else if (list_allShow.get(i).getShow_Status()==1) {
					list_willShow.add(list_allShow.get(i));
					}
				}else if(startDate.getTime() <= today.getTime() &&  today.getTime() <= endDate.getTime()+(1000 * 60 * 60 * 24) && list_allShow.get(i).getShow_Status()==1) {
					list_nowShow.add(list_allShow.get(i));
				}else if(endDate.getTime() < today.getTime() && list_allShow.get(i).getShow_Status()==1) {
					list_doneShow.add(list_allShow.get(i));
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Integer allshowCount = list_allShow.size();
		Integer plzshowCount = list_plzShow.size();
		Integer willshowCount = list_willShow.size();
		Integer nowshowCount = list_nowShow.size();
		Integer doneshowCount = list_doneShow.size();
		ses.setAttribute("list_allShow", list_allShow);
		ses.setAttribute("list_plzShow", list_plzShow);
		ses.setAttribute("list_willShow", list_willShow);
		ses.setAttribute("list_nowShow", list_nowShow);
		ses.setAttribute("list_doneShow", list_doneShow);
		ses.setAttribute("allshowCount", allshowCount);
		ses.setAttribute("plzshowCount", plzshowCount);
		ses.setAttribute("willshowCount", willshowCount);
		ses.setAttribute("nowshowCount", nowshowCount);
		ses.setAttribute("doneshowCount", doneshowCount);
		
		return "marketer/myPage";
	}

	
	//----------profile
		@RequestMapping("/profile_Update.mkt")
		public String profile_update(HttpSession ses) {
			Integer marketer_UID = (Integer) ses.getAttribute("marketer_UID");
			List<MarketerDTO> profile_list = marketerProfileMapper.profile_list(marketer_UID);
			ses.setAttribute("profile_list", profile_list);
			return "marketer/marketerProfile/profile_Update";
		}
		
		
		@RequestMapping("/profile_update_ok.mkt")
		public String profile_update_ok(HttpSession ses, @ModelAttribute MarketerDTO dto) {
			dto.setMarketer_UID((Integer) ses.getAttribute("marketer_UID"));
			marketerProfileMapper.profile_update(dto);
			return "redirect:myPage.mkt";
		}
		
}
