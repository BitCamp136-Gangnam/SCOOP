package kr.or.scoop.dto;

public class GoogleDrive {
	private String tgfilename;
	private String tgurl;
	private int tiseq;
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
	@Override
	public String toString() {
		return "GoogleDrive [tgfilename=" + tgfilename + ", tgurl=" + tgurl + ", tiseq=" + tiseq + "]";
	}
	
}
