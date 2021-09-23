package com.musical.breadway.controller.marketer;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.musical.breadway.dto.AreaDTO;
import com.musical.breadway.dto.ShowDTO;
import com.musical.breadway.dto.TheatreDTO;
import com.musical.breadway.mapper.marketer.MarketerShowMapper;


@Controller
@SessionAttributes("marketer_UID")
public class MarketerShowController {
	@Autowired
	MarketerShowMapper marketerShowMapper;
	
	/* show_status = 0 : 관리자 승인 대기
						  = 1 : 관리자 승인 완료
						  = 2 : 관리자 승인 거절
						  = 3 : 관리자 삭제 대기
	*/
	
	@RequestMapping("/show_Add.mkt")
	public String show_add(HttpSession ses) {
		List<AreaDTO> list_Area = marketerShowMapper.list_Area();
		ses.setAttribute("list_Area", list_Area);
		return "marketer/marketerShow/show_Add";
	}
	
	
	@RequestMapping("/howToGetLink")
	public String howToGetLink() {
		return "marketer/marketerShow/howToGetLink";
	}
	
	
	@RequestMapping("/show_Add_Ok.mkt")
    public String show_Add_Ok(HttpSession ses, HttpServletRequest req, ShowDTO sdto){
		List<TheatreDTO> list_Theatre = marketerShowMapper.list_Theatre();
		System.out.println(list_Theatre.get(0));
		Integer marketer_UID = (Integer) ses.getAttribute("marketer_UID");
		sdto.setMarketer_UID(marketer_UID);
		
		String theatre_Name = req.getParameter("theatre_Name");
		for(int i=0; i<list_Theatre.size(); i++) {
			if(theatre_Name.equals( list_Theatre.get(i).getTheatre_Name())) {
				sdto.setTheatre_ID(list_Theatre.get(i).getTheatre_ID());
				break;
			}else {
				continue;
			}
		}
		sdto.setShow_Status(0); 
		
		MultipartFile posterFile = ((MultipartHttpServletRequest) req).getFile("poster");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String posterFileName = uuid+"_"+posterFile.getOriginalFilename();
		sdto.setPosterName(posterFileName);
		File filePath = null;
        try {
            filePath = new File(req.getSession().getServletContext().getRealPath("/resources/files/show/"));
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            File fileSave = new File(
            		req.getSession().getServletContext().getRealPath("/resources/files/show/") + posterFileName);
            posterFile.transferTo(fileSave);

        } catch (Exception e) {
            e.printStackTrace();
        }

        String result[] = req.getParameterValues("role_box");
        Arrays.sort(result);
        String[] filter = {"[", "]", "{", "}", "\\", "|", "~", "`", " ", "\"", "'", "!", "?", "@", "#", "$", "%", "^", "&", "*(", ")", "-", "", "+", "=", "", "/", ",", ".", ":", ";"};
        
        String resForCT[] = result;
        for(int i=0; i<result.length; i++) {
        	for(int j=0; j<filter.length; j++) {
        		resForCT[i] = result[i].replace(filter[j], "");
        	}
        }
        List<String> roleListForCT = new ArrayList<String>();
        for(Integer i=0; i<resForCT.length; i++){
		   	if(resForCT[i]==null || resForCT[i].equals("")) {
		   		continue;
		   	}else {
		   		roleListForCT.add(resForCT[i]);
		   	}
	   	}
        
        List<String> roleListForIN = new ArrayList<String>();
        for(int i=0; i<result.length; i++){
		   	if(result[i]==null || result[i].equals("")) {
		   		continue;
		   	}else {
		   		roleListForIN.add(result[i]);
		   	}
	   	}
        
        String show_Name = req.getParameter("show_Name");
        
        for(int i=0; i<filter.length; i++) {
        	show_Name = show_Name.replace(filter[i], "");
		}
        
        String show_Role_Table_Name = "musical_" +show_Name+ "_role";
        sdto.setShow_Role_Table_Name(show_Role_Table_Name);
        marketerShowMapper.insert_show(sdto);
        
		Integer get_showID = marketerShowMapper.create_roleT(show_Role_Table_Name, roleListForCT);
		marketerShowMapper.insert_role(show_Role_Table_Name, get_showID, roleListForIN);
		ses.setAttribute("show_Name", show_Name);
        return "redirect:myPage.mkt";
    }
	
	
	@RequestMapping("/show_Detail.mkt")
	public String show_Detail(HttpSession ses, HttpServletRequest req, @RequestParam Integer show_ID) {
		ses.setAttribute("show_ID", show_ID);
		String mode = req.getParameter("mode");
		ses.setAttribute("mode", mode);
		List<ShowDTO> list_showDetail = marketerShowMapper.list_showDetail(show_ID);
		List<TheatreDTO> list_Theatre = marketerShowMapper.list_Theatre();
		List<AreaDTO> list_Area = marketerShowMapper.list_Area();
		
		Integer getTheatre_ID = list_showDetail.get(0).getTheatre_ID();
		String theatre_Name = null;
		Integer area_Code = 0;
		String area_Name = null;
		for(int i=0; i<list_Theatre.size(); i++) {
			if(getTheatre_ID == list_Theatre.get(i).getTheatre_ID()) {
				area_Code = list_Theatre.get(i).getTheatre_AreaCode();				
				break;
			}else {
				continue;
			}
		}
		for(int i=0; i<list_Area.size(); i++) {
			if(area_Code == list_Area.get(i).getArea_Code()) {
				area_Name = list_Area.get(i).getArea_Name();
				break;
			}else {
				continue;
			}
		}
		for(int i=0; i<list_Theatre.size(); i++) {
			if(getTheatre_ID == list_Theatre.get(i).getTheatre_ID()) {
				theatre_Name = list_Theatre.get(i).getTheatre_Name();
				break;
			}else {
				continue;
			}
		}
		
		String show_Role_Table_Name = list_showDetail.get(0).getShow_Role_Table_Name();

		LinkedHashMap<String, String> get_roleList = marketerShowMapper.get_roleList(show_Role_Table_Name);
		List<String> oldRoleList = new ArrayList<String>(get_roleList.values());
		List<String> newRoleList = new ArrayList<String>();
		for(int i=2; i<oldRoleList.size(); i++) {
			newRoleList.add(oldRoleList.get(i).trim());
		}

		Integer reservedNum = marketerShowMapper.get_allReserved(show_ID);
		
		ses.setAttribute("show_Role_Table_Name", show_Role_Table_Name);
		ses.setAttribute("area_Name", area_Name);
		ses.setAttribute("theatre_Name", theatre_Name);
		ses.setAttribute("list_showDetail", list_showDetail);
		ses.setAttribute("newRoleList", newRoleList);
		ses.setAttribute("show_Name", list_showDetail.get(0).getShow_Name());
		ses.setAttribute("reservedNum", reservedNum);
		ses.setAttribute("startDate", list_showDetail.get(0).getStartDate());
		ses.setAttribute("endDate", list_showDetail.get(0).getEndDate());
		System.out.println("show_Name: "+ses.getAttribute("show_Name"));
		System.out.println("reservedNum: "+ses.getAttribute("reservedNum"));
		
		return "marketer/marketerShow/show_Detail";
	}
	
	
	@RequestMapping("/show_Detail_Update.mkt")
	public String show_Detail_Update(HttpSession ses, ShowDTO dto) {
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		List<ShowDTO> list_showDetail = marketerShowMapper.list_showDetail(show_ID);
		List<TheatreDTO> list_Theatre = marketerShowMapper.list_Theatre();
		List<AreaDTO> list_Area = marketerShowMapper.list_Area();
		
		Integer getTheatre_ID = list_showDetail.get(0).getTheatre_ID();
		String theatre_Name = null;
		Integer area_Code = 0;
		String area_Name = null;
		for(int i=0; i<list_Theatre.size(); i++) {
			if(getTheatre_ID == list_Theatre.get(i).getTheatre_ID()) {
				area_Code = list_Theatre.get(i).getTheatre_AreaCode();				
				break;
			}else {
				continue;
			}
		}
		for(int i=0; i<list_Area.size(); i++) {
			if(area_Code == list_Area.get(i).getArea_Code()) {
				area_Name = list_Area.get(i).getArea_Name();
				break;
			}else {
				continue;
			}
		}
		for(int i=0; i<list_Theatre.size(); i++) {
			if(getTheatre_ID == list_Theatre.get(i).getTheatre_ID()) {
				theatre_Name = list_Theatre.get(i).getTheatre_Name();
				break;
			}else {
				continue;
			}
		}
		
		String[] genreList = new String[] {"드라마", "코미디", "판타지", "호러", "희극", "비극"};
		ses.setAttribute("genreList", genreList);

		String[] rateList = new String[]{"전체", "15세 이상", "19세 이상"};
		ses.setAttribute("list_showDetail", list_showDetail);
		ses.setAttribute("rateList", rateList);
		
		String show_Role_Table_Name = list_showDetail.get(0).getShow_Role_Table_Name();
		
		LinkedHashMap<String, String> get_roleList = marketerShowMapper.get_roleList(show_Role_Table_Name);
		List<String> oldRoleList = new ArrayList<String>(get_roleList.values());
		List<String> newRoleList = new ArrayList<String>();
		for(int i=2; i<oldRoleList.size(); i++) {
			 newRoleList.add(oldRoleList.get(i).trim());
		}
		ses.setAttribute("list_Area", list_Area);
		ses.setAttribute("list_Theatre", list_Theatre);
		ses.setAttribute("area_Name", area_Name);
		ses.setAttribute("theatre_Name", theatre_Name);
		ses.setAttribute("genreList", genreList);
		ses.setAttribute("newRoleList", newRoleList);
		
		return "marketer/marketerShow/show_Detail_Update";
	}
	
	
	@RequestMapping("/show_Detail_Update_Ok.mkt")
    public String show_Detail_Update_Ok(HttpSession ses, HttpServletRequest req, @ModelAttribute ShowDTO dto){
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		dto.setMarketer_UID((Integer) ses.getAttribute("marketer_UID"));
		List<TheatreDTO> list_Theatre = marketerShowMapper.list_Theatre();
		String theatre_Name = req.getParameter("theatre_Name");
		for(int i=0; i<list_Theatre.size(); i++) {
			if(theatre_Name.equals( list_Theatre.get(i).getTheatre_Name())) {
				dto.setTheatre_ID(list_Theatre.get(i).getTheatre_ID());
				break;
			}else {
				continue;
			}
		}
		dto.setShow_Status(0);
		MultipartFile posterFile = ((MultipartHttpServletRequest) req).getFile("poster");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		String posterFileName = uuid+"_"+posterFile.getOriginalFilename();
		dto.setPosterName(posterFileName);
		if (posterFile.getSize()==0) {
			posterFile = ((MultipartHttpServletRequest) req).getFile("poster2");
			dto.setPosterName(((MultipartHttpServletRequest) req).getParameter("poster2"));
		}else {        
	        try {
	            File filePath = new File(req.getSession().getServletContext().getRealPath("/resources/files/show/"));
	            if(!filePath.exists()){
	                filePath.mkdirs();
	            }else {
	            	posterFile.transferTo(new File(req.getSession().getServletContext().getRealPath("/resources/files/show/") +posterFileName));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
       marketerShowMapper.update_show(dto);
        return "redirect:show_Detail.mkt?show_ID="+show_ID;
    }
	
	
	@RequestMapping("/show_Detail_Delete_Ok.mkt")
	public String delete_show(HttpSession ses) {
		Integer show_ID = (Integer) ses.getAttribute("show_ID");
		marketerShowMapper.delete_show(show_ID);
		
		return"redirect:myPage.mkt";
	}

	
}
