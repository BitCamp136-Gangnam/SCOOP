package kr.or.scoop.dto;

public class DoWork {
 private String fromname;
 private String toname;
 private String dowork;
 private String pdowork;
 private String toemail;
 private int tdseq;
public String getFromname() {
	return fromname;
}
public void setFromname(String fromname) {
	this.fromname = fromname;
}
public String getToname() {
	return toname;
}
public void setToname(String toname) {
	this.toname = toname;
}
public String getDowork() {
	return dowork;
}
public void setDowork(String dowork) {
	this.dowork = dowork;
}
public String getPdowork() {
	return pdowork;
}
public void setPdowork(String pdowork) {
	this.pdowork = pdowork;
}
public String getToemail() {
	return toemail;
}
public void setToemail(String toemail) {
	this.toemail = toemail;
}
public int getTdseq() {
	return tdseq;
}
public void setTdseq(int tdseq) {
	this.tdseq = tdseq;
}
@Override
public String toString() {
	return "DoWork [fromname=" + fromname + ", toname=" + toname + ", dowork=" + dowork + ", pdowork=" + pdowork
			+ ", toemail=" + toemail + ", tdseq=" + tdseq + "]";
}
 
}
