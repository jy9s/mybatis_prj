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
	$("#btn").click(function(){
		//1. 옵션을 생성할 select 얻기
		var sel=$("#sel")[0];
		//2. 선택한 select에서 옵션을 생성
		//alert(sel.length);
		sel.length = 1; //남겨둘 옵션의 개수
		var jsonArr=[{name:"민병조",age:25},{name:"임성우",age:26},{name:"박현욱",age:27}];
		$.each(jsonArr, function(i,ele){
			//sel.options[i]=new Option("보여줄값", "value값");		
			sel.options[i+1]=new Option(ele.name, ele.age);//남겨진 것 이후를 생성해야 위에가 남을 수 있다.
		});
		
	});
	
	$("#btn2").click(function(){
		//1. 옵션을 생성할 select 얻기
		var sel=$("#sel")[0];
		sel.length = 1; //남겨둘 옵션의 개수
		//2. 선택한 select에서 옵션을 생성
		var jsonArr=[{name:"탄지로",age:17},{name:"덴지",age:20},{name:"루피",age:30},{name:"이치고",age:33},{name:"나루토",age:37}];
		$.each(jsonArr, function(i,ele){
			//sel.options[i]=new Option("보여줄값", "value값");		
			sel.options[i+1]=new Option(ele.name, ele.age);		
		});
		
	});
}); //ready

</script>
</head>
<body>

<select id="sel" style="hidehg:30px">
<option value="N/A">-----선택-----</option>
</select>
<input type="button" value="채우기" id="btn" class="btn btn-info btn-sm"/>
<input type="button" value="채우기2" id="btn2" class="btn btn-info btn-sm"/>
</body>
</html>