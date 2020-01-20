package kr.or.scoop.dto;

import java.sql.Timestamp;

public class Reply {
	
	private int replyseq;
	private String rcontent;
	private String email;
	private Timestamp rdate;
	private int tiseq;
	private String name;
	
	public int getReplyseq(){
		return replyseq;
	}
	public void setReplyseq(int replyseq) {
		this.replyseq = replyseq;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "Reply [replyseq=" + replyseq + ", rcontent=" + rcontent + ", email=" + email + ", rdate=" + rdate
				+ ", tiseq=" + tiseq + ", name=" + name + "]";
	}
	
	
}
