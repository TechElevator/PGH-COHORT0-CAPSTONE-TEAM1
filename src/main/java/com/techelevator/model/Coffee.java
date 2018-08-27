package com.techelevator.model;

public class Coffee {
	private long coffeeId;
	private String coffeeName;
	private String origin;
	private String roaster;	
	private String detail;
	
	public long getCoffeeId() {
		return this.coffeeId;
	}
	public void setCoffeeId(long coffeeId) {
		this.coffeeId = coffeeId;
	}
	public String getCoffeeName() {
		return this.coffeeName;
	}
	public void setCoffeeName(String coffeeName) {
		this.coffeeName = coffeeName;
	}
	public String getOrigin() {
		return this.origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getRoaster() {
		return this.roaster;
	}
	public void setRoaster(String roaster) {
		this.roaster = roaster;
	}
	public String getDetail() {
		return this.detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
		
}
