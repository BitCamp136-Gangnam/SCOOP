package kr.or.scoop.dto;

public class GoogleDrive {
	private String tgfilename;
	private String tgurl;
	private int tiseq;
	private int pgseq;
	private String pgfilename;
	private String pgurl;
	private int piseq;
	private int tgseq;
	public String getTgfilename() {
		return tgfilename;
	}
	public void setTgfilename(String tgfilename) {
		this.tgfilename = tgfilename;
	}
	public String getTgurl() {
		return tgurl;
	}
	public void setTgurl(String tgurl) {
		this.tgurl = tgurl;
	}
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
	}
	public int getPgseq() {
		return pgseq;
	}
	public void setPgseq(int pgseq) {
		this.pgseq = pgseq;
	}
	public String getPgfilename() {
		return pgfilename;
	}
	public void setPgfilename(String pgfilename) {
		this.pgfilename = pgfilename;
	}
	public String getPgurl() {
		return pgurl;
	}
	public void setPgurl(String pgurl) {
		this.pgurl = pgurl;
	}
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
	}
	public int getTgseq() {
		return tgseq;
	}
	public void setTgseq(int tgseq) {
		this.tgseq = tgseq;
	}
	@Override
	public String toString() {
		return "GoogleDrive [tgfilename=" + tgfilename + ", tgurl=" + tgurl + ", tiseq=" + tiseq + ", pgseq=" + pgseq
				+ ", pgfilename=" + pgfilename + ", pgurl=" + pgurl + ", piseq=" + piseq + ", tgseq=" + tgseq + "]";
	}
	
}
