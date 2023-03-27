package com.comgen.dto;

public class RequestDto {

	private String no;
	private String requestno;
	private String factnm;
	private String requestgr;
	private String requestcomment;
	private String requesternm;
	private String requestdate;
	private String managernm;
	private String resultstat;
	private String enddate;
	private String processingtime;
	private String note;
	public RequestDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RequestDto(String no, String requestno, String factnm, String requestgr, String requestcomment, String requesternm,
			String requestdate, String managernm, String resultstat, String enddate, String processingtime,
			String note) {
		super();
		this.no = no;
		this.requestno = requestno;
		this.factnm = factnm;
		this.requestgr = requestgr;
		this.requestcomment = requestcomment;
		this.requesternm = requesternm;
		this.requestdate = requestdate;
		this.managernm = managernm;
		this.resultstat = resultstat;
		this.enddate = enddate;
		this.processingtime = processingtime;
		this.note = note;
	}


	public String getNo() {
		return no;
	}
	public void setno(String no) {
		this.no = no;
	}
	public String getRequestno() {
		return requestno;
	}
	public void setRequestno(String requestno) {
		this.requestno = requestno;
	}
	public String getFactnm() {
		return factnm;
	}
	public void setFactnm(String factnm) {
		this.factnm = factnm;
	}
	public String getRequestgr() {
		return requestgr;
	}
	public void setRequestgr(String requestgr) {
		this.requestgr = requestgr;
	}
	public String getRequestcomment() {
		return requestcomment;
	}
	public void setRequestcomment(String requestcomment) {
		this.requestcomment = requestcomment;
	}
	public String getRequesternm() {
		return requesternm;
	}
	public void setRequesternm(String requesternm) {
		this.requesternm = requesternm;
	}
	public String getRequestdate() {
		return requestdate;
	}
	public void setRequestdate(String requestdate) {
		this.requestdate = requestdate;
	}
	public String getManagernm() {
		return managernm;
	}
	public void setManagernm(String managernm) {
		this.managernm = managernm;
	}
	public String getResultstat() {
		return resultstat;
	}
	public void setResultstat(String resultstat) {
		this.resultstat = resultstat;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getProcessingtime() {
		return processingtime;
	}
	public void setProcessingtime(String processingtime) {
		this.processingtime = processingtime;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}


}
		