<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", intial-scale="1">
<link rel= "stylesheet" href="css/bootstrap.css"> <!-- 디자인을 담당하는 css를 참조 -->
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<nav class="navbar navbar-default"> <!-- 네비게이션: 하나의 웹사이트의 전반적인 구성을 보여주는 역할 -->
		<div class = "navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false"> <!-- 브라우저 창의 크기가 줄어들면(=모바일 화면 상에서) 토글 메뉴 버튼이 나옴. -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a> <!-- brand: 로고 같은 것을 의미 -->
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li> <!-- main.jsp로 이동하는 nav 요소 -->
				<li><a href="board.jsp">게시판</a></li> <!-- board.jsp로 이동하는 nav요소 -->
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a> <!-- 드랍다운 메뉴 생성 -->
					<ul class="dropdown-menu">
						<li class="active"><a href=login.jsp">로그인</a></li> <!-- active는 하나만 존재 : 선택될 부분은 현재 페이지(login.jsp)에만 되어 있어야 하기 때문 -->
						<li><a href=join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp"><!-- post방식: 어떠한 정보를 url 창에서 숨기면서 보낼 때 사용. -->
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-controll" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-controll" placeholder="비밀번호" name="userPWD" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script> <!-- 액션을 담당하는 JS를 참조 -->

</body>
</html>