package kr.or.scoop.dto;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Repository
public class Member {
	private String email;
	private String pwd;
	private String name;
	private CommonsMultipartFile filesrc;
	private String dname;
	private String drank;
	private String address;
	private String idtime;
	private int loginnum;
	private String profile; 

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
	
	public int getLoginnum() {
		return loginnum;
	}
	public void setLoginnum(int loginnum) {
		this.loginnum = loginnum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	
	public String getIdtime() {
		return idtime;
	}
	public void setIdtime(String idtime) {
		this.idtime = idtime;
	}
	
	public CommonsMultipartFile getFilesrc() {
		return filesrc;
	}
	public void setFilesrc(CommonsMultipartFile filesrc) {
		this.filesrc = filesrc;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	@Override
	public String toString() {
		return "Member [email=" + email + ", pwd=" + pwd + ", name=" + name + ", filesrc=" + filesrc + ", dname="
				+ dname + ", drank=" + drank + ", address=" + address + ", idtime=" + idtime + ", loginnum=" + loginnum
				+ ", profile=" + profile + "]";
	}
	
	
}
