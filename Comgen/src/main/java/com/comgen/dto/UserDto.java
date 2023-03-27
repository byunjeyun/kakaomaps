package com.comgen.dto;

public class UserDto {
	
	private String userno;
	private String userid;
	private String userpw;
	private String email;
	public UserDto(String userno, String userid, String userpw, String email) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.userpw = userpw;
		this.email = email;
	}
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
