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
<h3> subquery 조회 </h3>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
	})
});
</script>
최근에 입사한 신입사원 검색

<div id="output">
<%
List<EmpAllDomain> list = null;
list = SelectService2.getInstance().subquery();
pageContext.setAttribute("list", list);

%>
<table class="table table-hover" >

<thead>
<tr>
<th >사원번호</th>
<th >사원명</th>
<th >연봉</th>
<th >고용일</th>
</tr>
</thead>

<tbody>
<c:forEach var="ss" items="${list}" varStatus="i">
<tr>
<td><c:out value="${ss.empno}"/></td>
<td><c:out value="${ss.ename}"/></td>
<td><c:out value="${ss.sal}"/></td>
<td><fmt:formatDate value="${ss.hiredate}" pattern="yyyy-MM-dd EEEE"/></td>

</tr>
</c:forEach>
</tbody>
</table>
<c:if test="${empty list }">
<img src="images/na.jpg" style="width:300px; height:260px"/>
</c:if>
</div>

