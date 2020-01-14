package kr.or.scoop.dao;

import java.util.List;

import kr.or.scoop.dto.Notice;

public interface NoticeDao {
	
	//공지사항 리스트 
	public List<Notice> getNotice();
	
	//공지사항 작성
	public int insertNotice(Notice notice);
	
	//공지사항 디테일
	public Notice detailNotice(int bnseq);
	
	//공지사항 수정
	public Notice updateNotice(int bnseq);
}	
