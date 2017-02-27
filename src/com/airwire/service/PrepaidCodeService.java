package com.airwire.service;

import java.util.List;

import com.airwire.dto.PrepaidCodeDeatail;
import com.airwire.model.PrepaidCode;
import com.airwire.model.UsedPlanInfo;

public interface PrepaidCodeService {

	public  PrepaidCodeDeatail getPrepaid(String days);
	public boolean savePrepaidCode(PrepaidCode prepaidCode);
	public boolean saveRecord(UsedPlanInfo usedPlanInfo);
	public PrepaidCode getPrepaidCodeWithId(String prepaidCode);
	public List<UsedPlanInfo> getUserList();
	public List<UsedPlanInfo> getUserList(String docDateFrom, String docDateTo);
	public List<UsedPlanInfo> getUsedPlanInfoByCode(String code);
	PrepaidCodeDeatail getPrepaidList(String days);
	
}
