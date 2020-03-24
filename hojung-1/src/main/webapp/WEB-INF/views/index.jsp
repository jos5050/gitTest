<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org./1999/xhtml"
	  xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript">

function summit(){
	document.form.submit();
	location.href="index"
}
</script>
</head>
<body>
	<h2>
	<%
		session = request.getSession();
		out.print(session.getAttribute("id")+"さんようこそ");
	%>
	</h2>
	<br>
	<!--  <h1 th:if="${session.account != null}" th:text="${session.account}></h1>-->
	<c:if test="${id == null}">
	<button type="button" onclick="location.href='login'"　 class="btn btn-primary btn-lg">login</button><br><br>
	</c:if>
	<c:if test="${id != null}"><button type="button" onclick="location.href='logout'"　 class="btn btn-primary btn-lg">logOut</button><br><br></c:if>
	<c:if test="${id == null}"><button type="button" onclick="location.href='join'"  class="btn btn-primary btn-lg">join</button><br><br></c:if>
	<c:if test="${id != null}"><button type="button" onclick="location.href='list'"  class="btn btn-primary btn-lg">Main</button><br><br></c:if>
</body>
</html>