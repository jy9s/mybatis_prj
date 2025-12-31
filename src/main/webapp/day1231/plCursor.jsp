<%@page import="day1231.MemberDomain"%>
<%@page import="day1231.SelectService5"%>
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


<h3> procedure을 사용한 select  </h3>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		  
	})
});
</script>
회원 검색<br>
<form action="index.jsp" id="frm">
<input type="hidden" name="url" value="${param.url }"/>
회원번호 : <input type="text" name="num"/><br>
<input type="button"  value="검색" class="btn btn-sm btn-info" id="btn"/>
</form>

<div id="output">
<c:if test="${not empty param.num}">

<%
SelectService5 s5 = SelectService5.getInstance();
String paramNum = request.getParameter("num");
MemberDomain md = s5.searchOneMember(Integer.parseInt(paramNum));
pageContext.setAttribute("md", md);

%>

<c:choose>
<c:when test="${md eq null }">
회원정보가 존재하지 않습니다.
</c:when>
<c:otherwise>
이름 : <c:out value="${md.name }"/><br>
나이 : <c:out value="${md.age }"/><br>
성별 : <c:out value="${md.gender }"/><br>
전화번호 : <c:out value="${md.tel}"/><br>
가입일 : <fmt:formatDate value="${md.inputDate}" pattern="yyyy-MM-dd EEEE kk:mm:ss"/><br>


</c:otherwise>
</c:choose>
</c:if>
</div>

