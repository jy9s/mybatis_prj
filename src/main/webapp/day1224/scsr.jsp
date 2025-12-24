<%@page import="day1224.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>컬럼하나에 한 행 조회</h3>

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
	String dname = ss.scsr(Integer.parseInt(deptno));
	pageContext.setAttribute("dname", dname);
}catch(NumberFormatException nfe){
}

%>
<c:set var="msg" value="존재하지 않습니다."/>
<c:if test="${not empty dname }">
<c:set var="msg" value="${dname}"/>
</c:if>
<c:out value="${param.deptno }"/>번 부서는
<strong><c:out value="${msg}"/></strong> 
</c:if>
</div>

