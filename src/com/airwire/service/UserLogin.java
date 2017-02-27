package com.airwire.service;

import java.util.List;

import com.airwire.model.HotelInfo;
import com.airwire.model.Systems;

public interface UserLogin
{
  public  List<Systems> login(Systems paramSystems);
  public List<HotelInfo> getHotelName();
}