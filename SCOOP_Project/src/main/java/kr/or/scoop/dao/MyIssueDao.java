package kr.or.scoop.dao;

import java.sql.Timestamp;
import java.util.List;

import kr.or.scoop.dto.BookMark;
import kr.or.scoop.dto.DoWork;
import kr.or.scoop.dto.FileDrive;
import kr.or.scoop.dto.GoogleDrive;
import kr.or.scoop.dto.Mention;
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
	
	//팀이슈 수정
	public int editTissue(MyIssue tissue);
	//마이이슈 수정
	public int editMyissue(MyIssue myissue);
	public int pfileEdit(String pfdname, long pdcapa, String email, int piseq);
	public int pfileDelete(int pdseq);
	public int pmentionDelete(int pmseq);
	public int pmentionEdit(String email, int piseq);
	public int pgoogleDriveDelete(int pgseq);
	public int pgoogleDriveEdit(String pgfilename, String pgurl, int piseq);
	public int pdoWorkDelete(int pwseq);
	public int pdoWorkEdit(String fromWork, String toWork, String pdoWork, int piseq);
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
	
	//나의이슈 멘션 리스트 출력
	public List<Mention> getMyMentions(int piseq);
	
	//나의이슈 구글드라이브 출력
	public List<GoogleDrive> getMyGoogleDrive(int piseq);

	//나의이슈 할일 출력
	public List<DoWork> getMyDoWork(int piseq);
	//나의이슈 할일 출력
	public List<FileDrive> getMyFiles(int piseq);
	//팀이슈 캘린더 수정
	public int editTeamCalendar(Tissue tissue);
	
	//팀이슈 캘린더 삭제
	public int deleteTeamCalendar(Tissue tissue);
}
