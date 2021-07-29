<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setAttribute("PAGE_TITLE", "대여영화상세보기");
    request.setAttribute("CONTENT_PAGE", "../shop/contents/shop_rental_view.jsp");
%>
<jsp:forward page="../template/template.jsp" />