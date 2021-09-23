package com.musical.breadway.mapper.marketer;

import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.AreaDTO;
import com.musical.breadway.dto.ShowDTO;
import com.musical.breadway.dto.TheatreDTO;


@Service
public class MarketerShowMapper {
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<ShowDTO> list_allShow(Integer marketer_UID){
		List<ShowDTO> list = sqlSession.selectList("list_allShow", marketer_UID);
		return list;
	}
	
	public Integer insert_show(ShowDTO dto) {
		return  sqlSession.insert("insert_show", dto);
	}
	
	public List<TheatreDTO> list_Theatre(){
		List<TheatreDTO> list = sqlSession.selectList("list_Theatre");
		return list;
	}
	
	public List<AreaDTO> list_Area() {
		List<AreaDTO> list = sqlSession.selectList("list_Area");
		return list;
	}
	
	public List<ShowDTO> list_showDetail(Integer show_ID){
		List<ShowDTO> list = sqlSession.selectList("list_showDetail", show_ID);
		return list;
	}

	public String get_TheatreName(Integer theatre_ID) {
		String theatreName = sqlSession.selectOne("get_TheatreName", theatre_ID);
		return theatreName;
	}

	public Integer update_show(ShowDTO dto) {
		return sqlSession.update("update_show", dto);
	}
	
	public Integer get_allReserved(Integer show_ID) {
		return sqlSession.selectOne("get_allReserved", show_ID);
	}
	
	
	public Integer delete_show(Integer show_ID) {
		return sqlSession.update("delete_show", show_ID);
	}

	public Integer create_roleT(String show_Role_Table_Name, List<String> roleListForCT) {
		String sql = "create table " + show_Role_Table_Name;
		sql += "(role_set number primary key, "
				+ "show_ID number not null, "
				+ "foreign key(show_ID) references show(show_ID)";
		
		for(Integer i=0; i<roleListForCT.size(); i++) {
		   	sql += ", role_" + roleListForCT.get(i) + " varchar2(30)";
		}
		sql += ")";
		
		Hashtable<String, String> ht = new Hashtable<String, String>();
		ht.put("sql", sql);
		
		sqlSession.update("create_roleT", ht);
		Integer get_showID = sqlSession.selectOne("get_showID", show_Role_Table_Name);
		return get_showID;
	}

	public Integer insert_role(String show_Role_Table_Name,  Integer show_ID, List<String> roleListForIN) {
		String sql = "insert into " +show_Role_Table_Name+ " values(roleSet_seq.nextval, " + show_ID;
		for(Integer i=0; i<roleListForIN.size(); i++) {
		   	sql += ", '" + roleListForIN.get(i) + "'";
		}
		sql += ")";
		
		Hashtable<String, String> ht = new Hashtable<String, String>();
		ht.put("sql", sql);
		return sqlSession.update("insert_role",ht);
	}
	
	public LinkedHashMap<String, String> get_roleList(String show_Role_Table_Name) {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		ht.put("show_Role_Table_Name", show_Role_Table_Name);
		LinkedHashMap<String, String> hm = sqlSession.selectOne("get_roleList", ht);
		return hm;
	}

	
}
