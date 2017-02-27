
package com.airwire.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.airwire.dao.PrepaidCodeDao;
import com.airwire.dto.PrepaidCodeDeatail;
import com.airwire.model.PrepaidCode;
import com.airwire.model.UsedPlanInfo;



@Repository("prepaidCodeDao")
public class PrepaidCodeDaoImpl implements PrepaidCodeDao {

	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Autowired
     private SessionFactory sessionFactory;
	
	@Override
	public PrepaidCodeDeatail getPrepaid(String days)
  {
		
		
	    String SQL_QUERY = " from PrepaidCode p where p.days='" + days + "' and p.status =1 and p.inUse = 1";
	    Query query = this.sessionFactory.getCurrentSession().createQuery(SQL_QUERY);
	    List list = query.list();
	    Iterator it = list.iterator();
	    PrepaidCodeDeatail  prepaidCodeDeatail = new  PrepaidCodeDeatail();
	     if (it.hasNext()) {
	    	 PrepaidCode prepaidCode = (PrepaidCode)it.next();
	    	 prepaidCodeDeatail.setPrepaidCode(prepaidCode.getPrepaidCode());
	    	 //prepaidCodeDeatail.setPrepaidCode(list.size()+"");
	    	 prepaidCodeDeatail.setAmount(prepaidCode.getAmount());
	    	 //prepaidCode.setInUse("0");
	    	 //prepaidCode.setLockDate(new Date());
	    	 //this.sessionFactory.getCurrentSession().saveOrUpdate(prepaidCode);
	         //return prepaidCode.getPrepaidCode();
	     }else{
	    	 prepaidCodeDeatail.setPrepaidCode("NO");
	     }
	     return prepaidCodeDeatail;
	  }
	
	@Override
	public PrepaidCodeDeatail getPrepaidList(String days)
  {
		
		
	    String SQL_QUERY = " from PrepaidCode p where p.days='" + days + "' and p.status =1 and p.inUse = 1";
	    Query query = this.sessionFactory.getCurrentSession().createQuery(SQL_QUERY);
	    List list = query.list();
	    Iterator it = list.iterator();
	    PrepaidCodeDeatail  prepaidCodeDeatail = new  PrepaidCodeDeatail();
	     if (it.hasNext()) {
	    	 PrepaidCode prepaidCode = (PrepaidCode)it.next();
	    	 prepaidCodeDeatail.setPrepaidCode(list.size()+"");
	    	 //prepaidCodeDeatail.setPrepaidCode(list.size()+"");
	    	 prepaidCodeDeatail.setAmount(prepaidCode.getAmount());
	    	 //prepaidCode.setInUse("0");
	    	 //prepaidCode.setLockDate(new Date());
	    	 //this.sessionFactory.getCurrentSession().saveOrUpdate(prepaidCode);
	         //return prepaidCode.getPrepaidCode();
	     }else{
	    	 prepaidCodeDeatail.setPrepaidCode("NO");
	     }
	     return prepaidCodeDeatail;
	  }

	@Override
	public boolean saveRecord(UsedPlanInfo usedPlanInfo) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(usedPlanInfo);
		return true;
		
	}
	
	
	@Override
	public PrepaidCode getPrepaidCodeDeatailWithId(String prepaidCodeId)
	  {
	    String SQL_QUERY = " from PrepaidCode p where p.prepaidCode='" + prepaidCodeId + "'";
	    Query query = this.sessionFactory.getCurrentSession().createQuery(SQL_QUERY);
	     List list = query.list();
	    Iterator it = list.iterator();
	
	     if (it.hasNext()) {
	    	 PrepaidCode prepaidCode = (PrepaidCode)it.next();
	      return prepaidCode;
	    }
	    return null;
	   }

	@Override
	public boolean saveUpdatedPrepaidCode(PrepaidCode prepaidCode) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(prepaidCode);
		return true;
	}

	@Override
	public boolean savePrepaidCode(PrepaidCode prepaidCode) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(prepaidCode);
		return true;
		
	}

	@Override
	public List<UsedPlanInfo> getUserList() {
		List<UsedPlanInfo> list2 = (List<UsedPlanInfo>) sessionFactory.getCurrentSession().createCriteria(UsedPlanInfo.class).list();
		return list2;
	}

	@Override
	public List<UsedPlanInfo> getUserList(String docDateFrom, String docDateTo) {
		String SQL_QUERY = " from UsedPlanInfo p where p.date >='" + docDateFrom + "' and p.date <='" + docDateTo + "'";
	    Query query = this.sessionFactory.getCurrentSession().createQuery(SQL_QUERY);
	     List<UsedPlanInfo> list = (List<UsedPlanInfo>) query.list();
	    
	    return list;
	}

	
	@Override
	public List<UsedPlanInfo> getUsedPlanInfoByCode(String code) {
		String SQL_QUERY = " from UsedPlanInfo p where prepaidCode ='" + code + "'";
	    Query query = this.sessionFactory.getCurrentSession().createQuery(SQL_QUERY);
	     List<UsedPlanInfo> list = (List<UsedPlanInfo>) query.list();
	    
	    return list;
	}
}



