<%@page import="java.util.Iterator"%>
<%@page import="com.guestbook.DAO.GuestBookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.guestbook.vo.GuestBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
<%!GuestBook gb;%>
</head>
<body>
	<form action="add.jsp" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	<br>

	<%
		ArrayList<GuestBook> list = GuestBookDAO.selectAll();
		Iterator<GuestBook> it = list.iterator();
		while (it.hasNext()) {
			gb = it.next();
			gb.setContent(gb.getContent().replace("\r\n", "<br>"));
	%>
	<table width=510 border=1>
		<tr>
			<td><%=gb.getRank()%></td>
			<td><%=gb.getName()%></td>
			<td><%=gb.getRegdate()%></td>
			<td><a href="deleteform.jsp?id=<%=gb.getId()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=gb.getContent()%></td>


		</tr>
	</table>
	<%
		}
	%>
</body>
</html>