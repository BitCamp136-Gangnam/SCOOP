package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.PjNotice;
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
	

	//프로젝트 수정
	public int updatePjt(TeamPjt teampjt);
	
	//팀 권한 조회
	public int searchRank(int tseq, String email);

	//북마크
	public int addBookMark(int tiseq, String email);
	public int delBookMark(int tiseq, String email);
	
	//북마크 조회
	public int seachBookMark(int tseq);
	
	//프로젝트 공지사항 리스트
	public List<PjNotice> getPjNotice(int tseq);
	
	//프로젝트 공지사항 작성
	public int pjNoticeWrite(PjNotice pjnotice);
}
