package com.airwire.dao;

import java.util.List;

import com.airwire.dto.PrepaidCodeDeatail;
import com.airwire.model.PrepaidCode;
import com.airwire.model.UsedPlanInfo;

public interface PrepaidCodeDao {
	public  PrepaidCodeDeatail getPrepaid(String days);

	public boolean saveRecord(UsedPlanInfo usedPlanInfo);

	public PrepaidCode getPrepaidCodeDeatailWithId(String prepaidCodeId);

	public boolean saveUpdatedPrepaidCode(PrepaidCode prepaidCode);

	public boolean savePrepaidCode(PrepaidCode prepaidCode);
	
	public List<UsedPlanInfo> getUserList();

	public List<UsedPlanInfo> getUserList(String docDateFrom, String docDateTo);
	public List<UsedPlanInfo> getUsedPlanInfoByCode(String code);

	PrepaidCodeDeatail getPrepaidList(String days);

}
