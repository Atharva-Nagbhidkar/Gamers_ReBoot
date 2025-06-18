package com.gamer.demo.model;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Users {
	
	private String username;
	@Id
	private String email;
	private String phone;
	private String password;
	private String isadmin;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getIsadmin() {
		return isadmin;
	}
	public void setIsadmin(String isadmin) {
		this.isadmin = isadmin;
	}
	
	
	@Override
	public String toString() {
		return "Users [ username=" + username + ", email=" + email + ", phone=" + phone + ", password="
				+ password + ", isadmin=" + isadmin + "]";
	}
}
