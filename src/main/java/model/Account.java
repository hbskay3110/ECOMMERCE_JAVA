package model;



public class Account {
	
	private String nameAcc;
	private String password;
	private String userName;
	private String sex;
	private String phoneNum;
	private String email;
	private String dayOfBirth;
	private String address;
	private int typeAccount;
	private String role;
	public Account(String nameAcc, String password, String userName, String sex, String phoneNum, String email,
			String dayOfBirth, String address, int typeAccount, String role) {
		super();
		this.nameAcc = nameAcc;
		this.password = password;
		this.userName = userName;
		this.sex = sex;
		this.phoneNum = phoneNum;
		this.email = email;
		this.dayOfBirth = dayOfBirth;
		this.address = address;
		this.typeAccount = typeAccount;
		this.role = role;
	}
	
	public String getNameAcc() {
		return nameAcc;
	}

	public void setNameAcc(String nameAcc) {
		this.nameAcc = nameAcc;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDayOfBirth() {
		return dayOfBirth;
	}

	public void setDayOfBirth(String dayOfBirth) {
		this.dayOfBirth = dayOfBirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTypeAccount() {
		return typeAccount;
	}

	public void setTypeAccount(int typeAccount) {
		this.typeAccount = typeAccount;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Account [nameAcc=" + nameAcc + ", password=" + password + ", userName=" + userName + ", sex=" + sex
				+ ", phoneNum=" + phoneNum + ", email=" + email + ", dayOfBirth=" + dayOfBirth + ", address=" + address
				+ ", typeAccount=" + typeAccount + ", role=" + role + "]";
	}



	 

}
