<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setAttribute("PAGE_TITLE", "게시판검색");
    request.setAttribute("CONTENT_PAGE", "../board/contents/board_search.jsp");
%>
<jsp:forward page="../template/template.jsp" />