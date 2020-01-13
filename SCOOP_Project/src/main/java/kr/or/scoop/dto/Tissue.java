package kr.or.scoop.dto;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Tissue {
	
	private int tiseq;
	private int tseq;
	private String email;
	private String tititle;
	private String ticontent;
	private Date tistart;
	private Date tiend;
	private String isprocess;
	private String filename;
	private int tfilesize;
	private int istbook;
	private int issee;
	private Date tidate;
	private String tgfilename;
	private String tmention;
	private String turl;
	
	public String getTgfilename() {
		return tgfilename;
	}
	public void setTgfilename(String tgfilename) {
		this.tgfilename = tgfilename;
	}
	public String getTmention() {
		return tmention;
	}
	public void setTmention(String tmention) {
		this.tmention = tmention;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
	
	@Override
	public String toString() {
		return "Tissue [tiseq=" + tiseq + ", tseq=" + tseq + ", email=" + email + ", tititle=" + tititle
				+ ", ticontent=" + ticontent + ", tistart=" + tistart + ", tiend=" + tiend + ", isprocess=" + isprocess
				+ ", filename=" + filename + ", tfilesize=" + tfilesize + ", istbook=" + istbook + ", issee=" + issee
				+ ", tidate=" + tidate + ", tgfilename=" + tgfilename + ", tmention=" + tmention + ", turl=" + turl
				+ "]";
	}
	
	
}
