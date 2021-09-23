package com.musical.breadway.controller.marketer;


import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.musical.breadway.dto.ScheduleDTO;
import com.musical.breadway.dto.ShowDTO;
import com.musical.breadway.mapper.marketer.MarketerCastingMapper;
import com.musical.breadway.mapper.marketer.MarketerScheduleMapper;
import com.musical.breadway.mapper.marketer.MarketerShowMapper;


@Controller
@SessionAttributes("marketer_UID")
public class MarketerScheduleController {
	@Autowired
	MarketerScheduleMapper marketerScheduleMapper;
	@Autowired
	MarketerCastingController castingController;
	@Autowired
	MarketerCastingMapper marketerCastingMapper;
	@Autowired
	MarketerShowMapper marketerShowMapper;
	
//----------schedule
	@RequestMapping("/schedule_Add.mkt")
	public String schedule_Add(HttpSession ses) {
		String show_Role_Table_Name = (String) ses.getAttribute("show_Role_Table_Name");
        
        Integer count_roleSet = marketerCastingMapper.count_roleSet(show_Role_Table_Name);
        List<String> newRoleList = (List<String>) ses.getAttribute("newRoleList");
        Integer count_role = newRoleList.size();
        
        List<LinkedHashMap<String, String>> get_allCastPattern = marketerCastingMapper.get_allCastPattern(show_Role_Table_Name);
        List<String> CastNames = new ArrayList<String>();
        List<String> CastRoleSet = new ArrayList<String>();
		for(int i = 0; i < get_allCastPattern.size(); i++){
			for( Entry<String, String> elem : get_allCastPattern.get(i).entrySet() ){
				castingController = new MarketerCastingController();
				if (castingController.isStringDouble(String.valueOf(elem.getValue()))) {
					CastRoleSet.add(String.valueOf(elem.getValue()));
				}else {
						CastNames.add(String.valueOf(elem.getValue()));
				}
			}
		}
		
		List<String> newCastRoleSet = new ArrayList<String>();
		for(int i = 1; i < CastRoleSet.size(); i++){
			if(i % 2 == 0) {
				newCastRoleSet.add(CastRoleSet.get(i));
			}
		}
		
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		List<ShowDTO> list_showDetail = marketerShowMapper.list_showDetail(show_ID);
		String startDate = list_showDetail.get(0).getStartDate();
		String endDate = list_showDetail.get(0).getEndDate();
		
		ses.setAttribute("count_roleSet", count_roleSet);
		ses.setAttribute("count_role", count_role);
		ses.setAttribute("CastNames", CastNames);
		ses.setAttribute("newCastRoleSet", newCastRoleSet);
		
		return "marketer/marketerSchedule/schedule_Add";
	}
	
	
	@RequestMapping("/schedule_Add_Ok.mkt")
	public String schedule_Add_Ok(HttpSession ses, HttpServletRequest req, @ModelAttribute ScheduleDTO dto) {
		Integer pNum = Integer.parseInt(req.getParameter("pNum"));
		List<String> newCastRoleSet = (List<String>) ses.getAttribute("newCastRoleSet");
		Integer newpNum = Integer.parseInt(newCastRoleSet.get(pNum));
		dto.setRole_Set(newpNum);
		marketerScheduleMapper.insert_schedule(dto);

		return "redirect:schedule_All.mkt";
	}
	
	
	@RequestMapping("/schedule_All.mkt")
	public String schedule_All(HttpSession ses, @ModelAttribute ScheduleDTO dto) {
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		List<ScheduleDTO> list_schedule = marketerScheduleMapper.list_schedule(show_ID);
		ses.setAttribute("list_schedule", list_schedule);
		return "marketer/marketerSchedule/schedule_All";
	}
	
	
	@RequestMapping("/schedule_detail.mkt")
	public String schedule_getCasts(HttpSession ses, @RequestParam Integer schedule_ID) {
		List<ScheduleDTO> get_schedule = marketerScheduleMapper.get_schedule(schedule_ID);
		String show_Role_Table_Name = (String) ses.getAttribute("show_Role_Table_Name");
	    
	    LinkedHashMap<String, String> get_roleList = marketerShowMapper.get_roleList(show_Role_Table_Name);
		List<String> oldRoleList = new ArrayList<String>(get_roleList.values());
		List<String> newRoleList = new ArrayList<String>();
		for(int i=2; i<oldRoleList.size(); i++) {
			newRoleList.add(oldRoleList.get(i).trim());
		}
		
		Integer role_Set = get_schedule.get(0).getRole_Set();
		LinkedHashMap<String, String> get_scheduledCasts = marketerScheduleMapper.get_scheduledCasts(show_Role_Table_Name, role_Set);
		List<String> oldscheduledCasts = new ArrayList<String>(get_scheduledCasts.values());
		List<String> newscheduledCasts = new ArrayList<String>();
		for(int i=2; i<oldscheduledCasts.size(); i++) {
			newscheduledCasts.add(String.valueOf(oldscheduledCasts.get(i)).trim());
		}
		
		ses.setAttribute("get_schedule", get_schedule);
		ses.setAttribute("newRoleList", newRoleList);
		ses.setAttribute("newscheduledCasts", newscheduledCasts);
		
		return "marketer/marketerSchedule/schedule_Detail";
	}
	
	
	@RequestMapping("/schedule_Delete_Ok.mkt")
	public String schedule_Delete_Ok(@RequestParam Integer schedule_ID){
		marketerScheduleMapper.delete_schedule(schedule_ID);
		return "redirect:schedule_All.mkt";
	}
	
	
	@RequestMapping("/schedule_Update.mkt")
	public String schedule_Update(HttpSession ses, @RequestParam Integer schedule_ID) {
		String show_Role_Table_Name = (String) ses.getAttribute("show_Role_Table_Name");
        
        Integer count_roleSet = marketerCastingMapper.count_roleSet(show_Role_Table_Name);
        List<String> newRoleList = (List<String>) ses.getAttribute("newRoleList");
        Integer count_role = newRoleList.size();
        
        List<LinkedHashMap<String, String>> get_allCastPattern = marketerCastingMapper.get_allCastPattern(show_Role_Table_Name);
        List<String> CastNames = new ArrayList<String>();
        List<String> CastRoleSet = new ArrayList<String>();
		for(int i = 0; i < get_allCastPattern.size(); i++){
			for( Entry<String, String> elem : get_allCastPattern.get(i).entrySet() ){
				castingController = new MarketerCastingController();
				if (castingController.isStringDouble(String.valueOf(elem.getValue()))) {
					CastRoleSet.add(String.valueOf(elem.getValue()));
				}else {
						CastNames.add(String.valueOf(elem.getValue()));
				}
			}
		}
		
		List<String> newCastRoleSet = new ArrayList<String>();
		for(int i = 1; i < CastRoleSet.size(); i++){
			if(i % 2 == 0) {
				newCastRoleSet.add(CastRoleSet.get(i));
			}
		}
		
		List<ScheduleDTO> get_schedule = marketerScheduleMapper.get_schedule(schedule_ID);
		
		ses.setAttribute("count_roleSet", count_roleSet);
		ses.setAttribute("count_role", count_role);
		ses.setAttribute("CastNames", CastNames);
		ses.setAttribute("newCastRoleSet", newCastRoleSet);
		ses.setAttribute("get_schedule", get_schedule);
		
		return "marketer/marketerSchedule/schedule_Update";
	}
	
	
	@RequestMapping("/schedule_Update_Ok.mkt")
	public String schedule_Update_Ok(HttpSession ses, HttpServletRequest req, @ModelAttribute ScheduleDTO dto) {
		Integer pNum = Integer.parseInt(req.getParameter("pNum"));
		List<String> newCastRoleSet = (List<String>) ses.getAttribute("newCastRoleSet");
		Integer newpNum = Integer.parseInt(newCastRoleSet.get(pNum));
		dto.setRole_Set(newpNum);
		marketerScheduleMapper.update_schedule(dto);
		return "redirect:schedule_All.mkt";
	}

	
}
