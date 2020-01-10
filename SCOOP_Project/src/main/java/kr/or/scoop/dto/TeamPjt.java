package kr.or.scoop.dto;


import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class TeamPjt {
	private int tseq;
	private String email;
	private String pname;
	private String pcontent;
	private Date ptime;
	private int istpalarm;
	private int ischarge;
	
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public Date getPtime() {
		return ptime;
	}
	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}
	public int getIstpalarm() {
		return istpalarm;
	}
	public void setIstpalarm(int istpalarm) {
		this.istpalarm = istpalarm;
	}
	public int getIscharge() {
		return ischarge;
	}
	public void setIscharge(int ischarge) {
		this.ischarge = ischarge;
	}
	
	@Override
	public String toString() {
		return "TeamPjt [tseq=" + tseq + ", email=" + email + ", pname=" + pname + ", pcontent=" + pcontent + ", ptime="
				+ ptime + ", istpalarm=" + istpalarm + ", ischarge=" + ischarge + "]";
	}
	
	
}
