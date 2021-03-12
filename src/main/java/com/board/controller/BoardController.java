package com.board.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.service.BoardService;

/*Get-Post
 * Get: 속도^ 캐시 O 서버에 데이터를 가져와 보여줄때(select) 서버 → 사용자로 데이터가 이동하는것
 * Post: 캐시X 파라미터 노출X 서버의 값,상태를바꿀때(insert,update,delete) 사용자 → 서버로 데이터가 이동
 * GET/POST 둘다 하게하고싶으면 메소드 삭제
*/
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	//@Autowired
	
	@Inject
	BoardService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		//뭐하는 라인인지 적기
		List<BoardVO> list = null;

		list = service.list();

		model.addAttribute("list", list);
		

	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView getview(@RequestParam("bno") int bno, Model model) throws Exception {

		BoardVO view = service.view(bno);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("view", view);
		return mav;
	}
	
	
	
	

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	//public void modify(@RequestParam("bno") int bno, Model model) throws Exception {
	public ModelAndView modify(@RequestParam("bno") int bno) throws Exception {

		BoardVO vo = service.view(bno);

		//model.addAttribute("view", vo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("view", vo);
		return mav;
	}


	@RequestMapping(value = "/modify", method = RequestMethod.POST) // {RequestMethod.POST,RequestMethod.GET}
	public String postmodify(BoardVO vo) throws Exception {
		service.modify(vo);
		
		return "redirect:/board/listPage?num=1"; // redirect:/ 를 사용하면 URL을 다시 요청하는것

	}
	
	
	
	
	

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("bno") int bno) throws Exception {
		service.delete(bno);
		return "redirect:/board/listPage?num=1";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getwrite() throws Exception {
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO vo,HttpServletResponse response) throws Exception {
		String page ="";
		/*System.out.println("---------------");
		System.out.println(vo.getTitle());
		System.out.println("---------------");*/
		//빈칸이 있으면 게시하지못하도록 조건
		if(vo.getTitle().equals("")||vo.getWriter().equals("")||vo.getContent().equals("")) {
			page = "/board/write";
			System.out.println("공백"); 
			//utf-8로 한글 인코딩
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();//출력스트림
			out.println("<script>alert('공백이 있어서 게시되지 않았습니다.'); location.href='"+"/"+"';</script>"); 
			out.flush();

		}
		//빈칸이 없으면 실행
		else {
			page = "redirect:/board/listPage?num=1"; 
			service.write(vo);
			
		}
		return page;
		//밑에껄로 하니까 sendRedirect 오류가 발생해서 위에서 page를 지정해서 return
		//return "redirect:/board/listPage?num=1";

		
	}
	@RequestMapping("/pdf")
    //public ModelAndView list() throws Exception{
	public String list() throws Exception{
        //pdf 파일 생성
        String result = service.createPdf();
        
        //return new ModelAndView("pdf/result", "message", result);
        return "redirect:/";
	}
	
	@RequestMapping(value= "/listPage", method = RequestMethod.GET)
	public void getlistPage(Model model, @RequestParam("num")int num) throws Exception{
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count());  

		List list = null; 
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   

		model.addAttribute("page",page);
		model.addAttribute("select", num);
	}
		/*	//게시물 총 갯수
		int count= service.count();
		
		// 몇개 보여줄것인지
		int postNum = 10;
		
		//하단 페이지번호 올림해서 보여줌 Ex) 1.04 -> 2
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		//출력할 게시물	 num은 페이지번호
		int displayPost = (num-1) *postNum;
		//한번에 보여줄 페이지 갯수
		int TotalpageNum = 5;
		
		int endPage =(int)(Math.ceil((double)num/(double)TotalpageNum)*TotalpageNum);
		
		int startPage = endPage - (TotalpageNum -1);
		
		//Ex) 111개일때 page 12번까지 있어야해서
		int endPageT = (int)(Math.ceil((double)count/(double)TotalpageNum));
		
		
		if(endPage>endPageT) {
			endPage=endPageT;
		}
		
		//startPage 1 이면 -> prev = false 아니면 true
		boolean prev = startPage == 1 ? false : true;
		//endpage * pagenume 이 count 랑 같거나 크면 false 아니면 true
		boolean next = endPage * pageNum >=count ? false: true;
		
		List<BoardVO> list = null;
		//BoardService의 리스트
		list = service.listPage(displayPost,postNum);
		
		//뷰에서 "list"로 list를 쓰기위해서 list를 "list"이름으로 추가
		model.addAttribute("list",list);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("now",num);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
	}*/
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void listSearch(Model model
			, @RequestParam(value="num")int num
			, @RequestParam(value ="keyword",required=false, defaultValue="") String keyword
			, @RequestParam(value="searchType",required = false,defaultValue="writer")String searchType
			)throws Exception{
		/*@RequestParam(value="searchType",required = false,defaultValue="" 
				== 
		  required: searchType의 값이 없으면 Bad Request, Required String parameter 'searchType' is not present 예외발생
		  하지만 required 속성을 추가하면 존재하지않아도 예외가 발생하지않고 defaultValue로 기본값을 지정
		  */
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.searchCount(searchType,keyword));
		page.setSearchTypeKeyword(searchType,keyword);
		List<BoardVO> list = null;
		//list =service.listPage(page.getDisplayPost(), page.getPostNum());
		list= service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("select",num);
		model.addAttribute("searchType",searchType);
		model.addAttribute("keyword",keyword);
		
		
		
	}
	
	public void plus() {
		System.out.println("ccccccccccccccccccccc");
	}
		
    

}
