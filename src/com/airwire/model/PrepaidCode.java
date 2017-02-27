package com.airwire.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PREPAIDCODES")
public class PrepaidCode {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="P_ID")
	private Integer id;
	
	@Column(name="PREPAIDCODE",unique=true)
	private String prepaidCode;
	
	@Column(name="DATE")
	private Date date;
	
	@Column(name="DAYS")
	private Integer days;
	
	@Column(name="AMOUNT")
	private int amount;
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="INUSE")
	private String inUse;
	
	@Column(name="LOCKDATE")
	private Date lockDate;
	
	public String getInUse() {
		return inUse;
	}
	public void setInUse(String inUse) {
		this.inUse = inUse;
	}
	public Date getLockDate() {
		return lockDate;
	}
	public void setLockDate(Date lockDate) {
		this.lockDate = lockDate;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
}
