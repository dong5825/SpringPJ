package model;

import java.io.Serializable;

public class Nutrient implements Serializable {
	private int nutrient_num;
	private String foodgroup;
	private String food;
	private float energy;
	private float protein;
	private float fat;
	private float carb;
	private float sugar;
	private float cal;
	private float na;
	private float chole;
	
	public Nutrient() {}

	public int getNutrient_num() {
		return nutrient_num;
	}

	public void setNutrient_num(int nutrient_num) {
		this.nutrient_num = nutrient_num;
	}

	public String getFoodgroup() {
		return foodgroup;
	}

	public void setFoodgroup(String foodgroup) {
		this.foodgroup = foodgroup;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public float getEnergy() {
		return energy;
	}

	public void setEnergy(float energy) {
		this.energy = energy;
	}

	public float getProtein() {
		return protein;
	}

	public void setProtein(float protein) {
		this.protein = protein;
	}

	public float getFat() {
		return fat;
	}

	public void setFat(float fat) {
		this.fat = fat;
	}

	public float getCarb() {
		return carb;
	}

	public void setCarb(float carb) {
		this.carb = carb;
	}

	public float getSugar() {
		return sugar;
	}

	public void setSugar(float sugar) {
		this.sugar = sugar;
	}

	public float getCal() {
		return cal;
	}

	public void setCal(float cal) {
		this.cal = cal;
	}

	public float getNa() {
		return na;
	}

	public void setNa(float na) {
		this.na = na;
	}

	public float getChole() {
		return chole;
	}

	public void setChole(float chole) {
		this.chole = chole;
	}

	@Override
	public String toString() {
		return "Nutrient [nutrient_num=" + nutrient_num + ", foodgroup=" + foodgroup + ", food=" + food + ", energy="
				+ energy + ", protein=" + protein + ", fat=" + fat + ", carb=" + carb + ", sugar=" + sugar + ", cal="
				+ cal + ", na=" + na + ", chole=" + chole + "]";
	}
	
	

		
}