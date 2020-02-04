package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.DoWork;
import kr.or.scoop.dto.FileDrive;
import kr.or.scoop.dto.GoogleDrive;
import kr.or.scoop.dto.Mention;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.Process;
import kr.or.scoop.dto.Reply;
import kr.or.scoop.dto.Tissue;

public interface TissueDao {
	
	//칸반 불러오기
	public List<Tissue> loadKanban(int tseq);
	
	public int teamSetting(int pjuserrank, int tseq, String email);
	//칸반 수정
	public int kanbanEdit(int tseq, int tiseq, int isprocess);
	//멤버탈퇴	
	public int banMember(int tseq, String email);
	//팀장위임
	public int changeMember(int tseq, String email);
	public int changeMemberTp(int tseq, String email);
	public int changeMemberTp2(int tseq, String email);
	public int dropProject(int tseq);
	
	//팀 이슈 디테일
	public Tissue teamissueDetail(int tiseq);
	
	//팀이슈 댓글
	public int teamComment(int tiseq,String rcontent,String email);
	
	//팀이슈 댓글 리스트 출력
	public List<Reply> teamCommentOk(int tiseq);
	
	//팀이슈 멘션 리스트 출력
	public List<Mention> getMentions(int tiseq);
	
	//팀이슈 구글드라이브 출력
	public List<GoogleDrive> getGoogleDrive(int tiseq);

	//팀이슈 할일 출력
	public List<DoWork> getDoWork(int tiseq);
	
	//팀이슈 파일 출력
	public List<FileDrive> getFiles(int tiseq);
	
	//팀이슈 댓글 삭제
	public int delComment(int replyseq);
	
	//북마크 추가/제거
	public int addTBookMark(int tiseq, String email);
	public int delTBookMark(int tiseq, String email);
	
	public int fileInsert(int tseq, String fdname, long fdcapa, String email);
	public int fileEdit(int tseq, String fdname, long fdcapa, String email, int tiseq);
	public int myFileInsert(String pfdname, long pdcapa, String email);
	public int fileDelete(int fdseq);
	public int mentionInsert(String email);
	public int mentionEdit(String email, int tiseq);
	public int mentionDelete(int tmseq);
	public int myMentionInsert(String email);
	public int googleDriveInsert(String tgfilename, String tgurl);
	public int googleDriveEdit(String tgfilename, String tgurl, int tiseq);
	public int googleDriveDelete(int tgseq);
	public int myGoogleDriveInsert(String pgfilename,String pgurl);
	public int doWorkInsert(String email, String toEmail, String doWork);
	public int doWorkEdit(String email, String toEmail, String doWork, int tiseq);
	public int doWorkDelete(int tdseq);
	public int myDoWorkInsert(String email, String ptoEmail, String pdoWork);
	public List chartData(int tseq, int isprocess);
	public List<Long> getOriFilesize(int tiseq);
	public List<Long> getMyOriFilesize(int piseq);
	//칸반 게시글 상태 정보
	public Process chartData(int tseq);
	
	//팀이슈 리스트 받아오기
	public List<Tissue> getTissueList(int tseq);
	
	public int teamIssueFileDelete(int tiseq);
	public int teamIssueMentionDelete(int tiseq);
	public int teamIssueGoogleDriveDelete(int tiseq);
	public int teamIssueDoWorkDelete(int tiseq);
	public int teamIssueDelete(int tiseq);
}
