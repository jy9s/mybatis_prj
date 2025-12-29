<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<title>JSP템플릿</title>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->
<style type="text/css">
</style>
<!-- jQeury CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$("#sel").change(function(){
		//1. 옵션을 생성할 select 얻기
		var sel=$("#sel")[0];
		var carMaker = $("#carMaker")[0];
		var carModel = $("#carModel")[0];
		
		//2. 선택한 select에서 옵션을 생성
		var param = "type=" + sel.value;
		carMaker.length=1;
		carModel.length=1;
		$.ajax({			
			url:"carMaker_process.jsp",
			type : "GET",
			data : param,
			dataType:"JSON",
			error:function(xhr){
				alert("error code : " + xhr.status + ", msg : " + xhr.statusText);
			},
			success:function(jsonArr){
				
				$.each(jsonArr, function(i,ele){				
					carMaker.options[i+1]=new Option(ele.carMaker, ele.carMakerValue);	
				});
			}
		});
		
	});
	
	
	$("#carMaker").change(function(){
		//1. 옵션을 생성할 select 얻기
		var carMaker = $("#carMaker")[0];
		var carModel = $("#carModel")[0];
		//2. 선택한 select에서 옵션을 생성
		var param = "carMaker=" + carMaker.value;
		carModel.length=1;
		$.ajax({			
			url:"carModel_process.jsp",
			type : "GET",
			data : param,
			dataType:"JSON",
			error:function(xhr){
				alert("error code : " + xhr.status + ", msg : " + xhr.statusText);
			},
			success:function(jsonArr){
				
				$.each(jsonArr, function(i,ele){				
					carModel.options[i+1]=new Option(ele.carModel, ele.carModelValue);	
				});
			}
		});
		
	});
	
	$("#btn").click(function(){
		
		var carMaker = $("#carMaker")[0];
		var carModel = $("#carModel")[0];
		var param = "carModel=" + carModel.value + "&carMaker=" + carMaker.value;
	
		$.ajax({			
			url:"view_process.jsp",
			type : "GET",
			data : param,
			dataType:"JSON",
			error:function(xhr){
				alert("error code : " + xhr.status + ", msg : " + xhr.statusText);
			},
			success:function(jsonArr){
				jsonParser(jsonArr);
			}
		});
		
	});

	
}); //ready


function jsonParser(jsonArr){
    var output = `
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>이미지</th><th>제조사</th><th>모델명</th><th>년식</th><th>가격</th><th>배기량</th><th>입력일</th>
                </tr>
            </thead>
            <tbody>`;
    
    if(jsonArr.length == 0) {
        output += "<tr><td colspan='5' style='text-align:center'>데이터가 없습니다.</td></tr>";
    }

    $.each(jsonArr, function(i, ele){				
    	output +=
    	    "<tr>" +
    	        "<td><img src='car_img/" + ele.carImg + "' style='width:80px'></td>" +
    	        "<td>" + ele.carMaker + "</td>" +
    	        "<td>" + ele.carModel + "</td>" +
    	        "<td>" + ele.carYear + "</td>" +
    	        "<td>" + ele.carPrice + "만원</td>" +
    	        "<td>" + ele.carCc + "</td>" +
    	        "<td>" + ele.carInputDate + "</td>" +
    	    "</tr>";

    });
	
    output += "</tbody></table>";
	$("#output").html(output);
}


</script>
</head>
<body>

<select id="sel" style="hidehg:30px">
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

<div id="output">


</div>


</body>
</html>