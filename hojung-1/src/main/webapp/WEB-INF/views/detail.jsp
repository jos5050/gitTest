<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">

var bno = '${bno}'; 
var writer ;

$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 


     $("#addComment").on('click',(function(){ 
        var insertData = $('[name=commentInsertForm]').serialize();
        commentInsert(insertData); 
    }));


     $(".btn-like").click(function(){
     	like();
     })
     
});
<%session = request.getSession();%>
var id = "<%=session.getAttribute("id") %>"
function like(){
	alert(${detail.bno})
	alert(id)

	$.ajax({
		url:'/comment/like',
		type:'post',
		data:{"bno":${detail.bno},"memberNum":id},
		success: function(){
			
			}
		})
	
}




function commentUpdateProc(id){
	var updateContent = $('[name=content_'+id+']').val();

	$.ajax({
		url:'/comment/update',
		type:'post',
		data:{'content':updateContent,'id':id},
		success:function(data){
			if(data==1) commentList(id);

			}
		});
		
}

function commentDelete(id){

	$.ajax({
	url:'/comment/delete',
	type:'post',
	data:{'id':id},
	success : function(data){
		if(data==1) commentList(id);
		}	
		})
}




function commentUpdate(id, content){
    var a ='';
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+id+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+id+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+id).html(a);
    
}
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'boardid':bno},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.id+'">'+'comment番号 : '+value.id+' / 作成者 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.id+',\''+value.content+'\');">　修正 </a>';
                a += '<a onclick="commentDelete('+value.id+');"> 削除 </a> </div>';
                a += '<div class="commentContent'+value.id+'"> <p> 内容 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}


</script>
</head>
<body>


	<h2>デテイル</h2>
	<button class="btn btn-primary"
		onclick="location.href='/update/${detail.bno}'">修正</button>
	<!-- 추가 -->
	<button class="btn btn-danger"
		onclick="location.href='/delete/${detail.bno}'">削除</button>
	<!-- 추가 -->

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
			<div class="form-group">
				<!-- 첨부파일 다운로드 -->
				<label>添付ファイル</label>
				<p>
					<a href="/fileDown/${files.bno}">${files.fileOriName}</a>
				</p>
			</div>
			<div class="form-group">
				<label>内容</label>
				<p>${detail.content}</p>
			</div>
			
		</form>
		<button class="btn-like">👍</button>
		<button type="button" onclick="location.href='/list'"
			class="btn btn-primary">main</button>
	</div>
	<div class="container">
		<label for="content">comment</label>
		<form name="commentInsertForm">
			<div class="input-group">
				<input type="hidden" name="bno" value="${detail.bno}" /> <input
					type="text" class="form-control" id="content" name="content"
					placeholder="内容を入力して下さい"> <span class="input-group-btn">
					<button class="btn btn-default" type="button"
						name="commentInsertBtn" id="addComment">登録</button>
				</span>
			</div>
		</form>
	</div>

	<div class="container" style="overflow: auto; height: 300px;">
		<div class="commentList"></div>
	</div>
	<%@ include file="bootstrap.jsp"%>
</body>
</html>
