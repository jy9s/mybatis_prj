<%--page directive --%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.car.CarService"%>
<%@page import="kr.co.sist.car.CarDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%


String type = request.getParameter("type");
System.out.println(type);
//1. JSONArr 생성
JSONArray jsonArr = new JSONArray();

//2. 값을 할당
CarService cService = CarService.getInstance();

List<String> carMaker = cService.searchCarMaker(type);

for(int i = 0 ; i< carMaker.size();i++){
	JSONObject jsonObj= new JSONObject();
	jsonObj.put("carMaker", carMaker.get(i));
	jsonObj.put("carMakerValue", carMaker.get(i));
	jsonArr.add(jsonObj);
}


//3. 출력
//out.print(jsonObj);
out.print(jsonArr.toJSONString());

%>