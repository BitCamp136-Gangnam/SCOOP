package kr.or.scoop.dto;


import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

@Repository
public class Notice {
	private int bnseq;
	private String bntitle;
	private String bncontent;
	private Timestamp bntime;
	private String email;
	
	
	public int getBnseq() {
		return bnseq;
	}
	public void setBnseq(int bnseq) {
		this.bnseq = bnseq;
	}
	public String getBntitle() {
		return bntitle;
	}
	public void setBntitle(String bntitle) {
		this.bntitle = bntitle;
	}
	public String getBncontent() {
		return bncontent;
	}
	public void setBncontent(String bncontent) {
		this.bncontent = bncontent;
	}
	
	public Timestamp getBntime() {
		return bntime;
	}
	public void setBntime(Timestamp bntime) {
		this.bntime = bntime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "Notice [bnseq=" + bnseq + ", bntitle=" + bntitle + ", bncontent=" + bncontent + ", bntime=" + bntime
				+ ", email=" + email + "]";
	}
	
	
}
