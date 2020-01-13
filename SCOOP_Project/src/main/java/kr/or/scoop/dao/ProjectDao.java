package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.ProjectMemberlist;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.dto.Tpmember;

public interface ProjectDao {
	//프로젝트 생성 1
	public int insertPJT(TeamPjt team);
	
	//프로젝트 생성 2
	public int insertPJT2(String email, int tseq);
	
	//프로젝트 리스트 
	public List<Tpmember> getPJT(String email);
	
	//프로젝트 디테일
	public TeamPjt detailPJT(int tseq);
	
	//팀이슈 리스트
	public List<Tissue> getTissue(int tseq);
	
	//프로젝트 멤버 리스트 출력 -- 도연
	public List<ProjectMemberlist> projectMemberlist(int tseq);
}
