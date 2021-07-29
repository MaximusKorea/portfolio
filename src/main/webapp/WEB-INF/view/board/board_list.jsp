<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setAttribute("PAGE_TITLE", "게시판리스트");
    request.setAttribute("CONTENT_PAGE", "../board/contents/board_list.jsp");
%>
<jsp:forward page="../template/template.jsp" />