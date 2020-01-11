package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.TeamPjt;

public interface ProjectDao {
	public List<TeamPjt> getTissue(int tseq);
	public int insertPJT(TeamPjt team);
	public int insertPJT2(String mailTo, String tseq);
	public List<TeamPjt> getPJT(String email);
	public TeamPjt detailPJT(int tseq);
}
