<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>
	<% if (session.getAttribute("sUserId") == null) { %>
	<a href="manage"><img alt="MOVIE STORE" src="images/logo.png" /></a> 관리 페이지
	<% } else { %>
	<a href="manage_main"><img alt="MOVIE STORE" src="images/logo.png" /></a> 관리 페이지
	<% } %>
</h1>