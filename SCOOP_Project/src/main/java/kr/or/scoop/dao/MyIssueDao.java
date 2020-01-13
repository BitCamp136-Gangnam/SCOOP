package kr.or.scoop.dao;

import kr.or.scoop.dto.MyIssue;

public interface MyIssueDao {
	//나의 이슈 작성
	public int writeMyissue(MyIssue myissue);
}
