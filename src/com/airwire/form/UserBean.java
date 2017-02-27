 package com.airwire.form;
 
 import java.util.Date;

import javax.validation.constraints.NotNull;
 
 public class UserBean
 {
   private Integer id;
 
   @NotNull
   private String name;
   private String gender;
   private Date dob;
   private String address;
   private String mobile;
   private String emailId;
   private String password;
   private String userName;
   private Date lastLogin;
 
   public Integer getId()
   {
     return this.id;
   }
   public void setId(Integer id) {
     this.id = id;
   }
   public String getName() {
     return this.name;
   }
   public void setName(String name) {
     this.name = name;
   }
   public String getGender() {
     return this.gender;
   }
   public void setGender(String gender) {
     this.gender = gender;
   }
   public Date getDob() {
     return this.dob;
   }
   public void setDob(Date dob) {
     this.dob = dob;
   }
   public String getAddress() {
     return this.address;
   }
   public void setAddress(String address) {
     this.address = address;
   }
   public String getMobile() {
     return this.mobile;
   }
   public void setMobile(String mobile) {
     this.mobile = mobile;
   }
   public String getEmailId() {
     return this.emailId;
   }
   public void setEmailId(String emailId) {
     this.emailId = emailId;
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
