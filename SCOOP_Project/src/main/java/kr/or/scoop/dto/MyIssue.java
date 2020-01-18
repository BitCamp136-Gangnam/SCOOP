package kr.or.scoop.dto;


import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class MyIssue {
	private int tseq;
	private int piseq;
	private int tiseq;
	private String pfilename;
	private String pfilesize;
	private String pititle;
	private String tititle;
	private String picontent;
	private Date pistart;
	private Date piend;
	private int ispibook;
	private String email;
	private Date pidate;
	private Date tidate;
	private String mygfilename;
	private String mymention;
	private String myurl;
	private String pname;
	private MultipartFile[] files;
	private String tfilename;
	private String tfilesize;
	private int isprocess;
	public int getIsprocess() {
		return isprocess;
	}
	public void setIsprocess(int isprocess) {
		this.isprocess = isprocess;
	}
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
	}
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
	}
	public String getPfilename() {
		return pfilename;
	}
	public void setPfilename(String pfilename) {
		this.pfilename = pfilename;
	}
	public String getPfilesize() {
		return pfilesize;
	}
	public void setPfilesize(String pfilesize) {
		this.pfilesize = pfilesize;
	}
	public String getPititle() {
		return pititle;
	}
	public void setPititle(String pititle) {
		this.pititle = pititle;
	}
	public String getTititle() {
		return tititle;
	}
	public void setTititle(String tititle) {
		this.tititle = tititle;
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
	public Date getTidate() {
		return tidate;
	}
	public void setTidate(Date tidate) {
		this.tidate = tidate;
	}
	public String getMygfilename() {
		return mygfilename;
	}
	public void setMygfilename(String mygfilename) {
		this.mygfilename = mygfilename;
	}
	public String getMymention() {
		return mymention;
	}
	public void setMymention(String mymention) {
		this.mymention = mymention;
	}
	public String getMyurl() {
		return myurl;
	}
	public void setMyurl(String myurl) {
		this.myurl = myurl;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public String getTfilename() {
		return tfilename;
	}
	public void setTfilename(String tfilename) {
		this.tfilename = tfilename;
	}
	public String getTfilesize() {
		return tfilesize;
	}
	public void setTfilesize(String tfilesize) {
		this.tfilesize = tfilesize;
	}
	@Override
	public String toString() {
		return "MyIssue [tseq=" + tseq + ", piseq=" + piseq + ", tiseq=" + tiseq + ", pfilename=" + pfilename
				+ ", pfilesize=" + pfilesize + ", pititle=" + pititle + ", tititle=" + tititle + ", picontent="
				+ picontent + ", pistart=" + pistart + ", piend=" + piend + ", ispibook=" + ispibook + ", email="
				+ email + ", pidate=" + pidate + ", tidate=" + tidate + ", mygfilename=" + mygfilename + ", mymention="
				+ mymention + ", myurl=" + myurl + ", pname=" + pname + ", files=" + Arrays.toString(files)
				+ ", tfilename=" + tfilename + ", tfilesize=" + tfilesize + ", isprocess=" + isprocess + "]";
	}

	
}
