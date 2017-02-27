package com.airwire.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.airwire.dao.PrepaidCodeDao;
import com.airwire.dto.PrepaidCodeDeatail;
import com.airwire.model.PrepaidCode;
import com.airwire.model.UsedPlanInfo;
import com.airwire.service.PrepaidCodeService;


@Service("prepaidCodeService")
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class PrepaidCodeServiceImpl implements PrepaidCodeService {

	 @Autowired
	  private PrepaidCodeDao prepaidCodeDao;
	
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

}
