package kr.or.bit.dao;

import kr.or.bit.dto.Member;


public interface MemberDao {
	
	public int insertMember(Member member);
	
	public int loginCheck(String email, String pwd);
	
}
