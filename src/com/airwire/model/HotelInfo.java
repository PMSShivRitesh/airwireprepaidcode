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
