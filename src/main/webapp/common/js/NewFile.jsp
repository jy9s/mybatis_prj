<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Viva Admin</title>
<link rel="stylesheet" type="text/css"
	href="${CommonURL}/common/css/vivaAdminTemplate.css" />

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->

<!-- jQeury DNS 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">

</script>
</head>
<body>
	<div id="wrap">
		<div id="header" style="display: flex">
			<div>
				<img src="${CommonURL}/common/images/logo.png"
					id="logo">
			</div>
			<div
				style="width: 80%; display: flex; justify-content: flex-end; align-items: center; margin-right: 100px">
				<input type="button" value="로그아웃" class="share-button">
			</div>
		</div>

		<div id="container">
			<div id="left">
				<div class="menu">
					<a href="#void" class="menuLink"><img
						src="${CommonURL}/common/images/dashboard.png"
						class="icon"><span class="menu-text">대시보드</span></a>
				</div>
				<div class="menu">
					<a href="#void" class="menuLink"><img
						src="${CommonURL}/common/images/info.png"
						class="icon"><span class="menu-text">회원정보 조회</span></a>
				</div>
				<div class="menu">
					<a href="#void" class="menuLink"><img
						src="${CommonURL}/common/images/speaker.png"
						class="icon"><span class="menu-text">공지/FAQ</span></a>
				</div>
				<div class="menu">
					<a href="#void" class="menuLink"><img
						src="${CommonURL}/common/images/event.png"
						class="icon"><span class="menu-text">행사 관리</span></a>
				</div>
				<div class="menu">
					<a href="#void" class="menuLink"><img
						src="${CommonURL}/common/images/question.png"
						class="icon"><span class="menu-text">1:1문의</span></a>
				</div>
				<div class="menu">
					<a href="#void" class="menuLink"><img
						src="${CommonURL}/common/images/ticket.png"
						class="icon"><span class="menu-text">예매관리</span></a>
				</div>
				<div class="menu">
					<a href="#void" class="menuLink"><img
						src="${CommonURL}/common/images/calandar.png"
						class="icon"><span class="menu-text">예약관리</span></a>
				</div>
				<div class="menu">
					<a href="#void" class="menuLink"><img
						src="${CommonURL}/common/images/attraction.png"
						class="icon"><span class="menu-text">놀이기구관리</span></a>
				</div>
			</div>

			<div id="right">여기에 쓰세요.</div>
		</div>
	</div>
</body>
</html>
