package com.ms_prj.spring_mvc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ms_prj.spring_mvc.dto.CommentDTO;
import com.ms_prj.spring_mvc.service.CommentService;

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	
	@Autowired
	CommentService service;
	
	// 댓글 작성 프로세스
	@RequestMapping(value="/commentWriteAction", method=RequestMethod.POST)
	@ResponseBody
	public String commentWriteAction(@ModelAttribute CommentDTO commentDTO) throws Exception {
		int result = service.comment_Write(commentDTO);
		return String.valueOf(result);
	}
	// 댓글 작성 시 ajax로 댓글 리스트 불러오기
	@RequestMapping(value="/commentList", method=RequestMethod.GET)
	@ResponseBody
	public List<CommentDTO> commentListAjaxCall(@ModelAttribute CommentDTO commentDTO) throws Exception {
		List<CommentDTO> commentList = service.comment_List(commentDTO);
		return commentList;
	}
	// 댓글 삭제
	@RequestMapping(value="/commentDelete", method=RequestMethod.GET)
	public String commentDeleteAction(@RequestParam Map map, HttpServletRequest request, @Param("type") String type) throws Exception {
		type = request.getParameter("type");
		map.put("type", type);
		service.comment_Delete(map);
		String boardidx = "?boardIDX="+request.getParameter("boardIDX");
		String returnURL = "/board/boardRead"+boardidx;
		return "redirect:"+returnURL;
	}
	
}
