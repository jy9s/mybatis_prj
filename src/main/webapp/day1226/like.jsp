<%@page import="day1226.ZipcodeDomain"%>
<%@page import="day1226.SelectService2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day1224.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Like</h3>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
	})
});
</script>

<form id="frm" name="frm" action="index.jsp">
	<input type="hidden" name="url" value="${param.url}"/>
	<label for="dong">동검색</label>
	<input type="text" name="dong"/>
	<input type="button" value="검색" class="btn btn-info btn-sm" id="btn"/>
	<br>
	예) 역삼동, 대치동
</form>

<div id="output">
<c:if test="${not empty param.dong}">
<%
String dong=request.getParameter("dong");
List<ZipcodeDomain> list = null;
list = SelectService2.getInstance().useLike(dong);
pageContext.setAttribute("list", list);

%>
<table class="table table-hover" >

<thead>
<tr>
<th colspan=7><c:out value="${param.dong}"/>의 검색 결과</th>
</tr>

<tr>
<th style="width:100px;">우편번호</th>
<th style="width:500px;">주소</th>

</tr>
</thead>

<tbody>
<c:forEach var="zd" items="${list}" varStatus="i">
<tr>
<td><c:out value="${ zd.zipcode }"/></td>
<td><c:out value="${ zd.sido } ${ zd.gugun } ${ zd.dong } ${ zd.bungi }"/></td>
</tr>
</c:forEach>
</tbody>
</table>
<c:if test="${empty list }">
<img src="images/na.jpg" style="width:300px; height:260px"/>
</c:if>
</c:if>
</div>

