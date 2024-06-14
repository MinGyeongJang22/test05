package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import vo.BankVO;

public class BankService {
	
	public List<BankVO> bank_serv() throws IOException{
		//open api 주소
		String urlStr = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=p8gDvJEBENfaLwZoXuqJaZaKYTdJaNIt&data=AP01";
		
		//api 링크
		URL url = new URL(urlStr);
		
		// 실제로 접근하는 변수 connection
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
		
		// connection을 통해 요청한 검색 결과를 읽어오자
		BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		
		String line = "";
		String resultJson = "";
		
		while((line = br.readLine()) != null) {
			resultJson += line;
		}
		
		System.out.println(resultJson); // json 전체 출력
		
		br.close();
		connection.disconnect();
		
		//가져온 Json 형식의 문자열을 실제 Json으로 변경

		//JSON 배열 구조를 가져오는 객체 (처음은 배열 구조로 되어 있다)
		JSONArray json_arr = null;
		
		// 각 배열 구조를 Object(json 구조)로 변환해야 값을 불러올 수 있다.
		JSONObject json_obj_in = null;
		
		List<BankVO> bank_vo = new ArrayList<BankVO>(); // 받을 리스트
		
		try {
			JSONParser jsonParser = new JSONParser();
			json_arr = (JSONArray)jsonParser.parse(resultJson);

			//담은 결과 정보를 각 vo 위치에 set 후 해당 vo를 리스트에 담는다.
			for(int i = 0; i < json_arr.size(); i++) {
				BankVO vo = new BankVO();
				
				json_obj_in = (JSONObject) json_arr.get(i);
				vo.setTtb((String) json_obj_in.get("ttb"));
				vo.setTts((String) json_obj_in.get("tts"));
				vo.setCur_nm((String) json_obj_in.get("cur_nm"));
				
				bank_vo.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return bank_vo; // 최종적으로 담은 vo 리스트를 반환
	}
}
