package com.musical.breadway.mapper.user;

import java.sql.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.CastInfoDTO;
import com.musical.breadway.dto.QuestDTO;
import com.musical.breadway.dto.ReserveDTO;
import com.musical.breadway.dto.ReviewDTO;
import com.musical.breadway.dto.ShowDTO;
import com.musical.breadway.dto.TheatreDTO;


@Service
public class UserShowMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ShowDTO> getAllShowList() {
		List<ShowDTO> list = sqlSession.selectList("getAllShowList");
		return list;
	}
	
	public List<ShowDTO> getDateShowList(Map<String, String> params) {
		List<ShowDTO> list = sqlSession.selectList("getDateShowList", params);
		
		return list; 
	}
	
	public List<ShowDTO> getListShow(String genre) {
		System.out.println("getListShow맵퍼에서 받은 값 : "+ genre);
		List<ShowDTO> list = sqlSession.selectList("genreListShow", genre);
		return list;
	}
	
	public List<Map<String, String>> getFindList(Map<String, String> params) {
		List<Map<String, String>> list = sqlSession.selectList("getFindList", params);
		return list;
	}
	
	public List<Map<String , String>> getMainFindList(Map<String, String> params){
	List<Map<String, String>> list = sqlSession.selectList("getMainFindList", params);
	return list;
	}
	
	public List<Map<String, String>> getShow(int show_id) {
		List<Map<String, String>> list = sqlSession.selectList("getShow", show_id);
		return list;
	}
	
	public List<CastInfoDTO> getPart(int show_id) {
		List<CastInfoDTO> dto = sqlSession.selectList("getPart", show_id);
		return dto;
	}
	
	//극장이름 가져와서 지도 출력
		public TheatreDTO getTheatre(int theatre_ID) {
			TheatreDTO dto = sqlSession.selectOne("getPlace",theatre_ID);//오류발생
			System.out.println(dto);
			return dto;
		}
		//후기게시판
		public int maxReview() {
			int max = sqlSession.selectOne("maxReview");
			System.out.println(max);
			return max;
		}
		public int getReviewCount(int show_ID) {
			int count = sqlSession.selectOne("getReviewCount", show_ID);
			return count;
		}
		public List<ReviewDTO> listReview(int show_ID,int start,int end){
			Map<String,Integer> map = new Hashtable<String,Integer>();
			map.put("show_ID",show_ID);
			map.put("startRow", start);
			map.put("endRow", end);
			List<ReviewDTO> list = sqlSession.selectList("listReview",map);
			return list;
		}
		public List<ReserveDTO> getDate(int consumer_UID){
			List<ReserveDTO> review = sqlSession.selectList("viewDate",consumer_UID);
			System.out.println("viewDate:"+review);
			return review;
		}
		public int insertReview(ReviewDTO dto) {
			int res = sqlSession.insert("insertReview",dto);
			return res;
		}
		public int deleteReview(int num) {
			int res = sqlSession.delete("deleteReview",num);
			return res;
		}
		public int updateReview(ReviewDTO dto) {
			int res = sqlSession.update("updateReview",dto);
			return res;
		}
		public List<ReviewDTO> findReview(String search,String searchString){
			java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
			map.put("search",search);
			map.put("searchString",searchString);
			List<ReviewDTO> findList = sqlSession.selectList("findReview",map);
			return findList;
		}
		public int getReserveCheck(int show_ID,int consumer_UID) {
			java.util.Map<String,Integer> map = new java.util.Hashtable<String,Integer>();
			map.put("show_ID", show_ID);
			map.put("consumer_UID",consumer_UID);
			int res = sqlSession.selectOne("reserveCheck",map);
			return res;
		}
		public List<ReviewDTO> getReview(int num) {
			List<ReviewDTO> dto = sqlSession.selectList("getReview",num);
			System.out.println("getReview:"+dto);
			return dto;
		}
		
		public ReviewDTO writeCheck(int show_ID, Date view_date, String writer) {
			java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
			map.put("show_ID",String.valueOf(show_ID));
			map.put("view_date",String.valueOf(view_date));
			map.put("writer",writer);
			ReviewDTO check = sqlSession.selectOne("writeCheck",map);
			return check;
			
		}
		//문의게시판

		public int getQuestCount(int show_ID) {
			int count = sqlSession.selectOne("getQuestCount", show_ID);
			return count;
		}
		public List<QuestDTO> listQuest(int show_ID,int start,int end){
			Map<String,Integer> map = new Hashtable<String,Integer>();
			map.put("show_ID",show_ID);
			map.put("startRow", start);
			map.put("endRow", end);
			List<QuestDTO> list = sqlSession.selectList("listQuest",map);
			return list;
		}
		public List<QuestDTO> findQuest(String searchString){
			List<QuestDTO> Quest = sqlSession.selectList("findQuest",searchString);
			return Quest;
		}
		public ShowDTO showMarketer(Integer show_ID) {
			ShowDTO dto = sqlSession.selectOne("showMarketer",show_ID);
			return dto;
		}
		public int insertQuest(QuestDTO dto) {
			int res = sqlSession.insert("insertQuest",dto);
			return res;
		}
		public int deleteQuest(int num) {
	         int res = sqlSession.delete("deleteQuest",num);
	         return res;
	      }
		public int updateQuest(QuestDTO dto) {
			int res = sqlSession.update("updateQuest", dto);
			return res;
		}
		public QuestDTO getQuest(int num) {
			QuestDTO dto = sqlSession.selectOne("getQuest",num);
			return dto;
		}
		public int reContent(QuestDTO dto) {
			int res = sqlSession.update("reContent",dto);
			return res;
		}

		
		
}
