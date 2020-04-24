package model;

import java.io.Serializable;

public class Scrap implements Serializable {
	private int memnum;
	private int scrapnum;
	
	public Scrap() {
		
	}

	public int getMemnum() {
		return memnum;
	}

	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}

	public int getScrapnum() {
		return scrapnum;
	}

	public void setScrapnum(int scrapnum) {
		this.scrapnum = scrapnum;
	}
	
	
}
