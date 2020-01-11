package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.TeamPjt;

public interface ProjectDao {

	public int insertPJT(TeamPjt team);
	public int insertPJT(String mailTo, String tseq);
	public List<TeamPjt> getPJT(String email);
}
