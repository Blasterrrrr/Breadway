package com.musical.breadway.mapper.marketer;

import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.CastInfoDTO;


@Service
public class MarketerCastingMapper {
	@Autowired
	private SqlSession sqlSession;
	
	
//----------castInfo
	public Integer insert_castInfo(CastInfoDTO dto) {
		return  sqlSession.insert("insert_castInfo", dto);
	}

	public List<CastInfoDTO> list_castInfo(Integer show_ID) {
		System.out.println(show_ID);
		List<CastInfoDTO> list = sqlSession.selectList("list_castInfo", show_ID);
		return list;
	}

	public Integer update_cast(CastInfoDTO dto) {
		return sqlSession.update("update_cast", dto);
	}

	public List<CastInfoDTO> get_castInfo(Integer cast_ID) {
		List<CastInfoDTO> list = sqlSession.selectList("get_castInfo", cast_ID);
		return list;
	}
	
	public List<CastInfoDTO> searchByRole(String roleName) {
		List<CastInfoDTO> list = sqlSession.selectList("searchByRole", roleName);
		return list;
	}

	public String get_castPhotoName(Integer cast_ID) {
		return sqlSession.selectOne("get_castPhotoName", cast_ID);
	}
	
	public Integer delete_cast(Integer cast_ID) {
		return sqlSession.update("delete_cast", cast_ID);
	}

	
	
//----------casting pattern
	public Integer count_roleSet(String show_Role_Table_Name) {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		ht.put("show_Role_Table_Name", show_Role_Table_Name);
		Integer count_roleSet = sqlSession.selectOne("count_roleSet", ht);
		return count_roleSet;
	}
	
	public List<LinkedHashMap<String, String>> get_allCastPattern(String show_Role_Table_Name){
		Hashtable<String, String> ht = new Hashtable<String, String>();
		ht.put("show_Role_Table_Name", show_Role_Table_Name);
		List<LinkedHashMap<String, String>> list = sqlSession.selectList("get_allCastPattern", ht);		
		return list;
	}

	public Integer delete_castPattern(String show_Role_Table_Name, Integer pNum) {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		ht.put("show_Role_Table_Name", show_Role_Table_Name);
		String pNum2 = String.valueOf(pNum);
		ht.put("pNum", pNum2);
		return sqlSession.update("delete_castPattern", ht);
	}
	
	
}
