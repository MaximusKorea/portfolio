<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	request.setAttribute("PAGE_TITLE","비밀번호찾기");
	request.setAttribute("CONTENT_PAGE", "../member/memberpw_find.jsp");	
%>
<jsp:forward page="../template/template.jsp"></jsp:forward>