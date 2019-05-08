package com.ms_prj.spring_mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms_prj.spring_mvc.dao.CommentDAO;
import com.ms_prj.spring_mvc.dto.CommentDTO;

@Service
public class CommentService {

	@Autowired
	CommentDAO commentDAO;
	
	// 댓글 작성
	public int comment_Write(CommentDTO commentDTO) throws Exception {
		return commentDAO.comment_Write(commentDTO);
	}
	// 댓글 리스트
	public List<CommentDTO> comment_List(CommentDTO commentDTO) throws Exception {
		return commentDAO.comment_List(commentDTO);
	}
	// 댓글 삭제
	public void comment_Delete(Map map) throws Exception {
		commentDAO.comment_Delete(map);
	}
}
