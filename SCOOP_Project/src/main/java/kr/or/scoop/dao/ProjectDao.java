package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tpmember;

public interface ProjectDao {
	public List<TeamPjt> getTissue(int tseq);
	public int insertPJT(TeamPjt team);
	public int insertPJT2(String email, int tseq);
	public List<Tpmember> getPJT(String email);
	public TeamPjt detailPJT(int tseq);
}
