package kr.or.scoop.vo;

import java.sql.Date;

public class Member {
	String email;
	String pwd;
	String name;
	String dname;
	String drank;
	String addrress;
	Date idteme;
	int mrank;
	int loginnum;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDrank() {
		return drank;
	}
	public void setDrank(String drank) {
		this.drank = drank;
	}
	public String getAddrress() {
		return addrress;
	}
	public void setAddrress(String addrress) {
		this.addrress = addrress;
	}
	public Date getIdteme() {
		return idteme;
	}
	public void setIdteme(Date idteme) {
		this.idteme = idteme;
	}
	public int getMrank() {
		return mrank;
	}
	public void setMrank(int mrank) {
		this.mrank = mrank;
	}
	public int getLoginnum() {
		return loginnum;
	}
	public void setLoginnum(int loginnum) {
		this.loginnum = loginnum;
	}
	@Override
	public String toString() {
		return "Member [email=" + email + ", pwd=" + pwd + ", name=" + name + ", dname=" + dname + ", drank=" + drank
				+ ", addrress=" + addrress + ", idteme=" + idteme + ", mrank=" + mrank + ", loginnum=" + loginnum + "]";
	}
	
	
}
