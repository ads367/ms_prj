package com.ms_prj.spring_mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms_prj.spring_mvc.dao.BoardDAO;
import com.ms_prj.spring_mvc.dto.BoardDTO;
import com.ms_prj.spring_mvc.dto.Criteria;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	// 글 작성
	public int board_Write(BoardDTO boardDTO) throws Exception {
		return boardDAO.board_Write(boardDTO);
	}
	// 작성글 리스트
	public List<BoardDTO> board_List(Criteria cri) throws Exception {
		return boardDAO.board_List(cri);
	}
	// 글의 총 개수
	public int boardCount_All(Criteria cri) throws Exception {
		return boardDAO.boardCount_All(cri);
	}
	// 작성글 보기
	public BoardDTO board_Read(BoardDTO boardDTO) throws Exception {
			boardDAO.board_Count(boardDTO);
		return boardDAO.board_Read(boardDTO);
	}
	// 글 수정
	public int board_Update(BoardDTO boardDTO) throws Exception {
		return boardDAO.board_Update(boardDTO);
	}
	// 글 삭제
	public void board_Delete(Map map) throws Exception {
		boardDAO.board_Delete(map);
	}
	// 좋아요 카운트 추가
	public int boardLike_Up(BoardDTO boardDTO) throws Exception {
		return boardDAO.boardLike_Up(boardDTO);
	}
	// 좋아요 카운트 감소
	public int boardLike_Down(BoardDTO boardDTO) throws Exception {
		return boardDAO.boardLike_Down(boardDTO);
	}
	// 좋아요 갯수
	public int boardLike_Count(BoardDTO boardDTO) throws Exception {
		return boardDAO.boardLike_Count(boardDTO);
	}

}
