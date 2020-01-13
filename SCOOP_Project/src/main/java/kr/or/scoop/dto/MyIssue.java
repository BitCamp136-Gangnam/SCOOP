package kr.or.scoop.dto;

import java.util.Arrays;
import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class MyIssue {
	
	private int piseq;
	private String[] pfilename;
	private int[] pfilesize;
	private String pititle;
	private String picontent;
	private Date[] pistart;
	private Date[] piend;
	private int ispibook;
	private String email;
	private Date pidate;
	private String[] mygfilename;
	private String[] mymention;
	private String[] myurl;
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
	}
	public String[] getPfilename() {
		return pfilename;
	}
	public void setPfilename(String[] pfilename) {
		this.pfilename = pfilename;
	}
	public int[] getPfilesize() {
		return pfilesize;
	}
	public void setPfilesize(int[] pfilesize) {
		this.pfilesize = pfilesize;
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
	public Date[] getPistart() {
		return pistart;
	}
	public void setPistart(Date[] pistart) {
		this.pistart = pistart;
	}
	public Date[] getPiend() {
		return piend;
	}
	public void setPiend(Date[] piend) {
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
	public String[] getMygfilename() {
		return mygfilename;
	}
	public void setMygfilename(String[] mygfilename) {
		this.mygfilename = mygfilename;
	}
	public String[] getMymention() {
		return mymention;
	}
	public void setMymention(String[] mymention) {
		this.mymention = mymention;
	}
	public String[] getMyurl() {
		return myurl;
	}
	public void setMyurl(String[] myurl) {
		this.myurl = myurl;
	}
	@Override
	public String toString() {
		return "MyIssue [piseq=" + piseq + ", pfilename=" + Arrays.toString(pfilename) + ", pfilesize="
				+ Arrays.toString(pfilesize) + ", pititle=" + pititle + ", picontent=" + picontent + ", pistart="
				+ Arrays.toString(pistart) + ", piend=" + Arrays.toString(piend) + ", ispibook=" + ispibook + ", email="
				+ email + ", pidate=" + pidate + ", mygfilename=" + Arrays.toString(mygfilename) + ", mymention="
				+ Arrays.toString(mymention) + ", myurl=" + Arrays.toString(myurl) + "]";
	}

}
