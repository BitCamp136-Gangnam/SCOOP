package kr.or.scoop.dto;

import org.springframework.stereotype.Repository;

@Repository
public class Tpmember {
	private int tseq;
	private String email;
	private int pjuserrank;
	private String pname;
	
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
	@Override
	public String toString() {
		return "Tpmember [tseq=" + tseq + ", email=" + email + ", pjuserrank=" + pjuserrank + ", pname=" + pname + "]";
	}
	
	
}
