<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
</head>
<body>
 
 
<h2> デテイル </h2>
 <button class="btn btn-primary" onclick="location.href='/update/${detail.bno}'">修正</button> <!-- 추가 -->
<button class="btn btn-danger" onclick="location.href='/delete/${detail.bno}'">削除</button>  <!-- 추가 -->

<div class="container">
    <form action="/insertProc" method="post">
      <div class="form-group">
        <label>タイトル</label>
        <p>${detail.subject}</p>
      </div>
      <div class="form-group">
        <label>作成者</label>
        <p>${detail.writer}</p>
      </div>
      <div class="form-group">
        <label>日付</label>
        <p>${detail.reg_date}</p>
      </div>
            <div class="form-group"> <!-- 첨부파일 다운로드 -->
        <label>添付ファイル</label>
        <p><a href="/fileDown/${files.bno}">${files.fileOriName}</a></p>
      </div>    
      <div class="form-group">
        <label>内容</label>
        <p>${detail.content}</p>
      </div>
    </form>
      <button type="button" onclick="location.href='/list'" class="btn btn-primary">main</button>
</div>
 
 
<%@ include file="bootstrap.jsp" %>
</body>
</html>

