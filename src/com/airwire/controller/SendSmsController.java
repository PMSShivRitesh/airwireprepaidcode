package com.airwire.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airwire.service.PrepaidCodeService;

@Controller
@Scope("session")
public class SendSmsController {

	@Autowired
	private PrepaidCodeService prepaidCodeService;

	@RequestMapping("smssend")
	public @ResponseBody String myReport(@RequestParam(required=true) String code, HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse){
		return prepaidCodeService.sendSms(code);
	}

	
}

