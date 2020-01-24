package kr.or.scoop.dto;

public class Mention {
	private int tiseq;
	private int tmseq;
	private String email;
	private String name;
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
	}
	public int getTmseq() {
		return tmseq;
	}
	public void setTmseq(int tmseq) {
		this.tmseq = tmseq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Mention [tiseq=" + tiseq + ", tmseq=" + tmseq + ", email=" + email + ", name=" + name + "]";
	}
	
}
