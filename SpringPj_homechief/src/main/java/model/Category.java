package model;

import java.io.Serializable;

public class Category implements Serializable {
	private	int cateNum;
	private String division;
	private String cateName;
	private int division_num;
	private String division_name;
	
	public Category() {}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public int getDivision_num() {
		return division_num;
	}

	public void setDivision_num(int division_num) {
		this.division_num = division_num;
	}	

	public String getDivision_name() {
		return division_name;
	}

	public void setDivision_name(String division_name) {
		this.division_name = division_name;
	}

	@Override
	public String toString() {
		return "Category [cateNum=" + cateNum + ", division=" + division + ", cateName=" + cateName + ", division_num="
				+ division_num + "]";
	}	
	
	
	
}
