package kr.or.scoop.dto;

public class BookMark {
	private int piseq;
	private int tiseq;
	private String email;
	
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
	}
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "BookMark [piseq=" + piseq + ", tiseq=" + tiseq + ", email=" + email + "]";
	}
}
