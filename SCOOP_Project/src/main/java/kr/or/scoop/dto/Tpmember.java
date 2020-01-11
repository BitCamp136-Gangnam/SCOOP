package kr.or.scoop.dto;

import org.springframework.stereotype.Repository;

@Repository
public class Tpmember {
	private int tseq;
	private String email;
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
	@Override
	public String toString() {
		return "Tpmember [tseq=" + tseq + ", email=" + email + "]";
	}
	
}
