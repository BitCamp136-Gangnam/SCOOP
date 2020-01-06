package kr.or.scoop.dao;

import kr.or.scoop.dto.Member;


public interface MemberDao {
	
	public int insertMember(Member member);
	
	public int loginCheck(Member member);
	
}
