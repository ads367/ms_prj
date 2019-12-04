 package com.ms_prj.spring_mvc.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ms_prj.spring_mvc.dto.BoardDTO;
import com.ms_prj.spring_mvc.dto.CommentDTO;
import com.ms_prj.spring_mvc.dto.Criteria;
import com.ms_prj.spring_mvc.dto.LikeDTO;
import com.ms_prj.spring_mvc.dto.PageMaker;
import com.ms_prj.spring_mvc.service.BoardService;
import com.ms_prj.spring_mvc.service.CommentService;
import com.ms_prj.spring_mvc.service.LikeService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	BoardService service;	// 게시판
	
	@Autowired
	LikeService likeservice;	// 좋아요
	
	@Autowired
	CommentService commentservice;	// 댓글
	
	// 자유게시판 리스트로 이동
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList_View(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		PageMaker pageMaker = new PageMaker(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.boardCount_All(cri));
		model.addAttribute("list", service.board_List(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "/board/boardList";
	}
	// 자유게시판 글쓰기 페이지로 이동
	@RequestMapping(value="/write_Page", method=RequestMethod.GET)
	public String boardWrite_View(HttpSession session, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String sessionID = (String) session.getAttribute("sessionMemberID");
		if(sessionID == "" || sessionID == null) {
			out.println("<script>");
			out.println("alert('로그인 후 작성이 가능합니다.');");
			out.println("location.href='/member/login_Page';");
			out.println("</script>");
			out.close();
			return "";
		} else {
			return "/board/boardWrite";
		}
	}
	// 자유게시판 글쓰기 프로세스
	@RequestMapping(value="/boardWrite_Action", method=RequestMethod.POST)
	public String boardWrite_Action(@ModelAttribute BoardDTO boardDTO, HttpSession session) throws Exception {
		String sessionID = (String) session.getAttribute("sessionMemberID");
		boardDTO.setMemberID(sessionID);
		service.board_Write(boardDTO);
		String returnURL = "/board/boardList";
		return "redirect:"+returnURL;
	}
	// 작성 글 보기
	@RequestMapping(value="/boardRead", method=RequestMethod.GET)
	public String boardRead_View(@ModelAttribute BoardDTO boardDTO, @ModelAttribute CommentDTO commentDTO,
				@ModelAttribute LikeDTO likeDTO, Model model, HttpSession session) throws Exception {
		likeDTO.setBoardIDX(service.board_Read(boardDTO).getBoardIDX());
		likeDTO.setMemberID((String) session.getAttribute("sessionMemberID"));
		int likeCheck = likeservice.like_Check(likeDTO);
		String alreadyCheckUser = "false";
		if(likeCheck > 0) {
			alreadyCheckUser = "true";
		}
		model.addAttribute("clist", commentservice.comment_List(commentDTO));
		model.addAttribute("boardDTO", service.board_Read(boardDTO));
		model.addAttribute("alreadyCheckUser", alreadyCheckUser);
		return "/board/boardRead";
	}
	// 글 수정 페이지로 이동
	@RequestMapping(value="/update_Page", method=RequestMethod.GET)
	public String boardUpdate_View(@ModelAttribute BoardDTO boardDTO, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String sessionID = (String) session.getAttribute("sessionMemberID");
		String memberid = boardDTO.getMemberID();
		if(sessionID == null) {
			out.println("<script>");
			out.println("alert('권한이 없습니다!!!');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else if(!sessionID.equals(memberid)) {
			out.println("<script>");
			out.println("alert('권한이 없습니다!!!');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			model.addAttribute("boardDTO", service.board_Read(boardDTO));
			return "/board/boardUpdate";
		}
	}
	// 글 수정 프로세스
	@RequestMapping(value="/boardUpdate_Action", method=RequestMethod.POST)
	public String boardUpdate_Action(@ModelAttribute BoardDTO boardDTO, HttpSession session) throws Exception {
		String returnURL = "/";
		String sessionID = (String) session.getAttribute("sessionMemberID");
		if(sessionID.equals(boardDTO.getMemberID())) {
			service.board_Update(boardDTO);
			String boardidx = "?boardIDX="+boardDTO.getBoardIDX();
			returnURL = "/board/boardRead"+boardidx;
		}
		return "redirect:"+returnURL;
	}
	// 글 삭제 프로세스
	@RequestMapping(value="/boardDelete_Action", method=RequestMethod.GET)
	public String boardDelete_Action(@RequestParam Map map, HttpServletRequest request, @Param("type") String type) throws Exception {
		type = request.getParameter("type");
		map.put("type", type);
		service.board_Delete(map);
		commentservice.comment_Delete(map);
		String returnURL = "/board/boardList";
		return "redirect:"+returnURL;
	}

}
