/**
 * 
 */

var bno = '${bno}'; 


$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 


     $("#addComment").on('click',(function(){ 
        var insertData = $('[name=commentInsertForm]').serialize();
        commentInsert(insertData); 
    }));
     
});
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
