package model;

import java.io.Serializable;
import java.util.Date;

public class Jjim implements Serializable {

	private int jjimNum; 
	private int memNum;
	private String thumbnail;
	private String productName;
	private int price;
	private Date regist_date;
	
	
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	public int getJjimNum() {
		return jjimNum;
	}
	public void setJjimNum(int jjimNum) {
		this.jjimNum = jjimNum;
	}
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Jjim [jjimNum=" + jjimNum + ", memNum=" + memNum + ", thumbnail=" + thumbnail + ", productName="
				+ productName + ", price=" + price + ", regist_date=" + regist_date + "]";
	}
	
	

	
	
}