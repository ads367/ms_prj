package com.ms_prj.spring_mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ms_prj.spring_mvc.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession session = null;
	
	// 아이디 중복 체크
	public int memberID_Check(String memberID) throws Exception {
		return session.selectOne("member.memberID_Check", memberID);
	}
	// 회원가입
	public int member_Join(MemberDTO memberDTO) throws Exception {
		return session.insert("member.member_Join", memberDTO);
	}
	// 로그인
	public MemberDTO member_Login(String memberID) throws Exception {
		return session.selectOne("member.member_Login", memberID);
	}
	// 회원정보 가져오기
	public MemberDTO member_Info(MemberDTO memberDTO) throws Exception {
		return session.selectOne("member.member_Info", memberDTO);
	}
	// 회원정보 수정
	public int member_Update(MemberDTO memberDTO) throws Exception {
		return session.update("member.member_Update", memberDTO);
	}
	// 비밀번호 찾기
	public void password_Search(MemberDTO memberDTO) throws Exception {
		session.update("member.password_Search", memberDTO);
	}
}
