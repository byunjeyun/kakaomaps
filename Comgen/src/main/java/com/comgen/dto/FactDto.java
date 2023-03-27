package com.comgen.dto;

public class FactDto {

	private String factcd; 
	private String factnm;
	public FactDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FactDto(String factcd, String factnm) {
		super();
		this.factcd = factcd;
		this.factnm = factnm;
	}
	
	public String getFactcd() {
		return factcd;
	}
	public void setFactcd(String factcd) {
		this.factcd = factcd;
	}
	public String getFactnm() {
		return factnm;
	}
	public void setFactnm(String factnm) {
		this.factnm = factnm;
	}
}