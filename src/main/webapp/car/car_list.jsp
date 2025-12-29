<%--page directive --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel ="shortcut icon" href="http://192.168.10.72/html_prj/common/images/favicon.ico"/>

<script src="http://192.168.10.72/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
<style type="text/css">
#wrap{margin:0px auto; width:1200px; height:1000px;} 
#header{height:150px;}
#container{height:700px;}
#footer{height:150px;}
</style>
<!-- jQeury CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#carCountry").change(function(){
		if($("#carCountry")[0].selectedIndex != 0 ){
			
			var selModel=$("#carModel")[0];
			selModel.length=1;
			
			var param = {country : $("#carCountry").val() } ;
			
			$.ajax({
				url:"searchMaker.jsp",
				type:"GET",
				data:param,
				dataType:"JSON",
				error:function(xhr){
					alert("제조사 조회시 문제발생. 잠시 후 다시 시도해주세요.")
					console.log(xhr.status);
				},
				success:function(jsonObj){
					if(jsonObj.result && jsonObj.makerCnt != 0){
						//제조사를 설정할 select을 가져온다.
						var selMaker=$("#carMaker")[0];
						selMaker.length=1;
						
						var jsonArr=jsonObj.data;
						
						for( var i = 0 ; i < jsonObj.data.length; i++ ){
							selMaker.options[i+1]=new Option(jsonArr[i].maker,jsonArr[i].maker);
						}
					}
				}
			});
		}
			
	});
	
	
	$("#carMaker").change(function(){
		if($("#carMaker")[0].selectedIndex != 0 ){
			var param = {maker : $("#carMaker").val() } ;
			$.ajax({
				url:"searchModel.jsp",
				type:"GET",
				data:param,
				dataType:"JSON",
				error:function(xhr){
					alert("제조사 조회시 문제발생. 잠시 후 다시 시도해주세요.")
					console.log(xhr.status);
				},
				success:function(jsonObj){
					if(jsonObj.result && jsonObj.modelCnt != 0){
						//모델을 설정할 select을 가져온다.
						var selModel=$("#carModel")[0];
						selModel.length=1;

						var jsonArr=jsonObj.data;
						
						for( var i = 0 ; i < jsonObj.data.length; i++ ){
							selModel.options[i+1]=new Option(jsonArr[i].model,jsonArr[i].model);
						}
					}
				}
			});
		}
		
	});
	
	$("#btn").click(function(){
		if($("#carModel")[0].selectedIndex != 0 ){
			var param = {model : $("#carModel").val() } ;
			
			
			$.ajax({
				url:"searchCar.jsp",
				type:"GET",
				data:param,
				dataType:"JSON",
				error:function(xhr){
					alert("세부차량 조회시 문제발생. 잠시 후 다시 시도해주세요.")
					console.log(xhr.status);
				},
				success:function(jsonObj){
					if(jsonObj.result){
						//조회결과를 설정할 select을 가져온다.
						var carTab=$("#carList");

						var jsonArr=jsonObj.data;
						var createTr="";
						var jsonObjCar;
						
						$("#carList tbody:last").empty();
						
						for( var i = 0 ; i < jsonArr.length; i++ ){
							jsonObjCar=jsonArr[i];
							createTr="<tr>"
							createTr+="<td><img src='http://localhost/mybatis_prj/day1226/car_img/"+jsonObjCar.car_img+"' style='width:80px; height:60px'></td>"
							createTr+="<td>"+(jsonObjCar.car_option!=null? jsonObj.car_option:"옵션 없음")+"</td>"
							createTr+="<td>"+jsonObjCar.car_year+"</td>"
							createTr+="<td>"+jsonObjCar.price+"</td>"
							createTr+="<td>"+jsonObjCar.cc+"</td>"
							createTr+="<td>"+jsonObjCar.inputDate+"</td>"
							createTr+="</tr>"
							
							$("#carList tbody:last").append(createTr);
							
						}//end for
						
					}//end if(jsonObj.result && jsonObj.carCnt != 0)
						
				
					if(jsonObj.carCnt==0){
						createTr="<tr><td colspan='6'>보유중인 차량이 없습니다.</td></tr>"
						$("#carList tbody:last").append(createTr);
					}
						
				}
			});

		}
	});
	
}); //ready


</script>


<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.72/jsp_prj/common/css/carousel.css" rel="stylesheet">

</head>
<body>

	<header data-bs-theme="dark">
		<jsp:include page="../fragments/header.jsp"></jsp:include>
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
				<div>
				<select id="carCountry" style="hidehg:30px">
				<option value="N/A">-----선택-----</option>
				<option value="국산">국산</option>
				<option value="수입">수입</option>
				</select>
				<select id="carMaker" style="hidehg:30px">
				<option value="N/A">-----선택-----</option>
				</select>
				<select id="carModel" style="hidehg:30px">
				<option value="N/A">-----선택-----</option>
				</select>
				<input type="button" value="검색" id="btn" class="btn btn-info btn-sm"/>
				</div>
				<div>
				<table class = "table table-hover"  id="carList" >
					<thead>
					<tr>
					<th>이미지</th>
					<th>옵션</th>
					<th>년식</th>
					<th>가격</th>
					<th>배기량</th>
					<th>입력일</th>
					</tr>
					</thead>
					
					
					<tbody>
					
					</tbody>								
				</table>
				</div>
				
				
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
	</main>
</body>
</html>