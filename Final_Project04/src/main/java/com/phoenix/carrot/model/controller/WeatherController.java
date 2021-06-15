package com.phoenix.carrot.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class WeatherController {

	@RequestMapping("/weather.do")
	public String weatherForm() {
			return "weather";
			
			@RestController
			@RequestMapping("/api")
			@GetMapping("/weather")
			    public String restApiGetWeather() throws Exception 
			    {
			        /* 
			            @ API LIST ~
			            
			            getUltraSrtNcst �ʴܱ��Ȳ��ȸ 
			            getUltraSrtFcst �ʴܱ⿹����ȸ 
			            getVilageFcst ���׿�����ȸ 
			            getFcstVersion ����������ȸ
			        */
			        String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"
			            + "?serviceKey=okJR2mnA1Rzmmk7CjZYkoyCo5Rl8TOuU4%2FIbVsOhh%2F6aZSGHZ1TQ%2BcHnM0LxasBAl7RZv5glsiirPyxly%2FjMAA%3D%3D"
			            + "&dataType=JSON"            // JSON, XML
			            + "&numOfRows=10"             // ������ ROWS
			            + "&pageNo=1"                 // ������ ��ȣ
			            + "&base_date=20210517"       // ��ǥ����
			            + "&base_time=0800"           // ��ǥ�ð�
			            + "&nx=60"                    // �������� X ��ǥ
			            + "&ny=127";                  // �������� Y ��ǥ
			        
			        HashMap<String, Object> resultMap = getDataFromJson(url, "UTF-8", "get", "");
			        
			        System.out.println("# RESULT : " + resultMap);

			        JSONObject jsonObj = new JSONObject();
			        
			        jsonObj.put("result", resultMap);
			        
			        return jsonObj.toString();
			    }
			    
			    public HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception
			    {
			        boolean isPost = false;

			        if ("post".equals(type))
			        {
			            isPost = true;
			        }
			        else
			        {
			            url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr;
			        }

			        return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
			    }
			    
			    public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter, String contentType) throws Exception
			    {
			        URL apiURL = new URL(url);

			        HttpURLConnection conn = null;
			        BufferedReader br = null;
			        BufferedWriter bw = null;

			        HashMap<String, Object> resultMap = new HashMap<String, Object>();

			        try
			        {
			            conn = (HttpURLConnection) apiURL.openConnection();
			            conn.setConnectTimeout(5000);
			            conn.setReadTimeout(5000);
			            conn.setDoOutput(true);

			            if (isPost)
			            {
			                conn.setRequestMethod("POST");
			                conn.setRequestProperty("Content-Type", contentType);
			                conn.setRequestProperty("Accept", "*/*");
			            }
			            else
			            {
			                conn.setRequestMethod("GET");
			            }

			            conn.connect();

			            if (isPost)
			            {
			                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
			                bw.write(parameter);
			                bw.flush();
			                bw = null;
			            }

			            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));

			            String line = null;

			            StringBuffer result = new StringBuffer();

			            while ((line=br.readLine()) != null) result.append(line);

			            ObjectMapper mapper = new ObjectMapper();

			            resultMap = mapper.readValue(result.toString(), HashMap.class);
			        }
			        catch (Exception e)
			        {
			            e.printStackTrace();
			            throw new Exception(url + " interface failed" + e.toString());
			        }
			        finally
			        {
			            if (conn != null) conn.disconnect();
			            if (br != null) br.close();
			            if (bw != null) bw.close();
			        }

			        return resultMap;
			    }	
	}
}
