package com.musical.breadway.mapper.manager;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.ReserveDTO;
import com.musical.breadway.dto.ScheduleManageDTO;
import com.musical.breadway.dto.SeatDTO;
import com.musical.breadway.dto.ShowManageDTO;
import com.musical.breadway.dto.Venue_SeatsDTO;

@Service
public class Manager_ShowManageMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ShowManageDTO> ManagerlistShow(String startRow, String endRow){
		Map<String,String> map = new Hashtable<String,String>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ShowManageDTO> list = sqlSession.selectList("ManagerlistShow",map);
		return list;
	} 
	
	public List<ShowManageDTO> ManagersearchShow(String showsearch,String showString){
		Map<String,String> map = new Hashtable<String,String>();
		map.put("showsearch", showsearch);
		map.put("showString", showString);
		List<ShowManageDTO> list = sqlSession.selectList("ManagersearchShow",map);
		return list;
	} 
	
	public int ManagershowmaingetCount() {
		int count = sqlSession.selectOne("ManagershowmaingetCount");
		return count;
	}
	
	public int ManagershowschedulegetCount(int show_id) {
		int count = sqlSession.selectOne("ManagershowschedulegetCount",show_id);
		return count;
	}

	public ShowManageDTO ManagergetShow(String show_id) {
		ShowManageDTO dto = sqlSession.selectOne("ManagergetShow",show_id);
		return dto;
	}
	
	public int Managerdeleteschedule(String show_id) {
		int res = sqlSession.delete("Managerdeleteschedule",show_id);
		return res;
	}
	
	public int ManagerdeleteShow(String show_id) {
		int res = sqlSession.delete("ManagerdeleteShow",show_id);
		return res;
	}
	
	public int ManagerdeleteCastinfo(String show_id) {
		int res = sqlSession.delete("ManagerdeleteCastinfo",show_id);
		return res;
	}
	
	public int ManagerdeleteRole(String show_name) {
		System.out.println(show_name);
		int res = sqlSession.update("ManagerdeleteRole",show_name);
		return res;
	}
	
	public int ManagerupdateShow(ShowManageDTO dto) {
		int res = sqlSession.update("ManagerupdateShow",dto);
		return res;
	}
	
	public int Managerimageupdate(String postername, String show_id) {
		Map<String,String> map = new Hashtable<String,String>();
		map.put("postername", postername);
		map.put("show_id", show_id);
		int res = sqlSession.update("ManagerImageUpdate",map);
		return res;
	}

	public List<Venue_SeatsDTO> Managervenue_seatFrame(int show_id){
		List<Venue_SeatsDTO> list = sqlSession.selectList("Managervenue_seatFrame",show_id);
		return list;
	}
	
	public List<ScheduleManageDTO> Managershowtotalprofit(String show_id){
		List<ScheduleManageDTO> list = sqlSession.selectList("Managershowtotalprofit",show_id);
		return list;
	}
	
	public List<ScheduleManageDTO> Managerseatinfo(String startRow, String endRow, String show_id){
		Map<String,String> map = new Hashtable<String,String>();
		map.put("show_id", show_id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ScheduleManageDTO> list = sqlSession.selectList("Managerseatinfo",map);
		return list;
	}
	
	public List<SeatDTO> Managergetseat(String schedule_id){
		List<SeatDTO> seatlist = sqlSession.selectList("Managergetseat",schedule_id);
		return seatlist;
	}
	
	public int Managerscheduledelete(String schedule_id, String show_id) {
		Map<String,String> map = new Hashtable<String,String>();
		map.put("schedule_id", schedule_id);
		map.put("show_id", show_id);
		int res = sqlSession.delete("Managerscheduledelete",map);
		return res;
	}
	
	public ScheduleManageDTO Managerscheduleget(String schedule_id, String show_id) {
		Map<String,String> map = new Hashtable<String,String>();
		map.put("schedule_id", schedule_id);
		map.put("show_id", show_id);
		ScheduleManageDTO dto = sqlSession.selectOne("Managerscheduleget",map);
		return dto;
	}
	
	public SeatDTO Managerseatdetail(String seat_ID){
		SeatDTO seatlist = sqlSession.selectOne("Managerseatdetail",seat_ID);
		return seatlist;
	}
	
	public int Managerscheduleupdate(ScheduleManageDTO dto) {
		int res = sqlSession.update("Managerscheduleupdate",dto);
		return res;
	}
	
	public List<ReserveDTO> Managerseatrequest(String startRow, String endRow, String show_id, String schedule_id) {
		Map<String,String> map = new Hashtable<String,String>();
		map.put("show_id", show_id);
		map.put("schedule_id", schedule_id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ReserveDTO> requestlist = sqlSession.selectList("Managerseatrequest", map);
		return requestlist;
	}
	
	public int Managerseatrequestcancelordernumcount(int order_num) {
		int res = sqlSession.selectOne("Managerseatrequestcancelordernumcount",order_num);
		return res;
	}
	
	public int Managerseatqtyresetschedule(String schedule_id) {
		int res = sqlSession.update("Managerseatqtyresetschedule",schedule_id);
		return res;
	}
	
	public int Managerseatrequestcancelschedule(String cancelcount, String schedule_id) {
		Map<String,String> map = new Hashtable<String,String>();
		map.put("cancelcount", cancelcount);
		map.put("schedule_id", schedule_id);
		int res = sqlSession.update("Managerseatrequestcancelschedule",map);
		return res;
	}
	
	public int Managergetseatrequestcount(String show_id, String schedule_id) {
		Map<String,String> map = new Hashtable<String,String>();
		map.put("show_id", show_id);
		map.put("schedule_id", schedule_id);
		int res = sqlSession.selectOne("Managergetseatrequestcount",map);
		return res;
	}
	
	public int Managerseatrequestcancel(int order_num) {
		int res = sqlSession.delete("Managerseatrequestcancel", order_num);
		return res;
	}
	
	public int Managerseatrequestcanceldateupdate(int order_num) {
		int res = sqlSession.delete("Managerseatrequestcanceldateupdate", order_num);
		return res;
	}
	
	public List<ReserveDTO> Managerseatrequestcancelcomplete(int order_num){
		List<ReserveDTO> list = sqlSession.selectList("Managerseatrequestcancelcomplete",order_num); 
		return list;
	}
	
	public ShowManageDTO Managertheatrecontent(int theatre_id) {
		ShowManageDTO theatrelist = sqlSession.selectOne("ManagergetTheatre",theatre_id);
		return theatrelist;
	}
	
	public int ManagerupdateTheatre(ShowManageDTO dto) {
		int res = sqlSession.update("ManagerupdateTheatre",dto);
		return res;
	}
	
	public List<ShowManageDTO> ManagergetAllTheatreSchedule(){
		List<ShowManageDTO> list = sqlSession.selectList("ManagergetAllTheatreSchedule");
		return list;
	}
	
	public List<ShowManageDTO> ManagergetAllTheatreShowContent(String theatre_id){
		List<ShowManageDTO> list = sqlSession.selectList("ManagergetAllTheatreShowContent",theatre_id);
		return list;
	}
	
	public int ManagerAllTheatreShowGrantChoice(String modenum,String show_id) {
		System.out.println(modenum+","+show_id);
		Map<String,String> map = new Hashtable<String,String>();
		map.put("modenum", modenum);
		map.put("show_id", show_id);
		System.out.println(map);
		int res = sqlSession.update("ManagerAllTheatreShowGrantChoice",map);
		return res;
	}
}
