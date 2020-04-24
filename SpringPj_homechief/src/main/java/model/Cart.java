package model;

import java.io.Serializable;
import java.util.Date;

public class Cart implements Serializable {

	private int cartNum; 
	private int memNum;
	private String thumbnail;
	private String productName;
	private int qty;
	private int price;
	
		
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
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
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	@Override
	public String toString() {
		return "Cart [cartNum=" + cartNum + ", memNum=" + memNum + ", thumbnail=" + thumbnail + ", productName="
				+ productName + ", qty=" + qty + ", price=" + price + "]";
	}
	
	
	
}