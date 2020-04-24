package model;

import java.io.Serializable;

public class Sale implements Serializable {
	private int saleNum;
	private int categoryNum;
	private String thumbnail;
	private String productname;
	private String hashtag;
	private int price;
	private int stock;
	private int sales;
	
	
	
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public int getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(int saleNum) {
		this.saleNum = saleNum;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	
	
	@Override
	public String toString() {
		return "Sale [saleNum=" + saleNum + ", categoryNum=" + categoryNum + ", thumbnail=" + thumbnail
				+ ", productname=" + productname + ", hashtag=" + hashtag + ", price=" + price + ", stock=" + stock
				+ ", sales=" + sales + "]";
	}
	
	
	
}
