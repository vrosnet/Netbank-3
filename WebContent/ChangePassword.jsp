<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%UUID id = (UUID) session.getAttribute("cusID"); %>
<%=id%>
<form action="ChangePasswordServlet" method="post">
	<input type="password" name="oldpassword" placeholder="Old password">
	<input type="password" name="newpassword" placeholder="New password">
	<input type="password" name="repeatednewpassword" placeholder="Repeat new password">
	<input type="hidden" name="cusID" value="<%=id%>"/>
	<input type="submit" name="login">			
</form>
<form name="Menu" action="MainMenu.jsp">
	<input type="hidden" name="cusID" value="<%=id%>"/>
	<input type="submit" value="Back to Menu" />
</form>
</body>
</html>