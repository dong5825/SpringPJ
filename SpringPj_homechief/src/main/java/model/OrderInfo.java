package model;

import java.io.Serializable;
import java.util.Date;

public class OrderInfo implements Serializable {

	private Long orderNum; 
	private int memNum;
	private Date orderdate;
	private int amount;
	private String memName;
	private String recipient;
	private String address;
	private String zipcode;
	private String memo;
	private String howtopay;
	
	
	
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getHowtopay() {
		return howtopay;
	}
	public void setHowtopay(String howtopay) {
		this.howtopay = howtopay;
	}	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	@Override
	public String toString() {
		return "OrderInfo [orderNum=" + orderNum + ", memNum=" + memNum + ", orderdate=" + orderdate + ", amount="
				+ amount + ", memName=" + memName + ", recipient=" + recipient + ", address=" + address + ", zipcode="
				+ zipcode + ", memo=" + memo + ", howtopay=" + howtopay + "]";
	}
	
	
}