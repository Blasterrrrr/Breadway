package com.musical.breadway.controller.manager;

import java.util.*;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.musical.breadway.dto.ReserveDTO;
import com.musical.breadway.dto.ScheduleManageDTO;
import com.musical.breadway.dto.SeatDTO;
import com.musical.breadway.dto.ShowManageDTO;
import com.musical.breadway.dto.Venue_SeatsDTO;
import com.musical.breadway.mapper.manager.Manager_ShowManageMapper;

@Controller
public class Manager_ShowManageController {
	
	@Autowired
	private Manager_ShowManageMapper showmanageMapper;
	
	private static final String UPLOAD_PATH = "D:/../study3/breadway/src/main/webapp/resources/files/show";//파일 업로드 경로
	
	@RequestMapping("/manager_index.do")
	public String ManagerIndex(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		return "manager/index";
	}
	@RequestMapping("/showmanage_top.do")
	public String top(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		return "manager/top";
	}
	
	@RequestMapping("/showmanage_main.do")//공연 메인 페이지로 이동
	public ModelAndView main(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int rowCount = showmanageMapper.ManagershowmaingetCount();
		if (endRow > rowCount) endRow = rowCount;
		List<ShowManageDTO> list = showmanageMapper.ManagerlistShow(String.valueOf(startRow),String.valueOf(endRow));
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;
		
		mav.addObject("rowCount", rowCount);
		mav.addObject("pageBlock", pageBlock);
		mav.addObject("currentPage", currentPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageSize", pageSize);
		mav.addObject("pageCount", pageCount);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("show_list", list);
		mav.setViewName("manager/showmanage/showmanage_main");
		return mav;
	}
	
	@RequestMapping("/show_keyword.do")//공연 이름 검색
	public ModelAndView search(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String showsearch = req.getParameter("showsearch");
		String showString = req.getParameter("showString");
		if(showString.equals("")) {
			mav.setViewName("manager/showmanage/showmanage_keyword");
			mav.addObject("showsearch",showsearch);
			mav.addObject("showString",showString);
			mav.addObject("search_list", null);
			return mav;
		}
		showString = "%"+showString+"%";
		List<ShowManageDTO> search = showmanageMapper.ManagersearchShow(showsearch,showString);
		mav.setViewName("manager/showmanage/showmanage_keyword");
		mav.addObject("showsearch",showsearch);
		mav.addObject("showString",showString);
		mav.addObject("search_list", search);
		return mav;
	}
	
	@RequestMapping("/show_content.do")//공연 정보 자세히 보기
	public ModelAndView content(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String id = req.getParameter("show_id");
		ShowManageDTO dto = showmanageMapper.ManagergetShow(id);
		mav.setViewName("manager/showmanage/showmanage_content");
		mav.addObject("getShow",dto);
		return mav;
	}
	
	@RequestMapping("/showmanage_theatrerequest.do")//극장별 공연 스케쥴 확인
	public ModelAndView alltheatrerequest(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		List<ShowManageDTO> alltheatrerequestlist = showmanageMapper.ManagergetAllTheatreSchedule();
		mav.setViewName("manager/showmanage/showmanage_theatrerequest");
		mav.addObject("alltheatrerequestlist",alltheatrerequestlist);
		return mav;
	}
	
	@RequestMapping("/showmanage_theatrerequestshowcontent.do")
	public ModelAndView alltheatreshowcontent(HttpServletRequest req) {//선택한 극장의 공연 리스트를 보여줌
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String theatre_id = req.getParameter("theatre_id");
		List<ShowManageDTO> tshowlist = showmanageMapper.ManagergetAllTheatreShowContent(theatre_id);
		mav.setViewName("manager/showmanage/showmanage_theatrerequestshowcontent");
		mav.addObject("tshowlist",tshowlist);
		return mav;
	}
	
	@RequestMapping("/showmanage_theatrerequestshowchoice.do")
	public String alltheatreshowchoice(HttpServletRequest req) {//극장 내 공연 승인 요청 수락 및 거절 
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
		String show_id = req.getParameter("show_id");
		String theatre_id = req.getParameter("theatre_id");
		String mode = req.getParameter("mode");
		String msg = null;
		String url = null;
		String modenum = null;
		System.out.println("show_id : "+show_id+" mode : "+mode);
		if(mode.equals("grant")) {//승인 수락
			modenum = "1";
			msg = "승인 요청을 수락했습니다.";
		}else{//승인 거절
			modenum = "2";
			msg = "승인 요청을 거절했습니다.";
		}
		System.out.println("modenum : "+modenum);
		int res = showmanageMapper.ManagerAllTheatreShowGrantChoice(modenum,show_id);
		url = "showmanage_theatrerequest.do";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "manager/message";
	}
	
	@RequestMapping("/showmanage_theatrecontent.do")//공연 장소 자세히 보기
	public ModelAndView theatrecontent(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String theatre_id = req.getParameter("theatre_id");
		ShowManageDTO tdto = showmanageMapper.Managertheatrecontent(Integer.parseInt(theatre_id));
		mav.setViewName("manager/showmanage/showmanage_theatrecontent");
		mav.addObject("theatrelist",tdto);
		return mav;
	}
	
	@RequestMapping("/showmanage_theatreupdateForm.do")//공연 장소 수정 페이지
	public ModelAndView theatreupdate(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String theatre_id = req.getParameter("theatre_id");
		if (theatre_id != null) { 
			ShowManageDTO tdto = showmanageMapper.Managertheatrecontent(Integer.parseInt(theatre_id));
			mav.addObject("theatrelist",tdto);
		}
		mav.setViewName("manager/showmanage/showmanage_theatreupdate");
		return mav;
	}
	
	@RequestMapping("/showmanage_theatreupdateok.do")//공연 장소 업데이트 
	public ModelAndView theatreupdateok(HttpServletRequest req , ShowManageDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String msg = "공연 장소 수정 되었습니다.";
		String url = "showmanage_theatreupdateForm.do";
		int res = showmanageMapper.ManagerupdateTheatre(dto);
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/showmanage_delete.do")//삭제 요청시 공연 관련 테이블 및 삭제
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String show_id = req.getParameter("id");
		String show_name = req.getParameter("name");
		String[] filter = {"[", "]", "{", "}", "\\", "|", "~", "`", " ", "\"", "'", "!", "?", "@", "#", "$", "%", "^", "&", "*(", ")", "-", "", "+", "=", "", "/", ",", ".", ":", ";"};//비교 문자열
		
		for(int j=0; j<filter.length; j++) {
			show_name = show_name.replace(filter[j], "");
	    }
		
		show_name = "musical_"+show_name + "_role";
		System.out.println("삭제할 배역 테이블 :"+show_name);
		String msg = "요청에 수락 하시겠습니까?";
		String url = "showmanage_main.do";
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		int res4 = showmanageMapper.Managerdeleteschedule(show_id);//해당 공연 스케쥴 삭제
		int res1 = showmanageMapper.ManagerdeleteCastinfo(show_id);//해당 공연 배우 정보 삭제
		int res2 = showmanageMapper.ManagerdeleteShow(show_id);//해당 공연 삭제
		int res3 = showmanageMapper.ManagerdeleteRole(show_name);//해당 역할 삭제 drop table musical_<show_name>_role
		return mav;
	}
	
	@RequestMapping("/PosterUpdate.do")//공연 포스터 업데이트 화면으로 이동
	public ModelAndView ImageUpdate(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String show_id = req.getParameter("id");
		ShowManageDTO dto = showmanageMapper.ManagergetShow(show_id);
		mav.setViewName("manager/showmanage/PosterUpdate");
		mav.addObject("getShow",dto);
		return mav;
	}

	@RequestMapping("/PosterUpdateOk.do")//공연 포스터 업데이트
	public String ImageUpdateok(@RequestParam("poster") MultipartFile file,HttpServletRequest req) throws IllegalStateException, IOException {
		String id = req.getParameter("show_id");
		if(!file.getOriginalFilename().isEmpty()) {
			String uuid = UUID.randomUUID().toString().replace("-", "");
			String filena = uuid+"_"+file.getOriginalFilename();
			file.transferTo(new File(UPLOAD_PATH,filena));//파일 저장 (파일경로, 파일이름)
			int res = showmanageMapper.Managerimageupdate(filena, id);
			System.out.println("파일 업로드 성공! 파일 이름 :"+filena);
		}else {
			System.out.println("파일 업로드 실패!");
		}
		
		return "manager/showmanage/PosterUpdate";
	}
	
	@RequestMapping("/showmanage_updateForm.do")//공연 정보 수정 페이지 이동
	public ModelAndView updateForm(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String show_id = req.getParameter("id");
		ShowManageDTO dto = showmanageMapper.ManagergetShow(show_id);
		mav.setViewName("manager/showmanage/showmanage_update");
		mav.addObject("getShow",dto);
		return mav;
	}
	
	@RequestMapping("/showmanage_updateok.do")//공연 정보 수정
	public ModelAndView updataok(HttpServletRequest req,ShowManageDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		int res = showmanageMapper.ManagerupdateShow(dto);
		mav.setViewName("redirect:showmanage_main.do");
		return mav;
	}
	
	@RequestMapping("/show_seat.do")//공연 스케쥴 표시
	public ModelAndView seatmain(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String show_id = req.getParameter("show_id");
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int rowCount = showmanageMapper.ManagershowschedulegetCount(Integer.parseInt(show_id));
		
		if (endRow > rowCount) endRow = rowCount;
		List<ScheduleManageDTO> list = showmanageMapper.Managerseatinfo(String.valueOf(startRow),String.valueOf(endRow),show_id);
		List<ScheduleManageDTO> totalprofit = showmanageMapper.Managershowtotalprofit(show_id);
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;
		
		mav.setViewName("manager/showmanage/showmanage_seat");
		mav.addObject("rowCount", rowCount);
		mav.addObject("pageBlock", pageBlock);
		mav.addObject("currentPage", currentPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageSize", pageSize);
		mav.addObject("pageCount", pageCount);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("show_id",show_id);
		mav.addObject("schedulelist",list);
		mav.addObject("totalprofit",totalprofit);
		return mav;
	}
	
	@RequestMapping("/showmanage_scheduledelete.do")//해당 하는 날짜 공연 스케쥴 삭제
	public ModelAndView scheduledelete(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String show_id = req.getParameter("show_id");
		String schedule_id = req.getParameter("schedule_id");
		int res = showmanageMapper.Managerscheduledelete(schedule_id, show_id);
		String msg = "선택한 일정을 삭제 하시겠습니까?";
		String url = "showmanage_main.do";
		mav.setViewName("manager/message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/showmanage_scheduleupdate.do")//해당 날짜 공연 스케줄 업데이트 페이지 이동
	public ModelAndView scheduleupdate(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String show_id = req.getParameter("show_id");
		String schedule_id = req.getParameter("schedule_id");
		ScheduleManageDTO dto = showmanageMapper.Managerscheduleget(schedule_id, show_id);
		mav.setViewName("manager/showmanage/showmanage_scheduleupdate");
		mav.addObject("schedulelist",dto);
		return mav;
	}
	
	@RequestMapping("/showmanage_scheduleupdateok.do")//해당 날짜 공연 스케쥴 업데이트 
	public ModelAndView scheduleupdateok(HttpServletRequest req,ScheduleManageDTO dto) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		int res = showmanageMapper.Managerscheduleupdate(dto);
		mav.setViewName("manager/showmanage/showmanage_scheduleupdate");
		return mav;
	}
	
	@RequestMapping("/showmanage_seatcontent.do")//해당 날짜 공연 스케쥴 에대한 모든 좌석 표시 일수익
	public ModelAndView seatcontent(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String show_id = req.getParameter("show_id");
		String schedule_id = req.getParameter("schedule_id");
		System.out.println(show_id+","+schedule_id);
		
		List<Venue_SeatsDTO> framelist = showmanageMapper.Managervenue_seatFrame(Integer.parseInt(show_id));
		List<SeatDTO> seatdto = showmanageMapper.Managergetseat(schedule_id);
		String[] below  = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10"};
		mav.setViewName("manager/showmanage/showmanage_seatcontent");
		mav.addObject("seatdto",seatdto);
		mav.addObject("framelist",framelist);
		mav.addObject("below",below);
		return mav;
	}
	
	@RequestMapping("/showmanage_seatdetail.do")//해당 좌석의 대한 모든 정보 표시하는 페이지
	public ModelAndView seatdetail(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String seat_id = req.getParameter("seat_ID");
		SeatDTO detailist = showmanageMapper.Managerseatdetail(seat_id);
		mav.setViewName("manager/showmanage/showmanage_seatdetail");
		mav.addObject("detailist",detailist);
		return mav;
	}
	
	@RequestMapping("/showmanage_seatrequest.do")//예매 정보
	public ModelAndView seatrequest(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String show_id = req.getParameter("show_id");
		String schedule_id = req.getParameter("schedule_id");
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int rowCount = showmanageMapper.Managergetseatrequestcount(show_id,schedule_id);
		
		if (endRow > rowCount) endRow = rowCount;
		List<ReserveDTO> requestlist = showmanageMapper.Managerseatrequest(String.valueOf(startRow),String.valueOf(endRow),show_id, schedule_id);
		int pageCount = rowCount / pageSize + (rowCount%pageSize == 0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;
		
		mav.addObject("rowCount", rowCount);
		mav.addObject("pageBlock", pageBlock);
		mav.addObject("currentPage", currentPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageSize", pageSize);
		mav.addObject("pageCount", pageCount);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("show_id",show_id);
		mav.addObject("schedule_id",schedule_id);
		mav.setViewName("manager/showmanage/showmanage_seatrequest");
		mav.addObject("requestlist",requestlist);
		return mav;
	}
	
	@RequestMapping("/showmanage_seatrequestcancel.do")//예매 좌석 취소
	public ModelAndView seatrequestcancel(HttpServletRequest req) throws IOException{
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         mav.setViewName("message");
	         mav.addObject("msg", msg);
	         mav.addObject("url", url);
	         return mav;
		}
		String order_num = req.getParameter("order_num");
		String schedule_ID = req.getParameter("schedule_ID");
		System.out.println("order_num:"+order_num+"schedule_ID:"+schedule_ID);
		int cancelcount = showmanageMapper.Managerseatrequestcancelordernumcount(Integer.parseInt(order_num));//취소하려는 좌석 갯수
		System.out.println("order_numcount:"+cancelcount);
		if (cancelcount < 0) {//resert_seat_qty 가 0이하의 값일때 0으로 수정해 준다.
			int resetseat_qty = showmanageMapper.Managerseatqtyresetschedule(schedule_ID);
		}
		int scheduleqtyupdate = showmanageMapper.Managerseatrequestcancelschedule(String.valueOf(cancelcount), schedule_ID);//예약된 총좌석 - 취소 좌석 갯수
		int res = showmanageMapper.Managerseatrequestcancel(Integer.parseInt(order_num));//reserve에 포함된 seat에 대한 정보를 가지고 seat삭제(취소)
		int res2 = showmanageMapper.Managerseatrequestcanceldateupdate(Integer.parseInt(order_num));//reserve 예매 취소 날짜 업데이트
		List<ReserveDTO> requestcompletelist = showmanageMapper.Managerseatrequestcancelcomplete(Integer.parseInt(order_num));
		mav.setViewName("manager/showmanage/showmanage_seatrequestresult");
		mav.addObject("requestcompletelist",requestcompletelist);
		return mav;
	}
	
	@RequestMapping("/showmanage_theatremapload.do")//극장 지도
	public String map(HttpServletRequest req){
		HttpSession ses = req.getSession();
		if(ses.getAttribute("admin") == null){
	         String msg = "로그인을 먼저 해주세요.";
	         String url="login.do";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
		}
			int theatre_ID = Integer.parseInt(req.getParameter("placenum"));
			ShowManageDTO dto= showmanageMapper.Managertheatrecontent(theatre_ID);
			req.setAttribute("theatre", dto);
		return "manager/showmanage/showmanage_theatremap";
	}
	
	
}