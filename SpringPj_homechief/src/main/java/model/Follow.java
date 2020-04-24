package model;

import java.io.Serializable;

public class Follow implements Serializable {
	private int memNum;
	private int followNum;
	
	private int count;
	
	public Follow() {
		
	}

	
	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public int getFollowNum() {
		return followNum;
	}

	public void setFollowNum(int followNum) {
		this.followNum = followNum;
	}


	@Override
	public String toString() {
		return "Follow [memNum=" + memNum + ", followNum=" + followNum + ", count=" + count + "]";
	}
	
	
	
}
