package kr.or.scoop.dao;

import kr.or.scoop.dto.Tifile;
import kr.or.scoop.dto.Tissue;

public interface TissueDao {
	//팀이슈 작성
	public int writeTissue(Tissue tissue);
	
	//팀이슈 파일업로드
	public int uploadFiles(Tifile tf);
	
	//팀이슈 마지막 시퀀스 
	public int getSeq(Tissue tissue);
}
