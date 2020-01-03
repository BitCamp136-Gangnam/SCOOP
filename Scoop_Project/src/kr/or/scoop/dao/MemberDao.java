package kr.or.scoop.dao;

import kr.or.scoop.vo.Member;

public interface MemberDao {
	public int insertMember(String email, String pwd, String name);
	
	public int loginCheck(String email, String pwd);
}
