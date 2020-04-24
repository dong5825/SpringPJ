package controller;

import java.sql.Connection;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import exception.DuplicateldException;
import model.Brand;
import model.Follow;
import model.Member;
import model.Nutrient;
import model.Page;
import model.Rcp;
import model.Sale;
import model.Salecategory;
import service.BrandRepository;
import service.MybatisRcpDao;
import service.ShoppingRepository;
import util.JdbcUtil;

@Controller
public class IndexController {
	@Autowired
	BrandRepository service;
	@Autowired
	ShoppingRepository shopService;
	
	@Autowired
	MybatisRcpDao dbPro;
	
	@ModelAttribute
	public void initProcess(HttpSession session, Model model) {
		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
		}

		int cartcount = 0;
		// index
		cartcount = shopService.getCountCart((int) session.getAttribute("memNum"));
		System.out.println(cartcount);

		session.setAttribute("cartcount", cartcount);
		System.out.println("====================");
		
		List<Rcp> rcpList =dbPro.rcpAllList();
		
		HashSet<String> keywords = new HashSet<String>();
		
		for(int i=0;i<rcpList.size();i++){			
			Rcp rcp=rcpList.get(i);
			keywords.add(rcp.getFoodname());
			
			String[] tags = null;			
			tags = rcp.getHashtag().split("/");
			for (int j = 1; j < tags.length; j++) {
				keywords.add(tags[j]);
			}
		}
		
		model.addAttribute("keywords", keywords);

	}
	
	@RequestMapping(value="/main")
	public String index(Model m){
		List<Nutrient> nutrients =dbPro.getNutrient();
		int memberCnt=dbPro.memberCnt();
		int rcpCnt=dbPro.rcpAllCount();
		int rcpReadCnt=dbPro.rcpReadCnt();
		List<Rcp> top4=dbPro.top4();
		List<Sale> sale = shopService.getSale_desc();		

		m.addAttribute("nutrients", nutrients);	
		m.addAttribute("memberCnt", memberCnt);	
		m.addAttribute("rcpCnt", rcpCnt);	
		m.addAttribute("rcpReadCnt", rcpReadCnt);
		m.addAttribute("top4", top4);
		m.addAttribute("sales", sale);
		
		return "main";
	}
	@RequestMapping(value="/shop")
	public String shop(HttpSession session, @RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum, @RequestParam(value="category", required=false, defaultValue="0")int category,
			Model model){
		List<Salecategory> cate = shopService.getSaleCategory();
		
		Page page = new Page();
		
		page.setPageSize(3);
		
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("category", category);
		
		System.out.println("session : "+session.getAttribute("pageNum"));
		int sess_page = (int)session.getAttribute("pageNum");
		int cateNum = (int)session.getAttribute("category");
		
		page.setCurrentPage(sess_page);
		System.out.println("Current : "+page.getCurrentPage());
		if(cateNum == 0){
			page.setCount(shopService.getCountSale()); 
	   	}else{
	   		page.setCount(shopService.getCountSale_cate(category));
	   	}
		System.out.println(page.getCount());
		
		page.setPageCount(page.getCount() / page.getPageSize() + ( page.getCount()%page.getPageSize()==0 ? 0 : 1) );
		
		if (page.getCurrentPage() > page.getPageCount()) { 
			page.setCurrentPage(page.getPageCount());
			session.setAttribute("pageNum", page.getCurrentPage()); 
		}
		page.setStartRow(( page.getCurrentPage()-1 ) * page.getPageSize() + 1 );
		page.setEndRow(page.getStartRow() + page.getPageSize() - 1);
		
		page.setNumber(page.getCount() - (page.getCurrentPage() - 1) * page.getPageSize());

	   	page.setBottomLine(3); 
	   	page.setStartPage( 1 + (page.getCurrentPage() - 1) / page.getBottomLine() * page.getBottomLine());
	   	page.setEndPage(page.getStartPage()+page.getBottomLine() - 1);
   	
	   	if (page.getEndPage() > page.getPageCount())
	   		page.setEndPage(page.getPageCount());
		
	   	List<Sale> sales = null;
	   	if(cateNum == 0){
			sales = shopService.getSale(page.getStartRow(), page.getEndRow());
	   	}else{
	   		sales = shopService.getSale_cate(page.getStartRow(), page.getEndRow(), cateNum);
	   	}
	   	
		System.out.println(page);
		System.out.println(sales);
		
		model.addAttribute("page", page);
		model.addAttribute("cate", cate);
		model.addAttribute("sales", sales);
		return "/shopping/shop";
	}
	@RequestMapping(value="/brand")
	public String brand(){
		return "/brand/brand";
	}

	@RequestMapping(value = "/brand", method = RequestMethod.POST)
	public String addbrand(Brand newbrand, Model m,
			@RequestParam(value = "inquiry", required = false, defaultValue = "선택안함") String[] inquiry) {

		String categories = "";
		/*
		 * if(inquiry==null){ String[] inquiry=""; }
		 */
		for (int i = 0; i < inquiry.length; i++) {
			categories += "/" + inquiry[i];
		}
		newbrand.setInquiry(categories);

		Connection conn = null;
		int result = 0;
		try {
			String brand = service.selectById(newbrand.getId());
			if (brand != null) {
				result = 1;
				JdbcUtil.rollback(conn);
				throw new DuplicateldException();

			}

			service.insertBrand(newbrand);
			System.out.println(result);

		} catch (DuplicateldException e) {
			System.out.println(result);
			return "/brand/brand";
		}

		return "/brand/brandSuccess";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public @ResponseBody String AjaxView(@RequestParam("id") String id) {
		String str = "";
		String idcheck = service.selectById(id);
		if (idcheck != null) { // 이미 존재하는 계정
			str = "NO";
		} else { // 사용 가능한 계정
			str = "YES";
		}
		return str;
	}

	@RequestMapping(value = "/brandInfo") // 맨끝단의 url만 가지고 옴, get방식으로 한다.
	public String brandview(HttpSession session, String id, Model m) {
		int loginNum = 0;

		if (session.getAttribute("id") == null) {
			session.setAttribute("id", 0);
			loginNum = (int) session.getAttribute("id");
		} else {
			loginNum = (int) session.getAttribute("id");
		}
		Brand brand = service.getBrand(id);

		return "/brand/brandSuccess";
	}

	
	@RequestMapping("/navermailtest")
		public String navermailtest(HttpServletRequest request,HttpServletResponse response, ModelMap mo) throws Exception{ 
		String email= request.getParameter("email");
		System.out.println(email);
		String dd="yooneirang@gmail.com";
		
		// 메일 관련 정보 
		String host = "smtp.naver.com"; 
		final String username = "dbsdlfkdbnm"; //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
		final String password = "dudalsdlfkd8693"; //네이버 이메일 비밀번호를 기재합니다.
		int port=465; // 메일 내용
		String recipient = email; //메일을 발송할 이메일 주소를 기재해 줍니다. 
		String subject = "안녕하세요 홈쉐프입니다."; 
		String body = "안녕하세요 홈쉐프입니다. 제휴문의 주셔서 감사드립니다.";
		Properties props = System.getProperties(); props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(un, pw); 
				} 
			}); 
		session.setDebug(true); //for debug 
		Message mimeMessage = new MimeMessage(session ); 
	
		mimeMessage.setFrom(new InternetAddress("dbsdlfkdbnm@naver.com")); 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
		mimeMessage.setSubject(subject); 
		mimeMessage.setText(body); 
		//mimeMessage.setText(contents);
		

		Transport.send(mimeMessage); 
		 String url="";
		 if(email != null){ 
	            url ="redirect:/main";
	        
	        }
	         
	        return url;



		
	}
	@RequestMapping(value = "/chef")
	public String cheflist(HttpServletRequest request, String keyword, Model model) {		
		List<Member> memList=service.memList();
		List<Member> memSearch = service.memSearch(keyword);		
		  		
		model.addAttribute("memList", memList);
		model.addAttribute("memSearch", memSearch);
		model.addAttribute("keyword", keyword);
		
		return "/chef/cheflist";
	}
	
}
