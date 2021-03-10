<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri= "http://java.sun.com/jsp/jstl/core"prefix ="c" %>
  
<c:choose>
	<c:when test="${sessionScope.Id==null }">
	<a href="${path }/member/logincheck"></a>
	</c:when>
</c:choose>