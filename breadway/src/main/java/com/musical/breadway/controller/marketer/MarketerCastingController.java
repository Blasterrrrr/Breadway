package com.musical.breadway.controller.marketer;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.musical.breadway.dto.CastInfoDTO;
import com.musical.breadway.mapper.marketer.MarketerCastingMapper;
import com.musical.breadway.mapper.marketer.MarketerShowMapper;


@Controller
@SessionAttributes("marketer_UID")
public class MarketerCastingController {
	@Autowired
	MarketerCastingMapper marketerCastingMapper;
	@Autowired
	MarketerShowMapper marketerShowMapper;
	
//----------cast
	@RequestMapping("/cast_Add.mkt")
	public String cast_Add(HttpSession ses) {
		String show_Role_Table_Name = (String) ses.getAttribute("show_Role_Table_Name");
		LinkedHashMap<String, String> get_roleList = marketerShowMapper.get_roleList(show_Role_Table_Name);
		List<String> oldRoleList = new ArrayList<String>(get_roleList.values());
		List<String> newRoleList = new ArrayList<String>();
		for(int i=2; i<oldRoleList.size(); i++) {
			newRoleList.add(oldRoleList.get(i).trim());
		}
		ses.setAttribute("newRoleList", newRoleList);
		return "marketer/marketerCast/cast_Add";
	}
	
	
	@RequestMapping("/cast_Add_Ok.mkt")
	public String cast_Add_Ok(HttpSession ses, HttpServletRequest req, @ModelAttribute CastInfoDTO dto) {
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		MultipartFile posterFile = ((MultipartHttpServletRequest) req).getFile("cast_Photo");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String castPhotoName = uuid+"_"+posterFile.getOriginalFilename();
		dto.setCast_PhotoName(castPhotoName);
		try {
			File filePath = new File(req.getSession().getServletContext().getRealPath("/resources/files/cast/"));
			if(!filePath.exists()){
                filePath.mkdirs();
            }else {
            	posterFile.transferTo(new File(req.getSession().getServletContext().getRealPath("/resources/files/cast/") + castPhotoName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }		
		dto.setShow_ID(show_ID);
		
	    marketerCastingMapper.insert_castInfo(dto);
	    return "redirect:cast_All.mkt?show_ID="+show_ID;
	}
	
	
	@RequestMapping("/cast_All.mkt")
	public String cast_All(HttpSession ses, HttpServletRequest req) {
		System.out.println("show_Name: "+ses.getAttribute("show_Name"));
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		List<CastInfoDTO> list_castInfo = null;
		String searchByRole = req.getParameter("searchByRole");
		if(searchByRole == null || searchByRole.equals("all") || searchByRole.equals("")) {
			list_castInfo = marketerCastingMapper.list_castInfo(show_ID);
		}else {
			list_castInfo = marketerCastingMapper.searchByRole(searchByRole);
		}
		
		req.setAttribute("searchByRole", searchByRole);
		ses.setAttribute("list_castInfo", list_castInfo);
		return "marketer/marketerCast/cast_All";
	}
	
	
	@RequestMapping("/cast_Update.mkt")
	public String cast_Update(HttpSession ses, HttpServletRequest req) {
		Integer cast_ID = Integer.parseInt(req.getParameter("cast_ID"));
		List<CastInfoDTO> get_castInfo = marketerCastingMapper.get_castInfo(cast_ID);
		String castPart = get_castInfo.get(0).getCast_Part();
		ses.setAttribute("cast_ID", cast_ID);
		ses.setAttribute("castPart", castPart);
		ses.setAttribute("get_castInfo", get_castInfo);
		return "marketer/marketerCast/cast_Update";
	}
	
	
	@RequestMapping("/cast_Update_Ok.mkt")
	public String cast_Update_Ok(HttpServletRequest req, @ModelAttribute CastInfoDTO dto) {
		MultipartFile posterFile = ((MultipartHttpServletRequest) req).getFile("cast_Photo");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String castPhotoName = uuid+"_"+posterFile.getOriginalFilename();
		dto.setCast_PhotoName(castPhotoName);
		
		if (posterFile.getSize()==0) {
			posterFile = ((MultipartHttpServletRequest) req).getFile("cast_Photo2");
			dto.setCast_PhotoName(((MultipartHttpServletRequest) req).getParameter("cast_Photo2"));
		}else {
			try {
				File filePath = new File(req.getSession().getServletContext().getRealPath("/resources/files/cast/"));
				if(!filePath.exists()){
	                filePath.mkdirs();
	            }else {
	            	posterFile.transferTo(new File(req.getSession().getServletContext().getRealPath("/resources/files/cast/") + castPhotoName));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
		
       marketerCastingMapper.update_cast(dto);
		
		return "redirect:cast_All.mkt";
	}
	
	
	@RequestMapping("/cast_Delete_Ok.mkt")
	public String cast_Delete_Ok(HttpServletRequest req) {
		Integer cast_ID = Integer.parseInt(req.getParameter("cast_ID"));
		String castPhotoName = marketerCastingMapper.get_castPhotoName(cast_ID);
		marketerCastingMapper.delete_cast(cast_ID);
		File deleteFile = new File(req.getSession().getServletContext().getRealPath("/resources/files/cast/") +  castPhotoName);
        if(deleteFile.exists()) {
            deleteFile.delete(); 
        }
		return"redirect:cast_All.mkt";
	}
	
	
	
	
	
//----------casting pattern
	public boolean isStringDouble(String value) {
		try {
			Double.parseDouble(value);
			return true;
		}catch (NumberFormatException e) {
			return false;
		}
	}
	
	
	@RequestMapping("/cast_Pattern_Add.mkt")
	public String cast_Pattern_Add() {
		return "marketer/marketerCast/cast_Pattern_Add";
	}
	
	
	@RequestMapping("/cast_Pattern_Add_Ok.mkt")
	public String cast_Pattern_Add_Ok(HttpSession ses, HttpServletRequest req) {
		String result[] = req.getParameterValues("cast_Name");
		String show_Role_Table_Name = (String) ses.getAttribute("show_Role_Table_Name");
		List<String> roleListForIN = new ArrayList<String>();
        for(int i=0; i<result.length; i++){
		   	if(result[i]==null || result[i].equals("")) {
		   		continue;
		   	}else {
		   		roleListForIN.add(result[i]);
		   	}
	   	}
        Integer show_ID = (Integer) ses.getAttribute("show_ID");
        marketerShowMapper.insert_role(show_Role_Table_Name, show_ID, roleListForIN);
		
		return "redirect:cast_Pattern_All.mkt";
	}
	
	
	@RequestMapping("/cast_Pattern_All.mkt")
	public String cast_Pattern_All(HttpSession ses) {
		System.out.println("show_Name: "+ses.getAttribute("show_Name"));
		String show_Role_Table_Name = (String) ses.getAttribute("show_Role_Table_Name");
        
        Integer count_roleSet = marketerCastingMapper.count_roleSet(show_Role_Table_Name);
        List<String> newRoleList = (List<String>) ses.getAttribute("newRoleList");
        Integer count_role = newRoleList.size();
        
        List<LinkedHashMap<String, String>> get_allCastPattern = marketerCastingMapper.get_allCastPattern(show_Role_Table_Name);
        List<String> CastNames = new ArrayList<String>();
        List<String> CastRoleSet = new ArrayList<String>();
		for(int i = 0; i < get_allCastPattern.size(); i++){
			for( Entry<String, String> elem : get_allCastPattern.get(i).entrySet() ){
				if (isStringDouble(String.valueOf(elem.getValue()))) {
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
		
		ses.setAttribute("count_roleSet", count_roleSet);
		ses.setAttribute("count_role", count_role);
		ses.setAttribute("CastNames", CastNames);
		ses.setAttribute("newCastRoleSet", newCastRoleSet);
		
        return "marketer/marketerCast/cast_Pattern_All";
	}
	
	
	@RequestMapping("/cast_Pattern_Delete.mkt")
	public String cast_Pattern_All(HttpSession ses, HttpServletRequest req) {
		String show_Role_Table_Name = (String) ses.getAttribute("show_Role_Table_Name");
		Integer pNum = Integer.parseInt(req.getParameter("pNum"));
		List<String> newCastRoleSet = (List<String>) ses.getAttribute("newCastRoleSet");
		Integer newpNum = Integer.parseInt(newCastRoleSet.get(pNum));
			marketerCastingMapper.delete_castPattern(show_Role_Table_Name, newpNum);

		return "redirect:cast_Pattern_All.mkt";
	}

	
}
