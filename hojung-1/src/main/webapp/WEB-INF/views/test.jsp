<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
function button1_click(s) {
	alert( s + " 버튼을 누르셨습니다.");
}
var member = new Object();

member.id= "jos5050";
member.password="1410";
member.gender= "male"

console.log(member);

$(function(){
	alert($('#botton1').val())
})

</script>
</head>
<body>
<button id="button1" onclick="button1_click('hello');" value="11">버튼1</button>
</body>
</html>