package kr.or.scoop.dto;

public class BookMark {
	private int piseq;
	private String pititle;
	private String picontent;
	private int tseq;
	private int tiseq;
	private String tititle;
	private String ticontent;
	private String email;
	private String piname;
	private String tiname;
	private String pname;
	
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPiname() {
		return piname;
	}
	public void setPiname(String piname) {
		this.piname = piname;
	}
	public String getTiname() {
		return tiname;
	}
	public void setTiname(String tiname) {
		this.tiname = tiname;
	}
	public int getPiseq() {
		return piseq;
	}
	public void setPiseq(int piseq) {
		this.piseq = piseq;
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
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "BookMark [piseq=" + piseq + ", pititle=" + pititle + ", picontent=" + picontent + ", tiseq=" + tiseq
				+ ", tititle=" + tititle + ", ticontent=" + ticontent + ", email=" + email + ", piname=" + piname
				+ ", tiname=" + tiname + ", pname=" + pname + "]";
	}
}
