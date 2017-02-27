package com.airwire.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="USEDPLANINFO")
public class UsedPlanInfo {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="U_Id")
	private Integer id;
	
	@Column(name="PREPAIDCODE")
	private String prepaidCode;
	
	@Column(name="PLAN")
	private String plan;
	
	@Column(name="AMOUNT")
	private Integer amount;

	@Column(name="DATE")
	private Date date;
	
	@Column(name="GUESTNAME")
	private String guestName;
	
	@Column(name="ROOMNO")
	private String roomNo;
	
	@Column(name="PHOTOIDPROOFTYPE")
	private String photoIdProofType;
	
	@Column(name="PHOTOIDPROOF")
	private String photoIdProof;
	
	@Column(name="MOBILENO")
	private String mobileNo;
	
	@Column(name="ADDRESS")
	private String address;
	
	@Column(name="EMAILID")
	private String emailId;
	
	@Column(name="ByUser")
	private String byUser;
	
	private String hotelName;
	
	public String getByUser() {
		return byUser;
	}
	public void setByUser(String byUser) {
		this.byUser = byUser;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPrepaidCode() {
		return prepaidCode;
	}
	public void setPrepaidCode(String prepaidCode) {
		this.prepaidCode = prepaidCode;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getPhotoIdProof() {
		return photoIdProof;
	}
	public void setPhotoIdProof(String photoIdProof) {
		this.photoIdProof = photoIdProof;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public void setPhotoIdProofType(String photoIdProofType) {
		this.photoIdProofType = photoIdProofType;
	}
	public String getPhotoIdProofType() {
		return photoIdProofType;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	
	
	
	
}
