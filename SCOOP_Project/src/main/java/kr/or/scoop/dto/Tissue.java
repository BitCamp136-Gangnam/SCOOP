package kr.or.scoop.dto;


import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Repository
public class Tissue {
	
	private int tiseq;
	private int tseq;
	private int tmseq;
	private String email;
	private String tititle;
	private String ticontent;	
	private Date tistart;
	private Date tiend;
	private String isprocess;

	private int tfilesize;
	private int istbook;
	private int issee;
	private Date tidate;
	private String tgfilename;
	private String tmemail;
	private String turl;
	private String name;
	
	public String getTgfilename() {
		return tgfilename;
	}
	public void setTgfilename(String tgfilename) {
		this.tgfilename = tgfilename;
	}

	public String getTurl() {
		return turl;
	}
	public void setTurl(String turl) {
		this.turl = turl;
	}
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
	}
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
	public String getTititle() {
		return tititle;
	}
	public void setTititle(String tititle) {
		this.tititle = tititle;
	}
	public String getTicontent() {
		return ticontent;
	}
	public void setTicontent(String ticontent) {
		this.ticontent = ticontent;
	}
	public Date getTistart() {
		return tistart;
	}
	public void setTistart(Date tistart) {
		this.tistart = tistart;
	}
	public Date getTiend() {
		return tiend;
	}
	public void setTiend(Date tiend) {
		this.tiend = tiend;
	}
	public String getIsprocess() {
		return isprocess;
	}
	public void setIsprocess(String isprocess) {
		this.isprocess = isprocess;
	}

	public int getTfilesize() {
		return tfilesize;
	}
	public void setTfilesize(int tfilesize) {
		this.tfilesize = tfilesize;
	}
	public int getIstbook() {
		return istbook;
	}
	public void setIstbook(int istbook) {
		this.istbook = istbook;
	}
	public int getIssee() {
		return issee;
	}
	public void setIssee(int issee) {
		this.issee = issee;
	}
	public Date getTidate() {
		return tidate;
	}
	public void setTidate(Date tidate) {
		this.tidate = tidate;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTmseq() {
		return tmseq;
	}
	public void setTmseq(int tmseq) {
		this.tmseq = tmseq;
	}
	public String getTmemail() {
		return tmemail;
	}
	public void setTmemail(String tmemail) {
		this.tmemail = tmemail;
	}
	@Override
	public String toString() {
		return "Tissue [tiseq=" + tiseq + ", tseq=" + tseq + ", tmseq=" + tmseq + ", email=" + email + ", tititle="
				+ tititle + ", ticontent=" + ticontent + ", tistart=" + tistart + ", tiend=" + tiend + ", isprocess="
				+ isprocess + ", tfilesize=" + tfilesize + ", istbook=" + istbook + ", issee=" + issee + ", tidate="
				+ tidate + ", tgfilename=" + tgfilename + ", tmemail=" + tmemail + ", turl=" + turl + ", name=" + name
				+ "]";
	}
	
	
	

	
	
}
