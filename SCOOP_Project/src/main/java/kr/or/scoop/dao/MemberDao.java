package kr.or.scoop.dao;

import javax.servlet.http.HttpSession;

import kr.or.scoop.dto.Member;


public interface MemberDao {
	
	//회원정보 
	public Member getMember(String email);
	
	// 일반회원 회원가입
	public int insertMember(Member member);
	
	// 로그인 검증
	public int loginCheck(String email, String pwd);
	
	// 회원 패스워드 암호화 체크
	public Member pwdCheck(String email);
	
	// 구글로그인
	public int googleIdCheck(String email, String name);
	
	// 구글아이디 등록
	public int googleInsertCheck(String email, String name);
	
	// 네이버아이디 등록
	public int naverInsertCheck(String email, String name);
	
	// 아이디 중복체크
	public int idCheck(String email);
	
	//회원 수정
	public int updateMember(Member member);
	
}
