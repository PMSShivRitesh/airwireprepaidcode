package com.airwire.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="HOTELINFO")
public class HotelInfo {

	

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="S_ID")
	private Integer id;

	@Column(name="HOTELNAME")
	private String hotleName;
	
	@Column(name="SENDERID")
	private String senderId;
	
	@Column(name="USERID")
	private String userId;
	
	@Column(name="PASSWORD")
	private String password;
	
	

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHotleName() {
		return hotleName;
	}

	public void setHotleName(String hotleName) {
		this.hotleName = hotleName;
	}
}
