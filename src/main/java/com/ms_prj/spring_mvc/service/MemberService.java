package com.ms_prj.spring_mvc.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms_prj.spring_mvc.dao.MemberDAO;
import com.ms_prj.spring_mvc.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	// 아이디 중복 체크
	public int memberID_Check(String memberID) throws Exception {
		return memberDAO.memberID_Check(memberID);
	}
	// 회원가입
	public int member_Join(MemberDTO memberDTO) throws Exception {
		return memberDAO.member_Join(memberDTO);
	}
	// 로그인
	public MemberDTO member_Login(MemberDTO memberDTO, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(memberDAO.memberID_Check(memberDTO.getMemberID()) == 0) {
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			String pw = memberDTO.getMemberPassword();
			memberDTO = memberDAO.member_Login(memberDTO.getMemberID());
			if(!memberDTO.getMemberPassword().equals(pw)) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀렸습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			} else {
				return memberDTO;
			}
		}
	}
	// 회원정보 가져오기
	public MemberDTO member_Info(MemberDTO memberDTO) throws Exception {
		return memberDAO.member_Info(memberDTO);
	}
	// 회원정보 수정
	public int member_Update(MemberDTO memberDTO) throws Exception {
		return memberDAO.member_Update(memberDTO);
	}
	// 비밀번호 찾기
	public void password_Search(HttpServletResponse response, MemberDTO memberDTO) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(memberDAO.memberID_Check(memberDTO.getMemberID()) == 0) {
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else if(!memberDTO.getMemberEmail().equals(memberDAO.member_Login(memberDTO.getMemberID()).getMemberEmail())) {
			out.println("<script>");
			out.println("alert('등록된 이메일이 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			String tempPw = "";			// 임시 비밀번호 생성
			for(int i = 0; i < 10; i++) {
				tempPw += (char) ((Math.random() * 26) + 97);
			}
			memberDTO.setMemberPassword(tempPw);
			memberDAO.password_Search(memberDTO);		// 비밀번호 변경
			sendEmail(memberDTO, "password_Search");	// 변경된 비밀번호 이메일로 발송
			out.println("<script>");
			out.println("alert('이메일로 임시 비밀번호를 전송했습니다.');");
			out.println("location.href='/member/login_Page';");
			out.println("</script>");
			out.close();
		}
	}
	
	public void sendEmail(MemberDTO memberDTO, String div) throws Exception {	// 이메일 발송
		// 메일 서버 설정
		String charSet = "UTF-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "ads367";
		String hostSMTPpwd = "비밀번호입력";
		
		// 보내는 사람 메일 및 내용
		String fromEmail = "ads367@naver.com";
		String fromName = "MS prj";
		String subject = "";
		String msg = "";
		
		if(div.equals("password_Search")) {
			subject = "MS prj 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid #dddddd;'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberDTO.getMemberID() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하시기 바랍니다.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberDTO.getMemberPassword() + "</p></div>";
		}
		
		// 받는 사람 메일 주소
		String mail = memberDTO.getMemberEmail();
		
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch(Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
}
