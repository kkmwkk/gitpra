package com.kh.myapp.market.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.myapp.market.model.service.MarketQnaService;
import com.kh.myapp.market.model.service.MarketReviewService;
import com.kh.myapp.market.model.vo.MarketQnaVO;
import com.kh.myapp.market.model.vo.MarketReviewVO;

@Controller
@RequestMapping("/market/*")
public class MarketController {

	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);

	@Autowired
	private MarketReviewService reviewService;

	@Autowired
	private MarketQnaService qnaService;
	

	// 마켓 상품 상세페이지 (리뷰 & qna) 
	@RequestMapping(value = "/marketDetailView", method = RequestMethod.GET)
	public void marketDetailView(int regPage, Model model) throws Exception {
		String test = qnaService.prdQnaWrite(regPage);
		model.addAttribute("qna", test);
		List<MarketReviewVO> reviewlist = reviewService.reviewList();
		model.addAttribute("reviewlist", reviewlist);
		List<MarketQnaVO> qnalist = qnaService.qnaList();
		model.addAttribute("qnalist", qnalist);
	}

	// 리뷰 상세
	@RequestMapping(value = "/reivewDetail", method = RequestMethod.GET)
	public String reivewDetail(MarketReviewVO marketReviewVO, Model model, int prdReviewno) throws Exception {
		logger.info("리뷰 상세조회");
		reviewService.reviewDetail(marketReviewVO.getPrdReviewno());
		model.addAttribute("reivewdetail", reviewService.reviewDetail(marketReviewVO.getPrdReviewno()));
		return "/market/reivewDetail";
	}
	
	// 리뷰 작성
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String reviewInsert(MarketReviewVO marketreviewVO) throws Exception {
		logger.info("리뷰 작성");
		reviewService.reviewInsert(marketreviewVO);
		return "redirect:marketDetailView?regPage=1";
	}

	// 리뷰 수정
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.POST)
	public String reviewUpdate(MarketReviewVO marketReviewVO) throws Exception {
		logger.info("리뷰 수정");
		reviewService.reviewUpdate(marketReviewVO);
		return "redirect:marketDetailView?regPage=1";
	}

	// 리뷰 삭제
	@RequestMapping(value = "/reviewDelete")
	public String reviewDelete(MarketReviewVO marketReviewVO) throws Exception {
		logger.info("리뷰 삭제");
		reviewService.reviewDelete(marketReviewVO.getPrdReviewno());
		return "redirect:marketDetailView?regPage=1";
	}
	
	// QnA 상세
	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(MarketQnaVO marketQnaVO, Model model, int prdQnano) throws Exception {
		logger.info("리뷰 상세조회");
		qnaService.qnaDetail(marketQnaVO.getPrdQnano());
		model.addAttribute("qnadetail", qnaService.qnaDetail(marketQnaVO.getPrdQnano()));
		return "/market/qnaDetail";
	}
	
	// QnA 작성
	@RequestMapping(value = "/qnaInsert", method = RequestMethod.POST)
	public String qnaInsert(MarketQnaVO marketqnaVO) throws Exception {
		logger.info("QnA 작성");
		qnaService.qnaInsert(marketqnaVO);
		return "redirect:marketDetailView?regPage=1";
	}
	
	// QnA 수정
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(MarketQnaVO marketqnaVO) throws Exception {
		logger.info("QnA 수정");
		qnaService.qnaUpdate(marketqnaVO);
		return "redirect:marketDetailView?regPage=1";
	}
	
	// QnA 삭제
	@RequestMapping(value = "/qnaDelete")
	public String qnaDelete(MarketQnaVO marketqnaVO) throws Exception {
		logger.info("QnA 삭제");
		qnaService.qnaDelete(marketqnaVO.getPrdQnano());
		return "redirect:marketDetailView?regPage=1";
	}

}
