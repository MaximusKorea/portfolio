<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.member.Member"%>
<%@ page import="service.member.MemberServiceImpl"%>
<%@ page import="service.member.MemberService"%>
<%
	String opStr = (String)request.getAttribute("op");
	System.out.println("opStr:"+opStr);

  	boolean op = true;
	if(opStr.equalsIgnoreCase("true"))
		op = true;
	else
		op = false;
%>
<%=op%>
${op }
  
 