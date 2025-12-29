<%@page import="day1229.SelectService3"%>
<%@page import="day1226.CarModelDomain"%>
<%@page import="day1226.EmpAllDomain"%>
<%@page import="day1226.EmpDomain"%>
<%@page import="day1226.ZipcodeDomain"%>
<%@page import="day1226.SelectService2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day1224.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h3> subquery&join 조회 </h3>

<script type="text/javascript">

</script>
보유 중인 국산차량의 최신 10건을 검색<br>

<div id="output">
<%
List<CarModelDomain> list = null;
list = SelectService3.getInstance().subQueryNjoin();
pageContext.setAttribute("list", list);

%>
<table class="table table-hover" >

<thead>
<tr>
<th >이미지</th>
<th >제조국</th>
<th >제조사</th>
<th >모델명</th>
<th >년식</th>
<th >가격</th>
<th >배기량</th>
<th >입력일</th>
</tr>
</thead>

<tbody>
<c:forEach var="ss" items="${list}" varStatus="i">
<tr>
<td><img src="day1226/car_img/${ss.car_img}" style="width:80px; height:60px"></td>
<td><c:out value="${ss.country}"/></td>
<td><c:out value="${ss.maker}"/></td>
<td><c:out value="${ss.maker}"/></td>
<td><c:out value="${ss.model}"/></td>
<td><c:out value="${ss.car_year}"/></td>
<td><fmt:formatNumber value="${ss.price}" pattern="#,###"/></td>
<td><c:out value="${ss.cc}"/></td>
<td><fmt:formatDate value="${ss.input_date}" pattern="yyyy-MM-dd EEEE"/></td>
</tr>
</c:forEach>
</tbody>
</table>
<c:if test="${empty list }">
<tr>
<td colspan="8">
<img src="images/na.jpg" style="width:300px; height:260px"/>
</td>
</tr>
</c:if>
</div>

