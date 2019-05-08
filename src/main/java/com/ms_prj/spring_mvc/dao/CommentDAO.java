package com.ms_prj.spring_mvc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ms_prj.spring_mvc.dto.CommentDTO;

@Repository
public class CommentDAO {

	@Autowired
	SqlSession session = null;
	
	// 댓글 작성
	public int comment_Write(CommentDTO commentDTO) throws Exception {
		return session.insert("comment.comment_Write", commentDTO);
	}
	// 댓글 리스트
	public List<CommentDTO> comment_List(CommentDTO commentDTO) throws Exception {
		return session.selectList("comment.comment_List", commentDTO);
	}
	// 댓글 삭제
	public void comment_Delete(Map map) throws Exception {
		session.delete("comment.comment_Delete", map);
	}
}
