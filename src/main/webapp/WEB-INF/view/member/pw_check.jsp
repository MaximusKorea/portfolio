<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 	boolean op = (boolean)request.getAttribute("equalPw");	
	System.out.println("비밀번호값 넘어온 거 확인:"+op);
%>
<%=op%>