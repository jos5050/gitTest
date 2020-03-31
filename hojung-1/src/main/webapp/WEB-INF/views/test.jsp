<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<link href="/WEB-INF/views/test.css" rel="stylesheet" type="test/css">
<meta charset="ISO-8859-1">

<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#masonry-container").masonry({
			itemSelector:'.item',
			columnWidth:110
			})

		})
<%@ include file="/WEB-INF/views/test.js" %>
</script>
<style type="text/css">
*{margin:0px;padding:0px}
body {
	background-color: #525252;
}
.item {
	margin:5px;
	width: 100px; height: 100px;
	background-color: white; border-radius: 10px;
	float:left;
}
.big {
	width: 210px; height: 430px;
}
.normal {
	width: 210px; height: 210px;
}
.small {
	width: 100px; height: 100px;
}
</style>
</head>
<body>
<div id="masonry-container">
	<div class="item small"></div>
	<div class="item big"></div>
	<div class="item normal"></div>
	<div class="item small"></div>
	<div class="item small"></div>
	<div class="item small"></div>
	<div class="item big"></div>
	<div class="item big"></div>
	<div class="item small"></div>
	<div class="item small"></div>
	<div class="item normal"></div>
	<div class="item normal"></div>
	<div class="item small"></div>
	<div class="item small"></div>
	<div class="item big"></div>
</div>
</body>
</html>