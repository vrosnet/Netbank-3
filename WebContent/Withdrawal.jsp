<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="netbank.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Put-in</title>
</head>
<body>
	<div style="text-align: center">
		<%
			UUID id = (UUID) session.getAttribute("cusID");
			if (session == null || session.getAttribute("cusID") == null)
				response.sendRedirect("/Netbank/index.jsp");
			ArrayList<Account> accounts = DatabaseGet.getAccountsByUserID(id);
		%>
		<h5><%=id%></h5>
		<form action="WithdrawalServlet" method="get">
			<table border="1" style="width: 100%">
				<tr>
					<td>Account ID</td>
					<td>Balance</td>
					<td>Currency</td>
					<td>Choice</td>
				</tr>
				<%
					NumberFormat numberFormat = NumberFormat.getCurrencyInstance(Locale.CANADA);
					if (accounts != null) {
						for (int i = 0; i < accounts.size(); i++) {
							numberFormat.setCurrency(accounts.get(i).getCurrency());
				%>
				<tr>
					<td><%=accounts.get(i).getAccountID().toString()%></td>
					<td><%=numberFormat.format(accounts.get(i).getBalance())%></td>
					<td><%=accounts.get(i).getCurrency().getDisplayName()%></td>
					<td><input type="radio" name="choice"
						value="<%=accounts.get(i).getAccountID()%>"></td>
				</tr>
				<%
						}
					}
				%>
			</table>
			Amount: <input type="number" step="any" name="amount"
				placeholder="Amount"> <br /> <input type="submit"
				name="withdrawal">
		</form>
		<form name="Menu" action="MainMenu.jsp">
			<input type="submit" value="Back to Menu" />
		</form>
	</div>
</body>
</html>