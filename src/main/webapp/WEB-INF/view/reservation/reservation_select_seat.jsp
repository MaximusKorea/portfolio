<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setAttribute("PAGE_TITLE", "영화예매");
    request.setAttribute("CONTENT_PAGE", "../reservation/contents/reservation_select_seat.jsp");
%>
<jsp:forward page="../template/template.jsp" />