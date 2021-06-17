package com.phoenix.carrot.user.dto;

public class UserDto {
	
	private String userid;
	private String password;
	private String useremail;
	private String userphone;
	private String useraddress;
	private String userrole;
	private String userbirthday;
	
	public UserDto() {
	
	}

	public UserDto(String userid, String password, String useremail, String userphone, String useraddress,
			String userrole, String userbirthday) {
		super();
		this.userid = userid;
		this.password = password;
		this.useremail = useremail;
		this.userphone = userphone;
		this.useraddress = useraddress;
		this.userrole = userrole;
		this.userbirthday = userbirthday;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	public String getUserbirthday() {
		return userbirthday;
	}

	public void setUserbirthday(String userbirthday) {
		this.userbirthday = userbirthday;
	}
	
	
	
	

}
