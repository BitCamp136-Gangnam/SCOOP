package kr.or.scoop.dto;

import java.sql.Timestamp;

public class PrivateFileDrive {
	private int pdseq;
	private int pdcapa;
	private String pfdname;
	private Timestamp pfddate;
	private String email;
	private int piseq;
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
	public Timestamp getPfddate() {
		return pfddate;
	}
	public void setPfddate(Timestamp pfddate) {
		this.pfddate = pfddate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
	}
	@Override
	public String toString() {
		return "FileDrive [pdseq=" + pdseq + ", pdcapa=" + pdcapa + ", pfdname=" + pfdname + ", pfddate=" + pfddate
				+ ", email=" + email + ", piseq=" + piseq + "]";
	}

}
