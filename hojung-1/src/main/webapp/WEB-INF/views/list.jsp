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
/*$(document).ready(function(){
	alert("dd");
	$('td#one').css('color','red');
});*/

$(function(){
	var fruits = ['사과','pear','banana'];
	var prices = ['100','200','300'];

	$('span').html(fruits)
})

var a = document.getElementById("got");
alert(a);

</script>
</head>
<body>
 
<h2> 目録</h2>
 
<button class="btn btn-primary" onclick="location.href='/insert'">かきに行きましょう</button>
 
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
