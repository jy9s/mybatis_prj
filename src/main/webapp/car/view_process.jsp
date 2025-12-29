<%@page import="kr.co.sist.car.ViewDomain"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.car.CarService"%>
<%@page import="kr.co.sist.car.CarDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String carModel = request.getParameter("carModel");
String carMaker = request.getParameter("carMaker");
//1. JSONArr 생성
JSONArray jsonArr = new JSONArray();

CarDTO cDTO = new CarDTO();
cDTO.setCarMaker(carMaker);
cDTO.setCarModel(carModel);
//2. 값을 할당
CarService cService = CarService.getInstance();
List<ViewDomain> list = cService.searchTotalView(cDTO);

for(int i = 0 ; i< list.size();i++){
	JSONObject jsonObj= new JSONObject();
	jsonObj.put("carImg", list.get(i).getCar_img());
	jsonObj.put("carMaker", carMaker);
	jsonObj.put("carModel", carModel);
	jsonObj.put("carYear", list.get(i).getCar_year());
	jsonObj.put("carPrice", list.get(i).getPrice());
	jsonObj.put("carCc", list.get(i).getCc());
	jsonObj.put("carInputDate", list.get(i).getInput_date().toString());
	
	jsonArr.add(jsonObj);
}
//3. 출력
//out.print(jsonObj);
out.print(jsonArr.toJSONString());
%>