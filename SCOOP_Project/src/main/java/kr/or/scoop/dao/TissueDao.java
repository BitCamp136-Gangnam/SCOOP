package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Tissue;

public interface TissueDao {
	//팀이슈 작성
	public int writeTissue(Tissue tissue);
	
	//칸반 불러오기
	public List<Tissue> loadKanban(int tseq);
	
	public int teamSetting(int pjuserrank, int tseq, String email);
	//칸반 수정
	public int kanbanEdit(int tseq, int tiseq, int isprocess);
		
	public int banMember(int tseq, String email);
}
