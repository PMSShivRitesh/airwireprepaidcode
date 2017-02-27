package com.airwire.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import au.com.bytecode.opencsv.CSVReader;

import com.airwire.dto.PrepaidCodeDeatail;
import com.airwire.dto.UsedPlanInfoDTO;
import com.airwire.form.UserBean;
import com.airwire.model.HotelInfo;
import com.airwire.model.PrepaidCode;
import com.airwire.model.Systems;
import com.airwire.model.UsedPlanInfo;
import com.airwire.service.PrepaidCodeService;
import com.airwire.service.UserLogin;
import com.airwire.util.DateUtil;


@Controller
@Scope("session")
public class FrontControllerForAirwire {

	@Autowired
	private UserLogin userLogin;
	@Autowired
	private PrepaidCodeService prepaidCodeService;


	@RequestMapping("index")
	public String index(HttpSession session)
	{
		//session.invalidate();
		return "login";
	}


	@RequestMapping("login")
	public String login(HttpSession session)
	{
		session.invalidate();
		return "login";
	}
	@RequestMapping(value={"login"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public String login(@ModelAttribute("command") UserBean userBean, HttpSession session)
	{
		Systems sy = new Systems();
		sy.setUserName(userBean.getUserName());
		sy.setPassword(userBean.getPassword());

		List<Systems> list = this.userLogin.login(sy);

		if (list.size() > 0) {
			Systems systems= (Systems) list.get(0);
			session.setAttribute("userName", userBean.getUserName());
			session.setAttribute("role", systems.getRole());
			session.setAttribute("code", "1");
			return "redirect:/genrateprepaidcode.html";
		}
		return "redirect:/index.html";
	}

	@RequestMapping("genrateprepaidcode")
	public String genratePrepaidCode(HttpSession session)
	{
		return "genrateprepaidcode";
	}

	@RequestMapping("getprepaidcode")
	public @ResponseBody PrepaidCodeDeatail getprepaidcode(@RequestParam("day") String days,HttpSession session)
	{
		PrepaidCodeDeatail prepaidCodeDeatail = prepaidCodeService.getPrepaidList(days);
		return prepaidCodeDeatail;
	}

	@RequestMapping(value={"saveusedplaninfo"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public ModelAndView printPrepaidCode(@ModelAttribute("command") UsedPlanInfo usedPlanInfo,
			HttpSession session)
	{
		String userName= (String)session.getAttribute("userName");
		Map model = new HashMap();		
		if(userName!=null && !userName.isEmpty()){
			PrepaidCodeDeatail prepaidCodeDeatail = prepaidCodeService.getPrepaid(usedPlanInfo.getPlan());
			if(!(prepaidCodeDeatail.getPrepaidCode().equals("NO")) ){

				usedPlanInfo.setPrepaidCode(prepaidCodeDeatail.getPrepaidCode());
				usedPlanInfo.setByUser((String)session.getAttribute("userName"));
				prepaidCodeService.saveRecord(usedPlanInfo);
				List<HotelInfo> HotelNameList = userLogin.getHotelName();
				usedPlanInfo.setHotelName(HotelNameList.get(0).getHotleName());
				model.put("usedPlanInfo", usedPlanInfo);
				return new ModelAndView("printprepaidcodepage",model);
			}else{
				model.put("usedPlanInfo", "This Plan is Not available");
				return new ModelAndView("genrateprepaidcode",model);
			}
		}else{
			model.put("usedPlanInfo", "This Plan is Not available");
			return new ModelAndView("genrateprepaidcode",model);
		}

	}

	public UserLogin getUserLogin(HttpSession session) {
		return userLogin;
	}

	public void setUserLogin(UserLogin userLogin,HttpSession session) {
		this.userLogin = userLogin;
	}

	public PrepaidCodeService getPrepaidCodeService(HttpSession session) {
		return prepaidCodeService;
	}

	public void setPrepaidCodeService(PrepaidCodeService prepaidCodeService,HttpSession session) {
		this.prepaidCodeService = prepaidCodeService;
	}

	@RequestMapping(value={"saverecord"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public String saveRecord(@ModelAttribute("command") UsedPlanInfo usedPlanInfo,HttpSession session){
		prepaidCodeService.saveRecord(usedPlanInfo);
		return "redirect:/genrateprepaidcode.html";
	}

	@RequestMapping("importcsv")
	public String uploadcsv(HttpSession session){
		return "importcsv";
	}

	@RequestMapping(value = "saveuploadfile", method = RequestMethod.POST)
	public String uploadFile(ModelMap model,@RequestParam("file")  MultipartFile file,@RequestParam("plan") int plan,@RequestParam("amount") int amount,HttpServletRequest request,HttpSession session) {
		if (file.isEmpty()) {
			model.put("msg", "failed to upload file because its empty");
			return "mainpage";
		}
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		File dir = new File(rootPath + File.separator + "uploadedfile");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
		try {
			InputStream is = file.getInputStream();
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			int i;
			while ((i = is.read()) != -1) {
				stream.write(i);
			}
			stream.flush();

		} catch (IOException e) {
			model.put("msg", "failed to process file because : " + e.getMessage());
			return "mainpage";
		}
		String[] nextLine;
		try {
			FileReader fileReader = new FileReader(serverFile);
			CSVReader reader = new CSVReader(fileReader, ';', '\'', 1);
			while ((nextLine = reader.readNext()) != null) {
				StringTokenizer t = new StringTokenizer(nextLine[0]);
				String code = t.nextToken(",");
				code=code.replaceAll("\"", "");
				PrepaidCode prepaidCode = new PrepaidCode();
				prepaidCode.setPrepaidCode(code);
				prepaidCode.setAmount(amount);
				prepaidCode.setDays(plan);
				prepaidCode.setStatus("1");
				prepaidCode.setInUse("1");
				Date date = new Date();
				prepaidCode.setDate(date);
				prepaidCodeService.savePrepaidCode(prepaidCode);
			}

		} catch (IOException e) {
			System.out.println("error while reading csv and put to db : " + e.getMessage());
		} 
		model.put("msg", "File successfully uploaded and processed");
		return "importcsv";
	}

	/*@RequestMapping("getusedplanlist")
	public @ResponseBody Map<String, ArrayList<UsedPlanInfo>> getUserList1(@RequestParam("docDateFrom") String docDateFrom, @RequestParam("docDateTo") String docDateTo,HttpSession session){

		List <UsedPlanInfo> abc=null;
		if(docDateFrom !="" &&  docDateFrom!=""){

			docDateFrom = DateUtil.converdate(docDateFrom);
			docDateTo = DateUtil.converdate(docDateTo);
			abc= prepaidCodeService.getUserList(docDateFrom,docDateTo);
		}else{
			abc= prepaidCodeService.getUserList();
		}

		Map data= new HashMap();
		data.put("data", abc);
		return  data;
	}*/

	@RequestMapping("myReport")
	public void myReport(@RequestParam(required=true) String code, HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse){


		try {

			List<UsedPlanInfo>listUsedPlanInfo =prepaidCodeService.getUsedPlanInfoByCode(code);
			if(listUsedPlanInfo!=null){
				UsedPlanInfo usedPlanInfo = listUsedPlanInfo.get(0);

				List<UsedPlanInfoDTO>list=new ArrayList<UsedPlanInfoDTO>();

				UsedPlanInfoDTO usedPlanInfoDTO=new UsedPlanInfoDTO();
				usedPlanInfoDTO.setPrepaidCode(usedPlanInfo.getPrepaidCode());

				if(usedPlanInfo.getPlan().equals("7")){
					usedPlanInfoDTO.setPlan("1 Week");
				}if(usedPlanInfo.getPlan().equals("30")){
					usedPlanInfoDTO.setPlan("1 Month");
				}else{
					usedPlanInfoDTO.setPlan(usedPlanInfo.getPlan());
				}

				usedPlanInfoDTO.setAmount(usedPlanInfo.getAmount());
				//usedPlanInfoDTO.setDate(new Date());
				usedPlanInfoDTO.setGuestName(usedPlanInfo.getGuestName());
				usedPlanInfoDTO.setRoomNo(usedPlanInfo.getRoomNo());
				usedPlanInfoDTO.setPhotoIdProof(usedPlanInfo.getPhotoIdProof());
				usedPlanInfoDTO.setPhotoIdProofType(usedPlanInfo.getPhotoIdProofType());
				usedPlanInfoDTO.setMobileNo(usedPlanInfo.getMobileNo());
				usedPlanInfoDTO.setAddress(usedPlanInfo.getAddress());
				usedPlanInfoDTO.setEmailId(usedPlanInfo.getEmailId());
				
				List<HotelInfo> HotelNameList = userLogin.getHotelName();
				usedPlanInfoDTO.setHotelName(HotelNameList.get(0).getHotleName());
				
				list.add(usedPlanInfoDTO);
				
				
				String jasperFilePath = httpServletRequest.getServletContext().getRealPath("WEB-INF/views/jasper/Blank_A4_with_HotelName.jasper");//Blank_A4_Shivshanker.jrxml
				//String jasperFilePath = httpServletRequest.getServletContext().getRealPath("WEB-INF/views/jasper/Blank_A4_Shivshanker.jrxml");//Blank_A4_Shivshanker.jrxml
				ByteArrayOutputStream resultOutputStream =  new ByteArrayOutputStream();
				HashMap<String, Object> params = new HashMap<String, Object>();
				JasperReport jr = (JasperReport)JRLoader.loadObject(new File(jasperFilePath));
				JasperPrint jp = JasperFillManager.fillReport(jr, params, new JRBeanCollectionDataSource(list));
				JRPdfExporter jrPdfExporter=new JRPdfExporter();
				jrPdfExporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
				jrPdfExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, resultOutputStream);
				jrPdfExporter.exportReport();

				DateFormat formatter = new SimpleDateFormat("EEEE_dd_MM_yyyy_hh_mm_ss_SSS_a");
				Date date = Calendar.getInstance().getTime();
				String today = formatter.format(date);

				ServletOutputStream outputStream = httpServletResponse.getOutputStream();

				if(resultOutputStream != null){
					httpServletResponse.setHeader("Content-Disposition", "inline; filename=\"" + "PrepaidCode_"+today+"."+ "pdf" + "\"");
					httpServletResponse.setContentType("application/pdf");
					outputStream.write(resultOutputStream.toByteArray());
				}
				outputStream.flush();
				outputStream.close();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
