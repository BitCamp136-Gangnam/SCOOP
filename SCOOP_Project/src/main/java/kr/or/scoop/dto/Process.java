package kr.or.scoop.dto;

public class Process {
	private int initiative;
	private int progress;
	private int pause;
	private int complete;
	public int getInitiative() {
		return initiative;
	}
	public void setInitiative(int initiative) {
		this.initiative = initiative;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public int getPause() {
		return pause;
	}
	public void setPause(int pause) {
		this.pause = pause;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	@Override
	public String toString() {
		return "Process [initiative=" + initiative + ", progress=" + progress + ", pause=" + pause + ", complete="
				+ complete + "]";
	}
}
