package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import domain.board.Board;
import pagebean.ListPageConfigBean;
import pagebean.ListPageConfigBeanContent;
import pagebean.ListPageConfigBeanType;
import pagebean.ListPageConfigBeanTypeWriter;
import service.board.BoardService;

@Controller
public class BoardController {
	
	@Autowired private BoardService boardService;

	/******************************************** 회원 ***********************************************/
	// 회원 게시판(Notice)
	@RequestMapping(value = "/board_list")
	public String board_list(Model model,
							@RequestParam String pageno,
							@RequestParam String board_type) throws Exception {
		model.addAttribute("boardListPage",
				boardService.board_readAll(new ListPageConfigBeanType(5, 5, pageno, "", "", board_type)));
		return "board/board_list";
	}

	// 회원 게시판(1:1)
	@RequestMapping(value = "/board_list2")
	public String board_list_writer(Model model,
									@RequestParam String pageno,
									@RequestParam String board_type,
									HttpSession session) throws Exception {
		model.addAttribute("boardListPage",
				boardService.board_readAll_writer(new ListPageConfigBeanTypeWriter(5, 5, pageno, "", "", board_type, (String) session.getAttribute("sUserId"))));
		return "board/board_list";
	}

	// 회원 게시판 작성 폼
	@RequestMapping(value = "/board_write")
	public String board_write() {
		return "board/board_write";
	}

	// 회원 게시판 작성(1:1)
	@RequestMapping(value = "/board_write_action")
	public String board_write_action(@RequestParam String board_writer,
									@RequestParam String board_title,
									@RequestParam String board_content,
									@RequestParam String board_type) throws Exception {
		boardService.board_create(new Board(0, board_title, board_writer, board_content, new Date(), board_type, "imageRoot", 0, 0, 1, 0));
		return "redirect:board_list2?pageno=1&board_type=" + board_type;
	}

	// 회원 게시판 뷰
	@RequestMapping(value = "/board_view")
	public String board_view(Model model,
							@RequestParam int board_no,
							@RequestParam String pageno) throws Exception {
		Board readBoard = boardService.board_readByNo(board_no);
		boardService.board_update_readCount(readBoard);
		model.addAttribute("readBoard", readBoard);
		model.addAttribute("pageno", pageno);
		return "board/board_view";
	}

	// 회원 게시판 수정 폼
	@RequestMapping(value = "/board_update")
	public String board_update(Model model,
								@RequestParam int board_no,
								@RequestParam String pageno,
								@RequestParam String board_type) throws Exception {
		model.addAttribute("readBoard", boardService.board_readByNo(board_no));
		model.addAttribute("pageno", pageno);
		model.addAttribute("board_type", board_type);
		return "board/board_update";
	}

	// 회원 게시판 수정
	@RequestMapping(value = "/board_update_action")
	public String board_update_action(@RequestParam int board_no,
									@RequestParam String board_title,
									@RequestParam String board_content) throws Exception {
		Board board = boardService.board_readByNo(board_no);
		boardService.board_update(new Board(board.getBoard_no(), board_title, board.getBoard_writer(), board_content,
											board.getBoard_regDate(), board.getBoard_type(), board.getBoard_image(), board.getReadCount(),
											board.getBoard_groupno(), board.getBoard_step(), board.getBoard_depth()));
		return "redirect:board_list?pageno=1&board_type=" + board.getBoard_type();
	}

	// 회원 게시물 삭제
	@RequestMapping(value = "/board_delete")
	public String board_delete(@RequestParam int board_no, @RequestParam String board_type) throws Exception {
		boardService.board_delete(board_no);
		return "redirect:board_list2?pageno=1&board_type=" + board_type;
	}

	/***************************************************************************************************/
	
	/******************************************** 관리자 ***********************************************/
	// 관리자 게시판 리스트
	@RequestMapping(value = "/board_list_admin")
	public String board_list_admin(Model model,
									@RequestParam String pageno,
									@RequestParam String board_type) throws Exception {
		model.addAttribute("boardListPage", boardService.board_readAll(new ListPageConfigBeanType(5, 5, pageno, "", "", board_type)));
		return "manage/manage_board_list";
	}

	// 관리자 게시판 뷰
	@RequestMapping(value = "/board_view_admin")
	public String board_view_admin(Model model,
									@RequestParam int board_no,
									@RequestParam String pageno) throws Exception {
		Board readBoard = boardService.board_readByNo(board_no);
		boardService.board_update_readCount(readBoard);
		model.addAttribute("readBoard", readBoard);
		model.addAttribute("pageno", pageno);
		return "manage/manage_board_view";
	}

	// 관리자 게시판 작성 폼
	@RequestMapping(value = "/board_write_admin")
	public String board_write_admin() {
		return "manage/manage_board_write";
	}

	// 관리자 게시판 작성(파일업로드)
	@RequestMapping(value = "/board_write_action_admin")
	public String board_write_action_admin(@RequestParam String board_writer,
											@RequestParam String board_title,
											@RequestParam String board_content,
											@RequestParam("file") MultipartFile file,
											@RequestParam String board_type) throws Exception {
		boardService.board_create(
				new Board(0, board_title, board_writer, board_content, new Date(), board_type, "images/"+file.getOriginalFilename(), 0, 0, 1, 0));
		String rootPath = "C:\\Users\\HAN\\Desktop\\spr\\spring_workspace\\movieProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
		uploadFile(file, rootPath);
		return "redirect:board_list_admin?pageno=1&board_type=" + board_type;
	}

	// 관리자 게시판 수정 폼
	@RequestMapping(value = "/board_update_admin")
	public String board_update_admin(Model model,
									@RequestParam int board_no,
									@RequestParam String pageno,
									@RequestParam String board_type) throws Exception {
		model.addAttribute("readBoard", boardService.board_readByNo(board_no));
		model.addAttribute("pageno", pageno);
		model.addAttribute("board_type", board_type);
		return "manage/manage_board_update";
	}

	// 관리자 게시판 수정
	@RequestMapping(value = "/board_update_action_admin")
	public String board_update_action_admin(@RequestParam int board_no,
											@RequestParam String board_title,
											@RequestParam String board_content) throws Exception {
		Board board = boardService.board_readByNo(board_no);
		boardService.board_update(new Board(board.getBoard_no(), board_title, board.getBoard_writer(), board_content,
											board.getBoard_regDate(), board.getBoard_type(), board.getBoard_image(), board.getReadCount(),
											board.getBoard_groupno(), board.getBoard_step(), board.getBoard_depth()));
		return "redirect:board_list_admin?pageno=1&board_type=" + board.getBoard_type();
	}

	// 관리자 게시판 삭제
	@RequestMapping(value = "/board_delete_admin")
	public String board_delete_admin(@RequestParam int board_no, @RequestParam String board_type) throws Exception {
		boardService.board_delete(board_no);
		return "redirect:board_list_admin?pageno=1&board_type=" + board_type;
	}

	// 관리자 게시물 답변 폼
	@RequestMapping(value = "/board_reply_write")
	public String board_reply(Model model,
							@RequestParam int board_no,
							@RequestParam String pageno,
							@RequestParam String board_type) throws Exception {
		model.addAttribute("readBoard", boardService.board_readByNo(board_no));
		model.addAttribute("pageno", pageno);
		model.addAttribute("board_type", board_type);
		return "manage/manage_board_reply";
	}

	// 관리자 게시물 답변
	@RequestMapping(value = "/board_reply_write_action")
	public String board_reply_write(Model model,
									@RequestParam int board_no,
									@RequestParam String board_writer,
									@RequestParam String board_title,
									@RequestParam String board_content) throws Exception {
		Board board = boardService.board_readByNo(board_no);

		boardService.board_reply_create(new Board(board.getBoard_no(), board_title, board_writer, board_content,
				board.getBoard_regDate(), board.getBoard_type(), board.getBoard_image(), board.getReadCount(),
				board.getBoard_groupno(), board.getBoard_step() + 1, board.getBoard_depth() + 1));
		return "redirect:board_list_admin?pageno=1&board_type=" + board.getBoard_type();
	}

	/***************************************************************************************************/

	// 게시물 검색 내용
	@RequestMapping(value = "/board_search_content")
	public String board_searchByContent(Model model,
										@RequestParam String pageno,
										@RequestParam String search,
										@RequestParam String board_type,
										@RequestParam String board_writer) throws Exception {
		model.addAttribute("boardListPage",
				boardService.board_searchByContent(new ListPageConfigBeanContent(5, 5, pageno, search, board_type, board_writer)));
		return "board/board_search";
	}
	
	// 게시물 검색 제목
	@RequestMapping(value = "/board_search_title")
	public String board_searchByTitle(Model model,
									@RequestParam String pageno,
									@RequestParam String search,
									@RequestParam String board_type) throws Exception {
		model.addAttribute("boardListPage",
				boardService.board_searchByTitle(new ListPageConfigBean(5, 5, pageno, search, board_type)));
		return "board/board_search";
	}
	
	/***************************************************************************************************/

	public void uploadFile(MultipartFile file, String rootPath) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File(rootPath + File.separator);
				if (!dir.exists()) dir.mkdirs();

				File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println("절대경로" + serverFile.getAbsolutePath());
				System.out.println("경로images/" + file.getOriginalFilename());

			} catch (Exception e) {}
		}

	}

}