package kr.or.scoop.dao;

import kr.or.scoop.vo.Member;

public interface MemberDao {
	public int insertMember(Member member);
	
	public int loginCheck(String email, String pwd);
}
