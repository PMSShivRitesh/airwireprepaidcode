package com.airwire.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airwire.model.UsedPlanInfo;
import com.airwire.service.PrepaidCodeService;
import com.airwire.util.DateUtil;

@Controller
@Scope("session")
public class ReportController {

	@Autowired
	private PrepaidCodeService prepaidCodeService;

	@RequestMapping("getusedplanlist")
	public @ResponseBody Map<String, ArrayList<UsedPlanInfo>> getusedplanlist(
			/*@RequestParam("docDateFrom") String docDateFrom, @RequestParam("docDateTo") String docDateTo,*/
			HttpSession session) {

		List<UsedPlanInfo> abc = null;
		/*if (docDateFrom != "" && docDateFrom != "") {

			docDateFrom = DateUtil.converdate(docDateFrom);
			docDateTo = DateUtil.converdate(docDateTo);
			abc = prepaidCodeService.getUserList(docDateFrom, docDateTo);
		} else {*/
			abc = prepaidCodeService.getUserList();
		/*}*/

		Map data = new HashMap();
		data.put("data", abc);
		return data;
	}
	
	@RequestMapping("getusedplanlist")
	public @ResponseBody Map<String, ArrayList<UsedPlanInfo>> getusedplanlist1(
			@RequestParam("docDateFrom") String docDateFrom, @RequestParam("docDateTo") String docDateTo,
			HttpSession session) {

		List<UsedPlanInfo> abc = null;
		if (docDateFrom != "" && docDateFrom != "") {

			docDateFrom = DateUtil.converdate(docDateFrom);
			docDateTo = DateUtil.converdate(docDateTo);
			abc = prepaidCodeService.getUserList(docDateFrom, docDateTo);
		} else {
			abc = prepaidCodeService.getUserList();
		}

		Map data = new HashMap();
		data.put("data", abc);
		return data;
	}
}
