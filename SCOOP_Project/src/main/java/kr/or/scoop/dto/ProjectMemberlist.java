package kr.or.scoop.dto;

public class ProjectMemberlist {
	private String email;
	private String name;
	private int tseq;
	private int pjuserrank;
	
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
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public int getPjuserrank() {
		return pjuserrank;
	}
	public void setPjuserrank(int pjuserrank) {
		this.pjuserrank = pjuserrank;
	}

	@Override
	public String toString() {
		return "ProjectMemberlist [email=" + email + ", name=" + name + ", tseq=" + tseq + ", pjuserrank=" + pjuserrank
				+ "]";
	}
	
	
}