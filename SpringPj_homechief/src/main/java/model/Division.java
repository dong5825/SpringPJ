package model;

import java.io.Serializable;

public class Division implements Serializable {
	private int division_num;
	private String division_name;
	
	public Division() {}

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
		return "Division [division_num=" + division_num + ", division_name=" + division_name + "]";
	}
	
	
	
}
