package com.ms_prj.spring_mvc.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ms_prj.spring_mvc.dto.MemberDTO;
import com.ms_prj.spring_mvc.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired
	MemberService service;
	
	// 회원가입 페이지로 이동
	@RequestMapping(value="/join_Page", method=RequestMethod.GET)
	public String join_Page() throws Exception {
		return "/member/join";
	}
	// 아이디 중복 체크
	@RequestMapping(value="/checkID", method=RequestMethod.POST)
	@ResponseBody
	public String checkID(String memberID) throws Exception {
		int IdCheck = service.memberID_Check(memberID);
		String result = "0";
		if(IdCheck == 1) {
			result = "1";
			return result;
		} else {
			return result;
		}
	}
	// 회원가입 프로세스
	@RequestMapping(value="/joinAction", method=RequestMethod.POST)
	public String join_Action(@ModelAttribute MemberDTO memberDTO) throws Exception {
		service.member_Join(memberDTO);
		return "redirect:/";
	}
	// 로그인 페이지로 이동
	@RequestMapping(value="/login_Page", method=RequestMethod.GET)
	public String login_Page() throws Exception {
		return "/member/login";
	}
	// 로그인 프로세스
	@RequestMapping(value="/loginAction", method=RequestMethod.POST)
	public String login_Action(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response,
					HttpSession session) throws Exception {
		memberDTO = service.member_Login(memberDTO, response);
		session.setAttribute("sessionMemberID", memberDTO.getMemberID());
		session.setAttribute("memberName", memberDTO.getMemberName());
		session.setAttribute("memberIDX", memberDTO.getMemberIDX());
		return "redirect:/";
	}
	// 로그아웃
	@RequestMapping(value="/logoutAction", method=RequestMethod.GET)
	public String logout_Action(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	// 회원정보 페이지로 이동
	@RequestMapping(value="/Info_Page", method=RequestMethod.GET)
	public String memberInfo_View(@ModelAttribute MemberDTO memberDTO, Model model,
				HttpSession session, HttpServletResponse response) throws Exception {
		String sessionID = (String) session.getAttribute("sessionMemberID");
		String memberid = memberDTO.getMemberID();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
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
			model.addAttribute("memberDTO", service.member_Info(memberDTO));
			return "/member/info";
		}
	}
	// 회원정보 수정 페이지로 이동
	@RequestMapping(value="/memberInfo_updateView", method=RequestMethod.GET)
	public String memberInfo_UpdateView(@ModelAttribute MemberDTO memberDTO, Model model,
			HttpSession session, HttpServletResponse response) throws Exception {
		String sessionID = (String) session.getAttribute("sessionMemberID");
		String memberid = memberDTO.getMemberID();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
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
			model.addAttribute("memberDTO", service.member_Info(memberDTO));
			return "/member/update";
		}
	}
	// 회원정보 수정 프로세스
	@RequestMapping(value="/updateAction", method=RequestMethod.POST)
	public String memberInfo_UpdateAction(@ModelAttribute MemberDTO memberDTO, HttpSession session) throws Exception {
		service.member_Update(memberDTO);
		String sessionID = (String) session.getAttribute("sessionMemberID");
		String url = "/member/Info_Page?memberID=";
		return "redirect:" + url + sessionID;
	}
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/passwordSearch_View", method=RequestMethod.GET)
	public String passwordSearch_View() throws Exception {
		return "/member/passwordSearch";
	}
	// 비밀번호 찾기 이메일 전송
	@RequestMapping(value="/searchAction", method=RequestMethod.POST)
	public String passwordSearch_Action(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response) throws Exception {
		service.password_Search(response, memberDTO);
		return "/member/login_Page";
	}
}
