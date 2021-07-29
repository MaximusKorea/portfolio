<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setAttribute("PAGE_TITLE", "메인");
    request.setAttribute("CONTENT_PAGE", "../main/contents/index.jsp");
    request.setAttribute("CONTENT_PAGE_BANNER", "../main/contents/index2.jsp");
%>
<jsp:forward page="../template/template.jsp" />