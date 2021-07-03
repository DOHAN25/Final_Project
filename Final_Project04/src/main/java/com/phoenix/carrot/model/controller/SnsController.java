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
import com.phoenix.carrot.biz.sns.LikeTableBiz;
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
	private LikeTableBiz likebiz;
	
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
	public String snsBoardOne(Model model, int entireBoardSeq,@SessionAttribute("login") UserDto userdto, HttpSession session) {
		logger.info("[Controller] : snsBoardOne.do");
		int userSeq = userdto.getUserseq();
		// 게시물에대한 정보 모델링 
		model.addAttribute("dto", biz.snsBoardOne(entireBoardSeq));
		model.addAttribute("likeCheck",likebiz.likeCheck(entireBoardSeq, userSeq));
		
		return "snsboarddetail";
	}
	

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
		EntireBoardDto dto = likebiz.pictureSaveHeart(likeDto);
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
		EntireBoardDto dto = likebiz.pictureRemoveHeart(likeDto);
		return dto;
	}
	/*
	@RequestMapping("/snsBoardOne.do")
	public String snsBoardOne(Model model, @RequestParam int entireBoardSeq, @SessionAttribute("login") UserDto user, HttpSession session) {
		logger.info("[Controller] : snsBoardOne.do");
		 		
		model.addAttribute("dto", biz.snsBoardOne(entireBoardSeq));
		HashMap<String, Object> idxMap = new HashMap<String, Object>();
		int userSeq = user.getUserseq();
		idxMap.put("entireBoardSeq", entireBoardSeq);
		idxMap.put("userSeq", userSeq);
		
		Map<String,Object> likeCheckMap = likebiz.likeCheck(idxMap);
		
		//like테이블에서 사용자가 해당 게시글에 대해서 좋아요를 눌렀는지 확인
		if(likeCheckMap == null) {
			//사용자가 좋아요를 한번도 누른적이 없으면
			//like테이블에 데이터가 없으므로 null반환
			model.addAttribute("likeCheck", 0);
		} else {
			model.addAttribute("likeCheck", likeCheckMap.get("likeCheck"));
		}
		
		
		return "snsboarddetail";
	}
	*/
}
















