package kr.or.scoop.dao;

import org.springframework.stereotype.Repository;

import kr.or.scoop.vo.Member;

@Repository
public interface MemberDao {
	public int insertMember(Member member);
	
	public int loginCheck(String email, String pwd);
}
