<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
function summit(){
	var id = document.forms["form"]["id"].value;
	var password = document.forms["form"]["password"].value;
	var address = document.forms["form"]["address"].value;
	var phoneNum = document.forms["form"]["phoneNum"].value;
	var gender = document.forms["form"]["gender"].value;
	
	if(id==""){
		alert("idを書いてください")
	}
	if(password==""){
		alert("passwordを書いてください")
	}
	if(address==""){
		alert("addressを書いてください")
	}
	if(phoneNum==""){
		alert("phoneNumを書いてください")
	}
	if(gender==""){
		alert("genderを書いてください")
	}
	
	document.form.action="/accountJoin";
	document.form.method="post";
	document.form.submit();
	location.href="/"
	window.close();
}
</script>
</head>
<body>

<h1>加入</h1>
	   <form action="/accountJoin" method="post" name="form">
		<input type="text" name="id" placeholder="ID"><br>
		<input type="password" name="password" placeholder = "PWD"><br>
		<input type="text" name="address" placeholder="ADDRESS"><br>
		<input type="text" name="phoneNum" placeholder="PHONE"><br>
		男<input type="radio" name="gender" value="男" checked="checked">
		女<input type="radio" name="gender" value="女"><br>
		<input type="button" onclick="summit()" value="完了">
	</form>
	<br>
</body>
</html>