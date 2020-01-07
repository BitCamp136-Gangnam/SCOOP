package kr.or.scoop.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Repository
public class Issue {
	private int piseq;
	private CommonsMultipartFile filename;
	private int filesize;
	private String pititle;
	private String picontent;
	private Date pistart;
	private Date piend;
	private int ispibook;
	private String email;
	private Date pidate;
	
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
	}
	public CommonsMultipartFile getFilename() {
		return filename;
	}
	public void setFilename(CommonsMultipartFile filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getPititle() {
		return pititle;
	}
	public void setPititle(String pititle) {
		this.pititle = pititle;
	}
	public String getPicontent() {
		return picontent;
	}
	public void setPicontent(String picontent) {
		this.picontent = picontent;
	}
	public Date getPistart() {
		return pistart;
	}
	public void setPistart(Date pistart) {
		this.pistart = pistart;
	}
	public Date getPiend() {
		return piend;
	}
	public void setPiend(Date piend) {
		this.piend = piend;
	}
	public int getIspibook() {
		return ispibook;
	}
	public void setIspibook(int ispibook) {
		this.ispibook = ispibook;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getPidate() {
		return pidate;
	}
	public void setPidate(Date pidate) {
		this.pidate = pidate;
	}
	
	@Override
	public String toString() {
		return "Issue [piseq=" + piseq + ", filename=" + filename + ", filesize=" + filesize + ", pititle=" + pititle
				+ ", picontent=" + picontent + ", pistart=" + pistart + ", piend=" + piend + ", ispibook=" + ispibook
				+ ", email=" + email + ", pidate=" + pidate + "]";
	}
	
	
	
}
