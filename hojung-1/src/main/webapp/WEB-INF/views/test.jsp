<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function button1_click(s) {
	alert( s + " 버튼을 누르셨습니다.");
}

document.bgcolor('red');
</script>
</head>
<body>
<button id="button1" onclick="button1_click('hello');">버튼1</button>
</body>
</html>