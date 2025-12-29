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


<h3> dollar 조회 </h3>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		  
	})
	
	$("[value='${param.type}']").prop("checked",true);
	
});
</script>
사원 검색<br>
<form action="index.jsp" id="frm">
<input type="hidden" name="url" value="${param.url }"/>
<%-- <input type="radio" name="type" value="emp" <c:if test="${param.type == 'emp'}">checked</c:if>/>본사
<input type="radio" name="type" value="cp_emp5" <c:if test="${param.type == 'cp_emp5'}">checked</c:if>/>지사 --%>
<input type="radio" name="type" value="emp"/>본사
<input type="radio" name="type" value="cp_emp5"/>지사
<input type="button" value="검색" class="btn btn-sm btn-info" id="btn"/>
</form>

<div id="output">
<%
List<EmpAllDomain> list = null;
String type = request.getParameter("type");
list = SelectService3.getInstance().dollar(type);
pageContext.setAttribute("list", list);

%>
<c:if test="${not empty list}">

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
<c:forEach var="ss" items="${list}" varStatus="i">
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
<c:if test="${empty list }">
본사/지사를 선택해주세요.
<!-- <img src="images/na.jpg" style="width:300px; height:260px"/>  -->
</c:if>
</c:if>
</div>

