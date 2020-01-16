package kr.or.scoop.dto;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Tifile {
	private int tiseq;
	private List<CommonsMultipartFile> files;
	private String tfilesize;
	public int getTiseq() {
		return tiseq;
	}
	public void setTiseq(int tiseq) {
		this.tiseq = tiseq;
	}
	
	public String getTfilesize() {
		return tfilesize;
	}
	public void setTfilesize(String tfilesize) {
		this.tfilesize = tfilesize;
	}
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		return "Tifile [tiseq=" + tiseq + ", files=" + files + ", tfilesize=" + tfilesize + "]";
	}
	
	
	
	
	
	
	
}
