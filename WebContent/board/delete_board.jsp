<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%-- board/delete_board.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="path" value="/board_list.pj3">
	<c:param name="info_idx" value="${param.info_idx }"/>
	<c:param name="page" value="${param.page }"/>
</c:url>

<script>
	alert("삭제되었습니다");
	location.href = "${path}";
</script>











