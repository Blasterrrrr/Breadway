package com.musical.breadway.mapper.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.ReserveDTO;


@Service
public class UserReserveMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
		
	public List<Map<String, String>> getReserveList(int consumer_UID) {
		List<Map<String, String>> list = sqlSession.selectList("getReserveList", consumer_UID);
		System.out.println(list);
			return list;
	}
	
	public List<Map<String, String>> getReserveCancelList(int consumer_UID) {
		System.out.println(consumer_UID);
		List<Map<String, String>> list = sqlSession.selectList("getReserveCancelList", consumer_UID);
		System.out.println(list);
			return list;
	}
	
	
	
	public List<Map<String, String>> getReserveShow(int order_num) {
		List<Map<String, String>> list = sqlSession.selectList("reserveShow", order_num);
		System.out.println(list);
		return list;
	}
	
	public List<Map<String, String>> getReserveCancelShow(int order_num) {
		List<Map<String, String>> list = sqlSession.selectList("reserveCancelShow", order_num);
		System.out.println(list);
		return list;
	}
	
	public List<Map<String, String>> getReserveData(int order_num) {
		List<Map<String, String>> list = sqlSession.selectList("getReserveData", order_num);
		return list;
	}
	
	public int reserveCancel(int order_num) {
		int res = sqlSession.update("reserveCancel",order_num);
		return res;
	}
	
	public int deleteSeat(int seat_id) {
		int res = sqlSession.delete("SeatDelete", seat_id);
		return res;
	}
	public int insertReserveNumber(int user_id) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("reserve_id", 0);
		map.put("user_id", user_id);

		sqlSession.insert("insertReserveNumber", map);
		System.out.println(map.get("reserve_id"));
		return map.get("reserve_id");
	}
	
	public int insertReserve(List<ReserveDTO> list) {
		int result = sqlSession.insert("insertReserve", list);
		return result;
	}
	
	public List<ReserveDTO> findReserveSeat(int order_num){
		List<ReserveDTO> reserveList = sqlSession.selectList("findReserveSeat", order_num);
		
		for(ReserveDTO dto : reserveList) {
			System.out.println(dto.getSeat_ID());
			System.out.println(dto.getSeat_Name());
		}
		
		return reserveList;
	}
	
	public int deleteReserve() {
		return 0;
	}

}
