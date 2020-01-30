package kr.or.scoop.dto;

import java.sql.Timestamp;

public class Mention {
	private int tiseq;
	private int tmseq;
	private String email;
	private String name;
	private int pmseq;
	private String pemail;
	private int piseq;
	private String pname;
	private int tseq;
	private String tititle;
	private Timestamp tidate;
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
	public int getPmseq() {
		return pmseq;
	}
	public void setPmseq(int pmseq) {
		this.pmseq = pmseq;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public String getTititle() {
		return tititle;
	}
	public void setTititle(String tititle) {
		this.tititle = tititle;
	}
	public Timestamp getTidate() {
		return tidate;
	}
	public void setTidate(Timestamp tidate) {
		this.tidate = tidate;
	}
	@Override
	public String toString() {
		return "Mention [tiseq=" + tiseq + ", tmseq=" + tmseq + ", email=" + email + ", name=" + name + ", pmseq="
				+ pmseq + ", pemail=" + pemail + ", piseq=" + piseq + ", pname=" + pname + ", tseq=" + tseq
				+ ", tititle=" + tititle + ", tidate=" + tidate + "]";
	}
	
}
