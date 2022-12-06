package com.comgen.dto;

public class AddrDto {

private String locno; 
private String city;
private String gu;
private String dong;
private String address;
public AddrDto() {
	super();
	// TODO Auto-generated constructor stub
}
public String getLocno() {
	return locno;
}
public void setLocno(String locno) {
	this.locno = locno;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getGu() {
	return gu;
}
public void setGu(String gu) {
	this.gu = gu;
}
public String getDong() {
	return dong;
}
public void setDong(String dong) {
	this.dong = dong;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public AddrDto(String locno, String city, String gu, String dong, String address) {
	super();
	this.locno = locno;
	this.city = city;
	this.gu = gu;
	this.dong = dong;
	this.address = address;
}
	
	
}
