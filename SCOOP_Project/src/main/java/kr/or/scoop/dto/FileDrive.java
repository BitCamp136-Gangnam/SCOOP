package kr.or.scoop.dto;

import java.sql.Timestamp;

public class FileDrive {
	private int fdseq;
	private int fdcapa;
	private String fdname;
	private String email;
	private Timestamp fddate;
	private String pname;
	private int tseq;
	private int pdseq;
	private int pdcapa;
	private String pfdname;
	private int piseq;
	public int getFdseq() {
		return fdseq;
	}
	public void setFdseq(int fdseq) {
		this.fdseq = fdseq;
	}
	public int getFdcapa() {
		return fdcapa;
	}
	public void setFdcapa(int fdcapa) {
		this.fdcapa = fdcapa;
	}
	public String getFdname() {
		return fdname;
	}
	public void setFdname(String fdname) {
		this.fdname = fdname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getFddate() {
		return fddate;
	}
	public void setFddate(Timestamp fddate) {
		this.fddate = fddate;
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
	public int getPdseq() {
		return pdseq;
	}
	public void setPdseq(int pdseq) {
		this.pdseq = pdseq;
	}
	public int getPdcapa() {
		return pdcapa;
	}
	public void setPdcapa(int pdcapa) {
		this.pdcapa = pdcapa;
	}
	public String getPfdname() {
		return pfdname;
	}
	public void setPfdname(String pfdname) {
		this.pfdname = pfdname;
	}
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
	}
	@Override
	public String toString() {
		return "FileDrive [fdseq=" + fdseq + ", fdcapa=" + fdcapa + ", fdname=" + fdname + ", email=" + email
				+ ", fddate=" + fddate + ", pname=" + pname + ", tseq=" + tseq + ", pdseq=" + pdseq + ", pdcapa="
				+ pdcapa + ", pfdname=" + pfdname + ", piseq=" + piseq + "]";
	}

}
