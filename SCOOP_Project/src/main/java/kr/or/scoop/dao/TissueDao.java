package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Mention;
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

	public int addTBookMark(int tiseq, String email);
	public int delTBookMark(int tiseq, String email);
	
	public int fileInsert(int tseq, String fdname, long fdcapa, String email);
	public int myFileInsert(String pfdname, long pdcapa, String email);
	
	public int mentionInsert(String email);
	
	
}
