<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day1224.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>컬럼하나에 여러 행 조회</h3>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
	})
});
</script>

<form id="frm" name="frm" action="index.jsp">
	<input type="hidden" name="url" value="${param.url}"/>
	<label for="deptno">부서번호</label>
	<input type="text" name="deptno"/>
	<input type="button" value="검색" class="btn btn-info btn-sm" id="btn"/>
</form>

<div id="output">
<c:if test="${not empty param.deptno}">
<%
String deptno=request.getParameter("deptno");
SelectService ss = SelectService.getInstance();
try{
	List<String> list = new ArrayList<String>();
	list = ss.scmr(Integer.parseInt(deptno));
	pageContext.setAttribute("list", list);
}catch(NumberFormatException nfe){
}

%>
<table class="table table-hover" style="width:250px;">
<tr>
<th colspan=3><c:out value="${param.deptno}"/>번 부서 사원리스트 </th>
</tr>

<c:forEach var="arr" items="${list}" varStatus="i">
<tr>
<td><c:out value="${i.count}"/></td>
<td><input type="checkbox" name="ename" value="${arr}"></td>
<td><c:out value="${ arr }"/></td>
</tr>
</c:forEach>
</table>
<c:if test="${empty list }">
<img src="images/na.jpg" style="width:300px; height:260px"/>
</c:if>
</c:if>
</div>

