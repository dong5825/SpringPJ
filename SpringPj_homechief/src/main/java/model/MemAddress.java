package model;

import java.io.Serializable;
import java.util.Date;

public class MemAddress implements Serializable {

	private int addressNum;
	private int memNum;
	private String memName;
	private String address;
	private String zipcode;
	private String recipient;
	
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public int getAddressNum() {
		return addressNum;
	}
	public void setAddressNum(int addressNum) {
		this.addressNum = addressNum;
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
	
	@Override
	public String toString() {
		return "MemAddress [addressNum=" + addressNum + ", memNum=" + memNum + ", memName=" + memName + ", address="
				+ address + ", zipcode=" + zipcode + ", recipient=" + recipient + "]";
	}
	
}