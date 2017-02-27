package com.airwire.service.impl; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.airwire.dao.UserDaoLogin;
import com.airwire.model.HotelInfo;
import com.airwire.model.Systems;
import com.airwire.service.UserLogin;

@Service("userLogin")
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class UserLoginImpl
  implements UserLogin
 {

   @Autowired
  private UserDaoLogin userDaoLogin;

   public UserDaoLogin getUserDaoLogin() {
	return userDaoLogin;
}

public void setUserDaoLogin(UserDaoLogin userDaoLogin) {
	this.userDaoLogin = userDaoLogin;
}

public List<Systems> login(Systems systems)
   {
    return userDaoLogin.login(systems);
   }

public List<HotelInfo> getHotelName(){
	return userDaoLogin.getHotelName();
}
}