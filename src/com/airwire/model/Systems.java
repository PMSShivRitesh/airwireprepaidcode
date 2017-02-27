package com.airwire.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SYSTEMS")
public class Systems
{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="S_ID")
	private Integer id;

	@Column(name="PASSWORD")
	private String password;

	@Column(name="USERNAME")
	private String userName;

	@Column(name="LASTLOGIN")
	private Date lastLogin;

	@Column (name="Name")
	private String name;
	
	@Column (name="Role")
	private String role;

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getId()
	{
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return this.userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getLastLogin() {
		return this.lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
}

