package com.comgen.dto;

public class ManagerDto {

	private String managercd;
	private String managernm;


	public ManagerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ManagerDto(String managercd, String managernm) {
		super();
		this.managercd = managercd;
		this.managernm = managernm;
	}

	public String getManagercd() {
		return managercd;
	}

	public void setManagercd(String managercd) {
		this.managercd = managercd;
	}

	public String getManagernm() {
		return managernm;
	}

	public void setManagernm(String managernm) {
		this.managernm = managernm;
	}
}