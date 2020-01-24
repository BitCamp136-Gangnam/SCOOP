package kr.or.scoop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.scoop.dto.FileDrive;
import kr.or.scoop.dto.Member;
import kr.or.scoop.dto.PrivateFileDrive;
import kr.or.scoop.dto.ProjectMemberlist;
import kr.or.scoop.dto.Role;
import kr.or.scoop.dto.Tpmember;


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
	
	//권한 체크
	public Role getRole(String email);
	
	//비밀번호 변경
	public int changePassword(@Param("pwd")String pwd, @Param("email")String email);

	//프로젝트 멤버 리스트 출력 -- 도연
	public List<ProjectMemberlist> projectMemberlist(int tseq);
	
	//롤 권한 변경
	public int updateRole(String email);
	
	//프로젝트 갯수 
	public int getCount(String email);
	
	//프로필 사진
	public String getProfile(String email);
	
	//파일함 불러오기
	public List<FileDrive> getFileDrive(String email);
	
	//파일함 불러오기
	public List<FileDrive> getFileProject(String email, int tseq);
	
	//내 파일함 불러오기
	public List<PrivateFileDrive> getMyFile(String email);
	
	//Tpmember 불러오기
	public List<Tpmember> getTpmembers(String email);
}
