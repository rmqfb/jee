package com.homepage.web.beans;

public class KaupBean {
	private double height;
	private double weight;
	
	public KaupBean() {
		
	}
	
	public KaupBean(double height, double weight) {
		this.height = height;
		this.weight = weight;
	}
	
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
}
