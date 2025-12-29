<%--page directive --%>
<%@page import="kr.co.sist.board.BoardDomain"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String num = request.getParameter("num");
if(num!=null){ //입력된 번호가 있다면
	BoardService bs = BoardService.getInstance();
	try{
		int tempNum=Integer.parseInt(num);
		//새로고침 조회수 증가 막기
		Object obj = session.getAttribute(String.valueOf(tempNum));
		if(obj==null){
	bs.modifyBoardCnt(tempNum);
		}
		session.setAttribute(String.valueOf(tempNum), true);
/* 		if(!session.getAttribute("num").equals(num)){
	session.setAttribute("num", num);
	bs.modifyBoardCnt(tempNum);
		}
 */		
		BoardDomain bDTO = bs.searchOneBoard(tempNum); // 게시글 하나 읽기
		pageContext.setAttribute("bDTO", bDTO);
		
		
	}catch(NumberFormatException nfe){
	}
}
%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>게시판 글쓰기</title>
<link rel ="shortcut icon" href="http://192.168.10.72/html_prj/common/images/favicon.ico"/>

<script src="${CommonURL}/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->
<style type="text/css">
#wrap{margin:0px auto; width:1200px; height:1000px;} 
#header{height:150px;}
#container{height:700px;}
#footer{height:150px;}
</style>
<!-- jQeury CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- summerNote를 사용하기 위함 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>

<script type="text/javascript">


$(function(){

	$('#content').summernote({
	  tabsize: 2,
	  height: 300,
	  width:500,
      toolbar: [
          ['style', ['bold','italic','clear']],
          ['fontsize', ['fontsize']],          
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['insert', ['link', 'picture']]
        ]
	});
});
</script>


<script type="text/javascript">
$(function(){

	$("#btnModify").click(function(){
		
		if(confirm("글을 정말 수정하시겠습니까?")){
		
			if( $("#content").val()=="" || $("#content").val()=="<p></p>" ){
				alert("내용은 필수 입력 입니다.");
				return;
			}
					
			//jqeury에서 찾아낸 노드에 javascript객체로 접근하려면 배열 사용해야함.
			$("#frm")[0].action="modifyBoardProcess.jsp"		
			$("#frm").submit();		
		}
	})
	
	$("#btnDelete").click(function(){
		
		if(confirm("글을 정말 삭제하시겠습니까?")){
		
			if( $("#content").val()=="" || $("#content").val()=="<p></p>" ){
				alert("내용은 필수 입력 입니다.");
				return;
			}
					
			//jqeury에서 찾아낸 노드에 javascript객체로 접근하려면 배열 사용해야함.
			$("#frm")[0].action="removeBoardProcess.jsp"		
			$("#frm").submit();		
		}
	})
	
	
}); //ready


</script>


<meta name="theme-color" content="#712cf9">
<link href="${CommonURL}/common/css/carousel.css" rel="stylesheet">

</head>
<body>

	<header data-bs-theme="dark">
	</header>
	<main>
		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<h2> 아무말 대잔치 글읽기</h2>
					<form method="post" name="frm" id="frm">
					
					<table>
					<tr>
					<td style="width:100px">제목</td>
					<td><input type="text" name="title" id="title" style="width:500px" value="${bDTO.title}"/></td>
					</tr>
					<tr>
					<td>내용</td>
					<td><textarea name="content" id="content"><c:out value="${bDTO.content}"/></textarea></td>
					</tr>
					<tr>
					<td>ID/IP</td>
					<td><c:out value="${bDTO.id} / ${bDTO.ip}"/></td>
					</tr>
					<tr>
					<td>조회수</td>
					<td><c:out value="${bDTO.cnt}"/></td>
					</tr>
					<tr>
					<td>작성일</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd EEEE a HH:mm" value="${bDTO.input_date }"/></td>
					</tr>
										
					
					<tr>
					<td  colspan="2" style="text-align:center">
						<c:if test="${sessionScope.userId eq bDTO.id}">
						<input type="hidden" name="num" value="${param.num}">
						
						<button onclick="return false" class="btn btn-success" id="btnModify">글수정</button>
						<button onclick="return false" class="btn btn-success" id="btnDelete">글삭제</button>
						</c:if>
						<a href="boardList.jsp?currentPage=${param.currentPage}" class="btn btn-info">리스트</a>
					</td>					
					</tr>
					</table>
					</form>
				</div>
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
	</main>
</body>
</html>