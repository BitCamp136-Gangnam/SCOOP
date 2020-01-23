package kr.or.scoop.dto;

import java.sql.Timestamp;

public class PjNotice {
	private int pnseq;
	private int tseq;
	private String pntitle;
	private String pncontent;
	private Timestamp pntime;
	private String email;
	private String name;
	private String pname;
	private String pcontent;
	
	public int getPnseq() {
		return pnseq;
	}
	public void setPnseq(int pnseq) {
		this.pnseq = pnseq;
	}
	public String getPntitle() {
		return pntitle;
	}
	public void setPntitle(String pntitle) {
		this.pntitle = pntitle;
	}
	public String getPncontent() {
		return pncontent;
	}
	public void setPncontent(String pncontent) {
		this.pncontent = pncontent;
	}
	
	public Timestamp getPntime() {
		return pntime;
	}
	public void setPntime(Timestamp pntime) {
		this.pntime = pntime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	
	@Override
	public String toString() {
		return "PjNotice [pnseq=" + pnseq + ", pntitle=" + pntitle + ", pncontent=" + pncontent + ", pntime=" + pntime
				+ ", email=" + email + ", tseq=" + tseq + ", name=" + name + ", pname=" + pname + ", pcontent="
				+ pcontent + "]";
	}
	

}
