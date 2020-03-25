<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
<script type="text/javascript">

$(function(){
	var fruits = ['사과','pear','banana'];
	var prices = ['100','200','300'];

	$('span').html(fruits)
})

function validate(){
	alert("no")
	
	
	return;
}
//search
$(document).ready(function(){

	$("#val").click(function(){
		var how = $('input[name="how"]:checked').val();
		alert(how)
		var what = $("#what").val();
		if(how == ""){
			alert("検索する場所を選んでください")
			return;
		};

		if(what == ""){
			$("#what").fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn();
			alert("検索内容を書いてください")
			return;
		}
		
		$("#search").submit();
		
		})
		
})
</script>
</head>
<body>
 
<h2> 目録</h2>
 
<button class="btn btn-primary" onclick="location.href='/insert'">かきに行きましょう</button>
<form action="/search" method="get" id="search">
	title<input type="radio" name="how" value="subject" id="how" checked="checked" class="result">
	writer<input type="radio" name="how" value="writer" id="how2" class="result">
	content<input type="radio" name="how" value="content" id="how3" class="result">
	<input type="text" name="search" id="what">
	<input type="button" value="検索" id="val">	
</form>
<div class="container">
    <table class="table table-hover">
        <tr>
            <th>No</th>
            <th>Subject</th>
            <th>Writer</th>
            <th>Date</th>
        </tr>
          <c:forEach var="l" items="${list}">
                <tr onclick="location.href='/detail/${l.bno}'"> 
                  <td>${l.bno}</td>
                  <td id="one">${l.subject}</td>
                  <td>${l.writer}</td>
                  <td>${l.reg_date}</td>	
              </tr>
          </c:forEach>
          
    </table>
</div>
 <h3 id="got" class="gg"></h3>
<%@ include file="bootstrap.jsp" %>
</body>
</html>
