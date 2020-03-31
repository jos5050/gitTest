package com.db1.board.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.db1.board.domain.Comment;
import com.db1.board.domain.Like;
import com.db1.board.mapper.CommentMapper;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	CommentMapper commnetMapper;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<Comment> commnetList(Model model,@RequestParam int boardid) throws Exception{
		List<Comment> list = commnetMapper.commentList(boardid);
		return list;
		
		
		
		
		
		
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int commentInsert(@RequestParam int bno, @RequestParam String content,HttpSession session) throws Exception{
		
        Comment comment = new Comment();
        comment.setBoardid(bno);
        comment.setContent(content);
        comment.setDate(LocalDate.now());
        comment.setWriter((String) session.getAttribute("id"));
        int a = commnetMapper.commentInsert(comment);
        System.out.println(a);

		return a; 
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int commentUpdate(@RequestParam int id, @RequestParam String content,HttpSession session)  throws Exception{
		Comment comment = new Comment();
		comment.setId(id);
		comment.setContent(content);
		int a = commnetMapper.commentUpdate(comment);
		
		
		return a;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public int commentDelete(@RequestParam int id) throws Exception {
		
		int a = commnetMapper.commentDelete(id);
		
		
		return a;
	}
	
	@PostMapping("/addLike")
	@ResponseBody
	public int addLike(@RequestParam int bno, @RequestParam String memberNum) throws Exception {
		
			System.out.println(bno+memberNum);
			int a = 0;
			try {
				a = commnetMapper.likeAdd(bno, memberNum); 
			} catch (Exception e) {
			
			}
			
			
			
		return a;
	}
	@PostMapping("/likeCount")
	@ResponseBody
	public int likeCount(@RequestParam int bno, @RequestParam String memberNum) throws Exception {
			
			Like like = new Like();
			like.setBno(bno);
			like.setMemberNum(memberNum);
			int a = commnetMapper.likeCount(like);
			
			
		return a;
	}
}
