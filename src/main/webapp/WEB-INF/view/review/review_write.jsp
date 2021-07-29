<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setAttribute("PAGE_TITLE", "후기게시판");
    request.setAttribute("CONTENT_PAGE", "../review/contents/review_write.jsp");
%>
<jsp:forward page="../template/template.jsp" />