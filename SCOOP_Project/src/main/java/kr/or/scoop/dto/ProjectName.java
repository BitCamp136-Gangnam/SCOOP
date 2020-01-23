package kr.or.scoop.dto;

public class ProjectName {
	private int tseq;
	private int tiseq;
	private String pname;
	
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	@Override
	public String toString() {
		return "ProjectName [tseq=" + tseq + ", tiseq=" + tiseq + ", pname=" + pname + "]";
	}
}
