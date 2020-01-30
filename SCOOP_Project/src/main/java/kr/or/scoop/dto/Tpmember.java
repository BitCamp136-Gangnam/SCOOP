package kr.or.scoop.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

@Repository
public class Tpmember {
	private int tseq;
	private String email;
	private int pjuserrank;
	private String pname;
	private String name;
	private Timestamp tpaddtime;
	private int pnseq;
	
	
	
	public int getPnseq() {
		return pnseq;
	}
	public void setPnseq(int pnseq) {
		this.pnseq = pnseq;
	}
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPjuserrank() {
		return pjuserrank;
	}
	public void setPjuserrank(int pjuserrank) {
		this.pjuserrank = pjuserrank;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getTpaddtime() {
		return tpaddtime;
	}
	public void setTpaddtime(Timestamp tpaddtime) {
		this.tpaddtime = tpaddtime;
	}
	
	@Override
	public String toString() {
		return "Tpmember [tseq=" + tseq + ", email=" + email + ", pjuserrank=" + pjuserrank + ", pname=" + pname
				+ ", name=" + name + ", tpaddtime=" + tpaddtime + ", pnseq=" + pnseq + "]";
	}
	
	
}
