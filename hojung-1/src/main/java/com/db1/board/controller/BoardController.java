 package com.db1.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.db1.board.domain.BoardVO;
import com.db1.board.domain.FileVO;
import com.db1.board.domain.Search;
import com.db1.board.service.BoardService;

@Controller
public class BoardController {

	@Resource(name = "com.db1.board.service.BoardService")
	BoardService mBoardService;

	@RequestMapping("/")
	public String index() throws Exception {
		return "index";
	}

	@RequestMapping("/list") // 
	private String boardList(Model model) throws Exception {

		model.addAttribute("list", mBoardService.boardListService());

		return "list";
	}

	@RequestMapping("/detail/{bno}") 
	private ModelAndView boardDetail(@PathVariable int bno, HttpSession session) throws Exception{
	        
	    session.setAttribute("bno", bno);
	    ModelAndView modelAndView = new ModelAndView("detail");
	    modelAndView.addObject("detail", mBoardService.boardDetailService(bno));
	    modelAndView.addObject("files", mBoardService.fileDetailService(bno));
//	    model.addAttribute("detail", mBoardService.boardDetailService(bno));
//	    model.addAttribute("files", mBoardService.fileDetailService(bno)); //추가
	    return modelAndView;
	}

	@RequestMapping("/insert") // 게시글 작성폼 호출
	private ModelAndView boardInsertForm() {
		System.out.println("gg");
		ModelAndView modelAndView = new ModelAndView("insert");
		System.out.println("gg");
		return modelAndView ;
	}

	@RequestMapping("/insertProc")
    private String boardInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
        
        BoardVO board = new BoardVO();
        FileVO  file  = new FileVO();
        
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));
        
        
        if(files.isEmpty()){ 
            mBoardService.boardInsertService(board); //게시글 insert
        }else{
            String fileName = files.getOriginalFilename(); 
            System.out.println(fileName);
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            System.out.println(fileNameExtension);
            File destinationFile; 
            String destinationFileName; 
            String fileUrl = "C:\\Users\\x-user\\Desktop\\uploadFile\\upload\\";
            
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(fileUrl+ destinationFileName); 
            } while (destinationFile.exists()); 
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            
            mBoardService.boardInsertService(board); //게시글 insert
            
            file.setBno(board.getBno());
            file.setFileName(destinationFileName);
             file.setFileOriName(fileName);
            file.setFileUrl(fileUrl);
            
            mBoardService.fileInsertService(file); //file insert
        }
        
        
        return "redirect:/list"; 
    }

	@RequestMapping("/update/{bno}") // 게시글 수정폼 호출
	private String boardUpdateForm(@PathVariable int bno, Model model,HttpSession session) throws Exception {

		model.addAttribute("detail", mBoardService.boardDetailService(bno));
		session.setAttribute("boardid", mBoardService.boardDetailService(bno).getBno());
		
		return "update";
	}

	@RequestMapping("/updateProc")
	private String boardUpdateProc(HttpServletRequest request) throws Exception {

		BoardVO board = new BoardVO();
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setBno(Integer.parseInt(request.getParameter("bno")));

		mBoardService.boardUpdateService(board);

		return "redirect:/detail/" + request.getParameter("bno");
	}

	@RequestMapping("/delete/{bno}")
	private String boardDelete(@PathVariable int bno) throws Exception {

		mBoardService.boardDeleteService(bno);

		return "redirect:/list";
	}
	@RequestMapping("/fileDown/{bno}")
    private void fileDown(@PathVariable int bno, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        request.setCharacterEncoding("UTF-8");
        FileVO fileVO = mBoardService.fileDetailService(bno);
        try{
            String fileUrl = fileVO.getFileUrl();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.getFileName();
            
            String oriFileName = fileVO.getFileOriName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	
	@RequestMapping("/search")
	public String search(String how,String search,Model model) throws Exception {
		Search newSearch = new Search();
		newSearch.setHow(how);
		newSearch.setSearch(search);
		
		List<BoardVO> searchBoard = mBoardService.searchBoard(how,search);
		System.out.println(searchBoard);
		
		model.addAttribute("list", searchBoard);
		return "list";
	}
}
