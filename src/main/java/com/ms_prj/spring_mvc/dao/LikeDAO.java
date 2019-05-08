package com.ms_prj.spring_mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ms_prj.spring_mvc.dto.LikeDTO;

@Repository
public class LikeDAO {

	@Autowired
	SqlSession session = null;
	
	// 좋아요 중복 검사
	public int like_Check(LikeDTO likeDTO) throws Exception {
		return session.selectOne("boardLike.like_Check", likeDTO);
	}
	// 좋아요 추가
	public void like_Up(LikeDTO likeDTO) throws Exception {
		session.insert("boardLike.like_Up", likeDTO);
	}
	// 좋아요 제거
	public void like_Delete(LikeDTO likeDTO) throws Exception {
		session.delete("boardLike.like_Delete", likeDTO);
	}
}
