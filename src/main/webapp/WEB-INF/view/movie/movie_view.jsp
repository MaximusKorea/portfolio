<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setAttribute("PAGE_TITLE", "영화상세보기");
    request.setAttribute("CONTENT_PAGE", "../movie/contents/movie_view.jsp");
%>
<jsp:forward page="../template/template.jsp" />