package Model;

import java.io.Serializable;

public class Users implements Serializable{
	private String userName;
	private String userPass;
	public Users() {
		
	}
	public Users(String name , String pass) {
		this.userName = name;
		this.userPass = pass;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserPass(String userPass ) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return this.userName;
	}
	public String getUserPass() {
		return this.userPass;
	}
	
	
}