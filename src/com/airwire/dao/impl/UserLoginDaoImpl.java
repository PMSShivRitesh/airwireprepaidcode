package com.airwire.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.airwire.dao.UserDaoLogin;
import com.airwire.model.HotelInfo;
import com.airwire.model.Systems;

@Repository("userLoginDao")
public class UserLoginDaoImpl
implements UserDaoLogin
{

	@Autowired
	private SessionFactory sessionFactory;

	public List<Systems> login(Systems systems)
	{
		String SQL_QUERY = " from Systems u where u.userName='" + systems.getUserName() + "' and u.password='" + systems.getPassword() + "'";
		List<Systems> list = (List<Systems>) this.sessionFactory.getCurrentSession().createQuery(SQL_QUERY).list();
		return list;
	}

	public List<HotelInfo> getHotelName()
	{
		String SQL_QUERY = " from HotelInfo";
		List<HotelInfo> list = (List<HotelInfo>) this.sessionFactory.getCurrentSession().createQuery(SQL_QUERY).list();
		return list;
	}
	public SessionFactory getSessionFactory()
	{
		return this.sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}