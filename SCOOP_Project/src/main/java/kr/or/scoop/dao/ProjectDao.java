package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.TeamPjt;

public interface ProjectDao {

	public int insertPJT(TeamPjt team);
	public List<TeamPjt> getPJT(String email);
}
