<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%	 
	request.setAttribute("PAGE_TITLE","����������");
	request.setAttribute("CONTENT_PAGE", "../member/mypage.jsp");	
	request.setAttribute("MENU_PAGE", "pageOp2.jsp");	
%>
<jsp:forward page="../template/template.jsp"></jsp:forward>