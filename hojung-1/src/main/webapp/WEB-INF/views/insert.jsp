<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert</title>
</head>
<body>
 
<h2> 作成 </h2>
 
<div class="container">
    <form action="/insertProc" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="subject">title</label>
        <input type="text" class="form-control" id="subject" name="subject" placeholder="title">
      </div>
      <div class="form-group">
        <label for="writer">writer</label>
        <input type="text" class="form-control" id="writer" name="writer" placeholder="内容">
      </div>
      <div class="form-group">
        <label for=content">content</label>
        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
      </div>
       <input type="file" name="files"> <!-- 추가 -->

      <button type="submit" class="btn btn-primary">作成</button>
    </form>
</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>
