package kr.or.scoop.dao;

import java.sql.Timestamp;
import java.util.List;

import kr.or.scoop.dto.BookMark;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.PjNotice;
import kr.or.scoop.dto.ProjectName;
import kr.or.scoop.dto.Reply;
import kr.or.scoop.dto.Tissue;

public interface MyIssueDao {
	//팀이슈 작성
	public int writeTissue(MyIssue tissue);
	//나의 이슈 작성
	public int writeMyissue(MyIssue myissue);
	
	
	public List<MyIssue> getMyissue(String email);
	
	//내가 작성한 이슈 리스트
	public List<MyIssue> MyWriteIssueList(String email);
	
	//내가 작성한 팀 이슈 리스트
	public List<MyIssue> MyWriteTiisueList(String email);
	
	//내가 작성한 댓글 리스트
	public List<Reply> MyWriteReplyList(String email);
	
	//개인 북마크 추가
	public int addPBookMark(int piseq, String email);
	
	//개인 북마크 삭제
	public int delPBookMark(int piseq, String email);
	
	//북마크 리스트
	public List<BookMark> getBookMark(String email);
	
	//내가 작성한 이슈 디테일
	public MyIssue myissueDetail(int piseq);

	// 팀이 작성한 팀 이슈 리스트
	public List<Tissue> teamWriteTiisueList(Timestamp idtime);

	// 팀이 작성한 댓글 리스트
	public List<Reply> teamWriteReplyList(Timestamp idtime);
	
	// 팀이 작성한 프로잭트 공지사항 리스트
	public List<PjNotice> teamWriteNoticeList(String email, Timestamp idtime);
	
	// 팀 이름 찾기
	public ProjectName getPjtName(int tseq, int tiseq);
	
	//팀이슈 캘린더 작성
	public int writeCalendarTissue(Tissue tissue);
}
