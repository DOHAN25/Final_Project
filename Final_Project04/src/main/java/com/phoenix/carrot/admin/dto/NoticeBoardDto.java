package com.phoenix.carrot.admin.dto;

import java.util.Date;

public class NoticeBoardDto {


	private int admno;
	private String admname;
	private String admtitle;
	private String admcontent;
	private Date admdate;
	
	public NoticeBoardDto() {
	}
	public NoticeBoardDto(int admno, String admname, String admtitle, String admcontent, Date admdate) {
		this.admno = admno;
		this.admname = admname;
		this.admtitle = admtitle;
		this.admcontent = admcontent;
		this.admdate = admdate;
	}
	
	public int getAdmno() {
		return admno;
	}

	public void setAdmno(int admno) {
		this.admno = admno;
	}

	public String getAdmname() {
		return admname;
	}

	public void setAdmname(String admname) {
		this.admname = admname;
	}

	public String getAdmtitle() {
		return admtitle;
	}

	public void setAdmtitle(String admtitle) {
		this.admtitle = admtitle;
	}

	public String getAdmcontent() {
		return admcontent;
	}

	public void setAdmcontent(String admcontent) {
		this.admcontent = admcontent;
	}

	public Date getAdmdate() {
		return admdate;
	}

	public void setAdmdate(Date admdate) {
		this.admdate = admdate;
	}
	
}
