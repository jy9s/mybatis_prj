<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="day1230.SelectService4"%>
<%@page import="day1229.SelectService3"%>
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


<h3> DynamicForEach </h3>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		  
	})
	
    <c:forEach var="empno" items="${paramValues.empno}">
    	$("[value='${empno}']").prop("checked",true);
    </c:forEach>
	
	$("#flag").click(function(){
		var flagChk=$("#flag").prop("checked");
		$.each($("[name='empno']"),function(i,chk){
			$(chk).prop("checked",flagChk);
		});
		/* $("[name='empno']").prop("checked", function(i, value) {
		    return !value; 
		}); */
	})
	
});
</script>
사원 검색<br>
<form action="index.jsp" id="frm">
<input type="hidden" name="url" value="${param.url }"/>
<%
List<Integer> list = null;

String deptno = request.getParameter("deptno");
list = SelectService4.getInstance().searchAllEmpno();
pageContext.setAttribute("empList", list);
%>
<input type="checkbox" name="flag" id="flag"/>전체선택
<c:forEach var="empno" items="${empList }" varStatus="i">
<input type="checkbox" name="empno" value="${empno}"/>
<c:out value="<strong>${i.count}</strong>. ${empno }" escapeXml="false"/>
</c:forEach>
<input type="button"  value="검색" class="btn btn-sm btn-info" id="btn"/>
</form>

<div id="output">
<c:if test="${not empty param.empno}">
<%


String[] empno = request.getParameterValues("empno");


List<EmpAllDomain> empList = SelectService4.getInstance().dynamicForEach(empno);
pageContext.setAttribute("empList", empList);

%>

<table class="table table-hover" >

<thead>
<tr>
<th >사원번호</th>
<th >사원명</th>
<th >직무</th>
<th >연봉</th>
<th >입사일</th>
<th >부서번호</th>
</tr>
</thead>

<tbody>
<c:forEach var="ss" items="${empList}" varStatus="i">
<tr>
<td><c:out value="${ss.empno}"/></td>
<td><c:out value="${ss.ename}"/></td>
<td><c:out value="${ss.job}"/></td>
<td><c:out value="${ss.sal}"/></td>
<td><fmt:formatDate value="${ss.hiredate}" pattern="yyyy-MM-dd EEEE"/></td>
<td><c:out value="${ss.deptno}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
<c:if test="${empty empList }">
<img src="images/na.jpg" style="width:300px; height:260px"/>
</c:if>
</c:if>
</div>

