package com.ms_prj.spring_mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ms_prj.spring_mvc.dto.BoardDTO;
import com.ms_prj.spring_mvc.dto.LikeDTO;
import com.ms_prj.spring_mvc.service.BoardService;
import com.ms_prj.spring_mvc.service.LikeService;

@Controller
@RequestMapping(value="/like")
public class LikeController {

	@Autowired
	LikeService service;
	
	@Autowired
	BoardService bservice;
	
	// 중복 체크 후 추가할지 제거할지 결정
	@RequestMapping(value="/like_Check", method=RequestMethod.POST)
	@ResponseBody
	public String like_Check(@ModelAttribute LikeDTO likeDTO, @ModelAttribute BoardDTO boardDTO) throws Exception {
		int likeCheck = service.like_Check(likeDTO);
		int retVal = 0;
		if(likeCheck == 0) {	// 좋아요 추가
			service.like_Up(likeDTO);		// 증가
			bservice.boardLike_Up(boardDTO);	// 보더 count
			retVal = bservice.boardLike_Count(boardDTO);
		} else {				// 좋아요 제거
			service.like_Delete(likeDTO);
			bservice.boardLike_Down(boardDTO);
			retVal = bservice.boardLike_Count(boardDTO);
		}
		return String.valueOf(retVal);
	}
	
	
}
