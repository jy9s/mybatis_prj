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
<h3> < 의 사용</h3>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
	})
});
</script>

<form id="frm" name="frm" action="index.jsp">
	<input type="hidden" name="url" value="${param.url}"/>
	<label for="sal">연봉 검색</label>
	<input type="text" name="sal"/>
	<input type="button" value="검색" class="btn btn-info btn-sm" id="btn"/>
	<br>
</form>

<div id="output">
<c:if test="${not empty param.sal}">
<%
String sal=request.getParameter("sal");
List<EmpDomain> list = null;
list = SelectService2.getInstance().lessThan(Integer.parseInt(sal));
pageContext.setAttribute("list", list);

%>
<table class="table table-hover" >

<thead>
<tr>
<th colspan=5><c:out value="${param.sal}"/>보다 연봉이 작은 사원</th>
</tr>

<tr>
<th >번호</th>
<th >사원명</th>
<th >연봉</th>
<th >보너스</th>
<th >고용일</th>

</tr>
</thead>

<tbody>
<c:forEach var="ss" items="${list}" varStatus="i">
<tr>
<td><c:out value="${i.count}"/></td>
<td><c:out value="${ss.ename}"/></td>
<td><c:out value="${ss.sal}"/></td>
<td><c:out value="${ss.comm}"/></td>
<td><fmt:formatDate value="${ss.hiredate}" pattern="yyyy-MM-dd EEEE"/></td>

</tr>
</c:forEach>
</tbody>
</table>
<c:if test="${empty list }">
<img src="images/na.jpg" style="width:300px; height:260px"/>
</c:if>
</c:if>
</div>

