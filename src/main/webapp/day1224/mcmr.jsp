<%@page import="day1224.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day1224.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h3>컬럼 여러개에 여러 행 조회</h3>

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
	List<EmpDTO> list =  new ArrayList<EmpDTO>();
	list = ss.mcmr(Integer.parseInt(deptno));
	pageContext.setAttribute("list", list);
}catch(NumberFormatException nfe){
}

%>
<table class="table table-hover">
<thead>
<tr>
<th>번호</th>
<th>사원명</th>
<th>연봉</th>
<th>직무</th>
<th>매니저번호</th>
<th>사원번호</th>
<th>입사일</th>
</tr>

</thead>

<tbody>
<c:if test="${empty list }">
<img src="images/na.jpg" style="width:300px; height:260px"/>
</c:if>



<c:forEach var="eDTO" items="${list}" varStatus="i">
<tr>
<td><c:out value="${i.count }"/></td>
<td><c:out value="${eDTO.ename }"/></td>
<td><fmt:formatNumber pattern="#,###.##" value="${eDTO.sal }"/></td>
<td><c:out value="${eDTO.job }"/></td>
<td><c:out value="${eDTO.mgr }"/></td>
<td><c:out value="${eDTO.deptno }"/><td>
<td><fmt:formatDate value="${eDTO.hiredate }" pattern="yyyy-MM-dd kk:mm:ss"/><td>

</tr>
</c:forEach>
</tbody>
</table>
</c:if>
</div>

