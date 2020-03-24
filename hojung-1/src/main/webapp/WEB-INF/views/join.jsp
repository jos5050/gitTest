<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function summit(){
	//document.form.submit();
	location.href="index"
}
</script>
</head>
<body>

<h1>Hello</h1>
<h1>加入</h1>
	   <form action="/accountJoin" method="post" name="form">
		<input type="text" name="id" placeholder="ID"><br>
		<input type="password" name="password" placeholder = "PWD"><br>
		<input type="text" name="address" placeholder="ADDRESS"><br>
		<input type="text" name="phoneNum" placeholder="PHONE"><br>
		男<input type="radio" name="gender" value="男">
		女<input type="radio" name="gender" value="女"><br>
		<!--<input type="button" value="完了" name="good" id="main" onclick="main()">-->
		<input type="submit" onclick="summit()" value="完了">
	</form>
	<br>
</body>
</html>