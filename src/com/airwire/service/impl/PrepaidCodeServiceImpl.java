package com.airwire.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.airwire.dao.PrepaidCodeDao;
import com.airwire.dto.PrepaidCodeDeatail;
import com.airwire.dto.UsedPlanInfoDTO;
import com.airwire.model.HotelInfo;
import com.airwire.model.PrepaidCode;
import com.airwire.model.UsedPlanInfo;
import com.airwire.service.PrepaidCodeService;
import com.airwire.service.UserLogin;


@Service("prepaidCodeService")
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class PrepaidCodeServiceImpl implements PrepaidCodeService {

	 @Autowired
	  private PrepaidCodeDao prepaidCodeDao;
	 
	 @Autowired
	 private UserLogin userLogin;
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS, readOnly=false)
	public PrepaidCodeDeatail getPrepaid(String days) {
		
		return prepaidCodeDao.getPrepaid(days);
		
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS, readOnly=false)
	public PrepaidCodeDeatail getPrepaidList(String days) {
		
		return prepaidCodeDao.getPrepaidList(days);
		
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS, readOnly=false)
	public boolean saveRecord(UsedPlanInfo usedPlanInfo) {
		
		PrepaidCode prepaidCode = prepaidCodeDao.getPrepaidCodeDeatailWithId(usedPlanInfo.getPrepaidCode());
		prepaidCode.setStatus("0");
		prepaidCodeDao.saveUpdatedPrepaidCode(prepaidCode);
		prepaidCodeDao.saveRecord(usedPlanInfo);
		return true;
	}

	public PrepaidCodeDao getPrepaidCodeDao() {
		return prepaidCodeDao;
	}

	public void setPrepaidCodeDao(PrepaidCodeDao prepaidCodeDao) {
		this.prepaidCodeDao = prepaidCodeDao;
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS, readOnly=false)
	public boolean savePrepaidCode(PrepaidCode prepaidCode) {
		// TODO Auto-generated method stub
		return prepaidCodeDao.savePrepaidCode(prepaidCode);
	}

	@Override
	public PrepaidCode getPrepaidCodeWithId(String prepaidCode) {
		PrepaidCode prepaidCodeObject = prepaidCodeDao.getPrepaidCodeDeatailWithId(prepaidCode);
		return prepaidCodeObject;
	}

	@Override
	public List<UsedPlanInfo> getUserList() {
		// TODO Auto-generated method stub
		return prepaidCodeDao.getUserList();
	}

	@Override
	public List<UsedPlanInfo> getUserList(String docDateFrom, String docDateTo) {
		// TODO Auto-generated method stub
		return prepaidCodeDao.getUserList(docDateFrom,docDateTo);
	}

	@Override
	public List<UsedPlanInfo> getUsedPlanInfoByCode(String code) {
		return prepaidCodeDao.getUsedPlanInfoByCode(code);
	}
	
	@Override
	public String sendSms(String code) {
		  String response="";
		List<UsedPlanInfo>listUsedPlanInfo =getUsedPlanInfoByCode(code);
		if(listUsedPlanInfo!=null){
			
			UsedPlanInfo usedPlanInfo = listUsedPlanInfo.get(0);
			List<UsedPlanInfoDTO>list=new ArrayList<UsedPlanInfoDTO>();
			List<HotelInfo> HotelNameList = userLogin.getHotelName();
			HotelInfo hotelInfo = HotelNameList.get(0);
			String message="Welcome To "+hotelInfo.getHotleName() +" WiFi Zone"
					+" your WiFi Prepaid code for ";
			if(usedPlanInfo.getPlan().equals("7")){
				message=message+"1 Week";
			}else if(usedPlanInfo.getPlan().equals("30")){
				message=message+"1 Month";
			}else{
				message=message+usedPlanInfo.getPlan()+" day";
			}
			
			message=message+" is "+code;
			String mobiles=usedPlanInfo.getMobileNo();
			 //Your authentication key
            String password = hotelInfo.getPassword();
            //Multiple mobiles numbers separated by comma
           // String mobiles = "9146999123";
            //Sender ID,While using route4 sender id should be 6 characters long.
            String user = hotelInfo.getUserId();
            //Your message to send, Add URL encoding here.
			 //Prepare Url
            URLConnection myURLConnection=null;
            URL myURL=null;
            BufferedReader reader=null;
            //encoding message
            String encoded_message=URLEncoder.encode(message);
            
        	/*http://www.smswave.in/panel/sendsms.php?user=demodemo &password=sms123Pwd
        		&sender=ICUBEX
        		&PhoneNumber=9199xxxxxxxx&Text=Welcome%20to%20SMS%20wave%20API. 
            //Send SMS API
*/            String mainUrl="http://smswave.in/panel/sendsms.php?";

            //Prepare parameter string
            StringBuilder sbPostData= new StringBuilder(mainUrl);
            sbPostData.append("user="+user);
            sbPostData.append("&password="+password);
            sbPostData.append("&sender="+hotelInfo.getSenderId());
            sbPostData.append("&PhoneNumber="+mobiles);
            sbPostData.append("&Text="+encoded_message);
            
           /* http://www.smswave.in/panel/sendsms.php?
            user=AWSLTN
            &password=123123
            &sender=AWSLTN
            &PhoneNumber=9960801981
            &Text=Welcome%20to%20SMS%20wave%20API*/
            //final string
            mainUrl = sbPostData.toString();
            try
            {
                //prepare connection
                myURL = new URL(mainUrl);
                myURLConnection = myURL.openConnection();
                myURLConnection.connect();
                reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
                //reading response
              
                String test="";
                while ((response = reader.readLine()) != null)
                //print response
                	test=test+response;
                response=test;

                //finally close connection
                reader.close();
            }
            catch (IOException e)
            {
                    e.printStackTrace();
            }
           
        }
		return response;
	}

}
