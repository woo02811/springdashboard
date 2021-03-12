package com.board.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final String key = "";
	private static final String sido = "서울";
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	

	public String jsonEx() throws Exception{
		StringBuffer sb = new StringBuffer();
		String a = "aaa";
		try {
			
			//http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty
			//?sidoName=서울&pageNo=1&numOfRows=10&ServiceKey=서비스키&ver=1.3
			
			// ��ǥ
			String tmX = "";
			String tmY = "";

			/*String urlS = "http://openapi.airkorea.or.kr/openapi/services/rest/UlfptcaAlarmInqireSvc/getUlfptcaAlarmInfo";
			urlS += "?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + key;
			urlS += "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=200";
			urlS += "&" + URLEncoder.encode("pageNo", "UTF-8") + "=1";
			urlS += "&" + URLEncoder.encode("year", "UTF-8") + "=2021";
			urlS += "&" + URLEncoder.encode("_returnType", "UTF-8") + "=json";*/
			
			String urlS = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
			urlS += "?" + URLEncoder.encode("sidoName", "UTF-8") + "="+sido;
			urlS += "&" + URLEncoder.encode("pageNo", "UTF-8") + "=1";
			urlS += "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=10";
			urlS += "&" + URLEncoder.encode("ServiceKey", "UTF-8") + "="+key;
			urlS += "&" + URLEncoder.encode("_returnType", "UTF-8") + "=json";
			URL url = new URL(urlS);
			String readline = "";
			String result = "";

			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream()));
			while ((readline = br.readLine()) != null) {
				result = result.concat(readline);
				
			}
			System.out.println("test-------------" + result);
			/*
			 * JSON* ������ �߰� <dependency> <groupId>com.googlecode.json-simple</groupId>
			 * <artifactId>json-simple</artifactId> <version>1.1</version> </dependency>
			 */
			
			JSONParser jParser = new JSONParser();
			JSONObject jObject = (JSONObject) jParser.parse(result);
			JSONArray jArray = (JSONArray) jObject.get("list");
			
			
			for (int i = 0; i < jArray.size(); i++) {
			//for (int i = 0; i < 10; i++) {
				JSONObject job = (JSONObject) jArray.get(i);
				/*String dataDate = (String) job.get("dataDate"); 
				String districtName = (String) job.get("districtName"); 
				String moveName = (String) job.get("moveName"); 
				String issueDate = (String) job.get("issueDate"); 
				String issueTime = (String) job.get("issueTime"); 
				String issueVal = (String) job.get("issueVal");
				String itemCode = (String) job.get("itemCode"); 
				String issueGbn = (String) job.get("issueGbn"); 
				String clearDate = (String) job.get("clearDate"); 
				String clearTime = (String) job.get("clearTime"); 
				String clearVal = (String) job.get("clearVal"); 
				sb.append("발령날짜: " + dataDate + ", 지역 : " + districtName + " ("+ moveName +"), " + "발령시간 : "+ issueDate + " " 
				+ issueTime + "농도 : " + issueVal + " ("+ issueGbn +") " + miseType);*/
				//sb.append("�ּ�: " + addr);
				String dataTime = (String)job.get("dataTime");
				String pm10Value24 = (String)job.get("pm10Value24");
				String pm25Value24 = (String)job.get("pm25Value24");
				if(i==5) {
					sb.append("지역 : 서울"+"  측정 시간 : "+dataTime+"  미세먼지 : "+pm10Value24+"  초미세먼지 : "+pm25Value24);
					
				}
				System.out.println("-------------------");
				System.out.println(sb.toString());
				System.out.println("-------------------");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sb.toString();
		
		
	}

}
