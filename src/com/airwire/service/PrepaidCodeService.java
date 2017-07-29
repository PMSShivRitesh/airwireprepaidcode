package com.airwire.service;

import java.util.List;

import com.airwire.dto.PrepaidCodeDeatail;
import com.airwire.model.PrepaidCode;
import com.airwire.model.UsedPlanInfo;

public interface PrepaidCodeService {

	PrepaidCodeDeatail getPrepaid(String days);
	boolean savePrepaidCode(PrepaidCode prepaidCode);
	boolean saveRecord(UsedPlanInfo usedPlanInfo);
	PrepaidCode getPrepaidCodeWithId(String prepaidCode);
	List<UsedPlanInfo> getUserList();
	List<UsedPlanInfo> getUserList(String docDateFrom, String docDateTo);
	List<UsedPlanInfo> getUsedPlanInfoByCode(String code);
	PrepaidCodeDeatail getPrepaidList(String days);
	String sendSms(String code);
	
	
}
