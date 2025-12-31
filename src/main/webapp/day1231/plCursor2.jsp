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
});
</script>
전체 회원 검색<br>
<div id="output">

<%
SelectService5 s5 = SelectService5.getInstance();
List<MemberDomain> list = null;
list = s5.searchAllMember();
pageContext.setAttribute("list", list);

%>

<table class="table table-hover">
<thead>
<tr>
<th>번호</th>
<th>이름</th>
<th>나이</th>
<th>성별</th>
<th>전화번호</th>
<th>가입일</th>

</tr>
</thead>
<tbody>
<c:if test="${empty list }">
<tr><td colspan="6">회원정보가 존재하지 않습니다.</tr>
</c:if>
<c:forEach var="list" items="${list }" varStatus="i" >
<tr>
<td><c:out value="${list.num }"/></td>
<td><c:out value="${list.name }"/></td>
<td><c:out value="${list.age }"/></td>
<td><c:out value="${list.gender }"/></td>
<td><c:out value="${list.tel}"/></td>
<td>TimeStamp <fmt:formatDate value="${list.inputDate}" pattern="yyyy-MM-dd EEEE kk:mm:ss"/> 
	/ Date <fmt:formatDate value="${list.input_date}" pattern="yyyy-MM-dd EEEE kk:mm:ss"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>

