package com.phoenix.carrot.model.controller;

import java.io.File;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phoenix.carrot.biz.sns.FileValidator;
import com.phoenix.carrot.biz.sns.SnsBoardBiz;
import com.phoenix.carrot.dao.sns.LikeTableDao;
import com.phoenix.carrot.dto.sns.EntireBoardDto;
import com.phoenix.carrot.dto.sns.LikeTableDto;
import com.phoenix.carrot.user.dto.UserDto;
import com.phoenix.carrot.utils.UploadFileUtils;

@Controller
public class SnsController {
	
	private Logger logger = LoggerFactory.getLogger(SnsController.class);
	
	@Autowired
	private FileValidator fileValidator;
	
	@Autowired
	private SnsBoardBiz biz;
	
	@Autowired
	private LikeTableDao likeDao;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/main.do")
	public String mainForm(Model model) {
		logger.info("[Controller] : main.do");
		model.addAttribute("snsBoardList", biz.snsBoardList());
		
		return "main";
	}
	
	@RequestMapping("snsBoardUserFeed.do")
	public String snsUserFeed(Model model, @RequestParam String userId) {
		logger.info("[Controller] : snsBoardUserFeed.do");
		
		
		System.out.println("userId : " + userId);
		
		model.addAttribute("snsUserFeedList", biz.snsUserFeedList(userId));
		return "snsuserfeed";
	}
	
	@RequestMapping("/snsBoardInsertForm.do")
	public String snsBoardInsertForm() {
		
		return "snsboardinsert";
	}
	
	@RequestMapping("/snsBoardInsertRes.do")
	public String snsBoardInsertRes(EntireBoardDto dto, MultipartFile file) throws Exception {
		logger.info("[Controller] : snsBoardInsertRes.do");
		
		String imgUploadPath = uploadPath + File.separator + "upload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "image" + File.separator +"none.png";
		}
		
		dto.setBoardImg(File.separator + "upload" + ymdPath + File.separator + fileName);
		dto.setBoardThumbImg(File.separator + "upload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		biz.snsBoardInsert(dto);
		
		return "redirect:main.do";
		
		/*
		 RedirectAttributes redirectAttributes파라미터 추가! 
		biz.snsBoardInsert(dto);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		
		return "redirect:main.do";
		*/
	}

	@RequestMapping("/snsBoardOne.do")
	public String snsBoardOne(Model model, int entireBoardSeq, HttpSession session) {
		logger.info("[Controller] : snsBoardOne.do");
				
		/* 게시물에대한 정보 모델링 */
		model.addAttribute("dto", biz.snsBoardOne(entireBoardSeq));
		
		return "snsboarddetail";
	}
	
	/*
	@RequestMapping("/snsBoardOne.do")
	public String snsBoardOne(Model model, int entireBoardSeq, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("[Controller] : snsBoardOne.do");
		
		Map<String, Object> resultMap = null;
		Map<String, Object> entireBoardMap = new HashMap<>();
		int userSeq = 0;
		
		try {
			Map<String, Object> Users = (Map<String, Object>) session.getAttribute("login");
			//System.out.println("Map Users : " + Users);
			userSeq = Integer.parseInt(Users.get("userSeq").toString());
			
			//게시판 상세 정보
			resultMap = biz.snsBoardOne(entireBoardSeq);
			entireBoardMap.put("entireBoardSeq", entireBoardSeq);
			entireBoardMap.put("userSeq", userSeq);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "snsboarddetail";
	}
	*/
	@RequestMapping("/snsBoardUpdateForm.do")
	public String snsBoardUpdateForm(Model model, int entireBoardSeq) {
		logger.info("[Controller] : snsBoardUpdateForm.do");
		
		model.addAttribute("dto", biz.snsBoardOne(entireBoardSeq));
		return "snsboardupdate";
	}
	
	@RequestMapping("/snsBoardUpdateRes.do")
	public String snsBoardUpdateRes(EntireBoardDto dto) {
		logger.info("[Controller] : snsBoardUpdateRes.do");
		
		if (biz.snsBoardUpdate(dto) > 0) {
			return "redirect:snsBoardOne.do?entireBoardSeq="+dto.getEntireBoardSeq();
		}
		
		return "redirect:snsBoardUpdateForm.do";
	}
	
	@RequestMapping("/snsBoardDelete.do")
	public String snsBoardDelete(int entireBoardSeq, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("[Controller] : snsBoardDelete.do");
		
		biz.snsBoardDelete(entireBoardSeq);
		
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
				
		return "redirect:main.do";
	}
	
	//빈하트 클릭시 저장 
	@ResponseBody
	@RequestMapping(value="/saveHeart.do")
	public EntireBoardDto save_heart(@RequestParam int entireBoardSeq,@SessionAttribute("login") UserDto user, HttpSession session) {
		logger.info("[Controller] : saveHeart.do");
		LikeTableDto likeDto = new LikeTableDto();
		
		//게시물 번호 세팅
		likeDto.setEntireBoardSeq(entireBoardSeq);
		
		//좋아요 누른사람 id를 세팅 
		//likeDto.setUserId((String) session.getAttribute("userid"));
		//String userId = ((String) session.getAttribute("userid"));
		int userSeq = user.getUserseq();
		String userId = user.getUserid();
		System.out.println(userId);
		likeDto.setUserSeq(userSeq);
		likeDto.setUserId(userId);
		//+1된 하트 갯수를 담아오기 위함
		EntireBoardDto dto = likeDao.pictureSaveHeart(likeDto);
		return dto;
	}
	
	@ResponseBody
	@RequestMapping(value="/removeHeart.do")
	public EntireBoardDto remove_heart(@RequestParam int entireBoardSeq,@SessionAttribute("login") UserDto user, HttpSession session) {
		logger.info("[Controller] : /removeHeart.do");
		LikeTableDto likeDto = new LikeTableDto();
		
		//게시물 번호 세팅 
		likeDto.setEntireBoardSeq(entireBoardSeq);
		
		//아이디, seq 세팅 
		int userSeq = user.getUserseq();
		String userId = user.getUserid();
		System.out.println(userId);
		likeDto.setUserSeq(userSeq);
		likeDto.setUserId(userId);
		
		//-1된 하트 갯수를 담아오기 위함
		EntireBoardDto dto = likeDao.pictureRemoveHeart(likeDto);
		return dto;
	}
	
	
}
















