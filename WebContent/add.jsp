<%@page import="com.guestbook.DAO.GuestBookDAO"%>
<%@page import="com.guestbook.vo.GuestBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%!GuestBook gb = new GuestBook();%>
</head>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");

	gb.setName(name);
	gb.setPassword(password);
	gb.setContent(content);
	GuestBookDAO.insert(gb);

	response.sendRedirect("index.jsp");
%>

</html>