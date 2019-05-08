package com.ms_prj.spring_mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms_prj.spring_mvc.dao.LikeDAO;
import com.ms_prj.spring_mvc.dto.LikeDTO;

@Service
public class LikeService {

	@Autowired
	LikeDAO likeDAO;
	
	// 좋아요 중복확인
	public int like_Check(LikeDTO likeDTO) throws Exception {
		return likeDAO.like_Check(likeDTO);
	}
	// 좋아요 추가
	public void like_Up(LikeDTO likeDTO) throws Exception {
		likeDAO.like_Up(likeDTO);
	}
	// 좋아요 제거
	public void like_Delete(LikeDTO likeDTO) throws Exception {
		likeDAO.like_Delete(likeDTO);
	}
}
