<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장을 작성하기 위해 import -->
<jsp:useBean id="user" class="user.UserDTO" scope="request"/>
<jsp:useBean id="userDAO" class="user.UserDAO" scope="request"/>

<jsp:setProperty name="user" property="userID"/> <!-- UserDTO클래스의 setUserID(userId); -->
<jsp:setProperty name="user" property="userPWD"/>
<jsp:setProperty property="uDto" name="userDAO" value="<%=user%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
		int result = userDAO.login();
		System.out.println(result);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}else if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if (result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>