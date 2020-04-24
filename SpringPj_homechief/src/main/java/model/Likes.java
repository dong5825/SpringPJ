package model;

public class Likes {
	private int memnum;
	private int mypick; //내가 like를 누른 사람, 내 like를 받은 사람
	
	public Likes() {}	
	
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}

	public int getMypick() {
		return mypick;
	}

	public void setMypick(int mypick) {
		this.mypick = mypick;
	}
	
	@Override
	public String toString() {
		return "Likes [memnum=" + memnum + ", mypick=" + mypick + "]";
	}	
	
}
