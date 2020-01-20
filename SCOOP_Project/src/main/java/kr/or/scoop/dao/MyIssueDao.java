package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.Tissue;

public interface MyIssueDao {
	//나의 이슈 작성
	public int writeMyissue(MyIssue myissue);
	
	
	public List<MyIssue> getMyissue(String email);
	
	//내가 작성한 이슈 리스트
	public List<MyIssue> MyWriteIssueList(String email);
	
	//내가 작성한 팀 이슈 리스트
	public List<MyIssue> MyWriteTiisueList(String email);
	
	//북마크
	public int addBookMark(int piseq, String email);
	public int delBookMark(int piseq, String email);
	
	//내가 작성한 이슈 디테일
	public MyIssue myissueDetail(int piseq);
}
