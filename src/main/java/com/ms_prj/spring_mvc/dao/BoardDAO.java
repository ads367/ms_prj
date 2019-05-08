package com.ms_prj.spring_mvc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ms_prj.spring_mvc.dto.BoardDTO;
import com.ms_prj.spring_mvc.dto.Criteria;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession session = null;
	
	// 글 작성
	public int board_Write(BoardDTO boardDTO) throws Exception {
		return session.insert("board.board_Write", boardDTO);
	}
	// 작성글 리스트
	public List<BoardDTO> board_List(Criteria cri) throws Exception {
		return session.selectList("board.board_List", cri);
	}
	// 글의 총 개수
	public int boardCount_All(Criteria cri) throws Exception {
		return (Integer) session.selectOne("board.boardCount_All", cri);
	}
	// 작성글 보기
	public BoardDTO board_Read(BoardDTO boardDTO) throws Exception {
		return session.selectOne("board.board_Read", boardDTO);
	}
	// 글 수정
	public int board_Update(BoardDTO boardDTO) throws Exception {
		return session.update("board.board_Update", boardDTO);
	}
	// 글 삭제
	public void board_Delete(Map map) throws Exception {
		session.update("board.board_Delete", map);
	}
	// 조회수
	public int board_Count(BoardDTO boardDTO) throws Exception {
		return session.update("board.board_Count", boardDTO);
	}
	// 좋아요 카운트 증가
	public int boardLike_Up(BoardDTO boardDTO) throws Exception {
		return session.update("board.boardLike_Up", boardDTO);
	}
	// 좋아요 카운트 감소
	public int boardLike_Down(BoardDTO boardDTO) throws Exception {
		return session.update("board.boardLike_Down", boardDTO);
	}
	// 좋아요 갯수
	public int boardLike_Count(BoardDTO boardDTO) throws Exception {
		return (Integer) session.selectOne("board.boardLike_Count", boardDTO);
	}
	
}
