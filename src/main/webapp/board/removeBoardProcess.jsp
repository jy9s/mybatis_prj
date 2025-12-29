<%--page directive --%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
%>


<jsp:useBean id="bDTO" class="kr.co.sist.board.BoardDomain" scope="page"/>
<jsp:setProperty name="bDTO" property="*"/>
<%
//web parameter로 title, content가 입력되고

//그외, IP는 내장 객체, ID는 session
bDTO.setIp(request.getRemoteAddr());
bDTO.setId((String)session.getAttribute("userId"));

BoardService bs = BoardService.getInstance();
boolean flag=bs.removeBoard(bDTO);
pageContext.setAttribute("flag", flag);

%>

<script type="text/javascript">
<c:choose>
<c:when test="${flag}">

msg="글삭제 성공.";
alert(msg);
location.href="boardList.jsp?currentPage=${param.currentPage}"

</c:when>
<c:otherwise>
var msg="글삭제 중 문제가 발생했습니다.";
alert(msg);
history.back();
</c:otherwise>
</c:choose>

</script>
