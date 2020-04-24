package model;

import java.io.Serializable;
import java.util.Date;

public class OrderProduct implements Serializable {

	private int productNum;
	private Long orderNum;
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
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
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
		return "OrderProduct [productNum=" + productNum + ", orderNum=" + orderNum + ", thumbnail=" + thumbnail
				+ ", productName=" + productName + ", qty=" + qty + ", price=" + price + "]";
	}
	
	
}
