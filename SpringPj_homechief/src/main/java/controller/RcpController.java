package controller;

import java.io.FileOutputStream;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.Category;
import model.Comments;
import model.Division;
import model.Ingredient;
import model.Likes;
import model.Nutrient;
import model.Rcp;
import model.RcpContent;
import service.MybatisRcpDao;

@Controller
@RequestMapping("/rcp/")
public class RcpController {
	
	@Autowired
	MybatisRcpDao dbPro;
	
	@ModelAttribute
	public void initProcess(Model m){
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
		
		m.addAttribute("keywords", keywords);
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String rcp_list(int cateNum, String keyword, String sorting, Model m) throws Exception {
		int rcpAllCount;
		List<Rcp> rcpAllList;
		List<Category> category;
		List<Division> division;
		
		if(sorting.equals("latest")){
			if(cateNum==0){
				if(keyword!=null){
					rcpAllCount = dbPro.searchCount(keyword);
					rcpAllList=dbPro.searchList(keyword);
					
				}else{
					rcpAllCount = dbPro.rcpAllCount();
					rcpAllList=dbPro.rcpAllList();
				}			
				category=dbPro.getCategory();
				division=dbPro.getDivision();
			}else{
				if(cateNum<100){
					rcpAllCount=dbPro.rcpAllCount2(cateNum);
					rcpAllList=dbPro.rcpAllList2(cateNum);
					category=dbPro.getCategory2(cateNum);
					division=dbPro.getDivision2(cateNum);
				}else{
					rcpAllCount=dbPro.rcpAllCount3(cateNum);
					rcpAllList=dbPro.rcpAllList3(cateNum);
					category=dbPro.getCategory3(cateNum);
					division=dbPro.getDivision3(cateNum);					
				}				
			}
		}else{
			if(cateNum==0){
				if(keyword!=null){
					rcpAllCount = dbPro.searchCount(keyword);
					rcpAllList=dbPro.searchList(keyword);					
				}else{
					rcpAllCount = dbPro.rcpAllCount();
					rcpAllList=dbPro.readCountList();
				}			
				category=dbPro.getCategory();
				division=dbPro.getDivision();
			}else{
				if(cateNum<100){
					rcpAllCount=dbPro.rcpAllCount2(cateNum);
					rcpAllList=dbPro.readCountList2(cateNum);
					category=dbPro.getCategory2(cateNum);
					division=dbPro.getDivision2(cateNum);
				}else{
					rcpAllCount=dbPro.rcpAllCount3(cateNum);
					rcpAllList=dbPro.readCountList3(cateNum);
					category=dbPro.getCategory3(cateNum);
					division=dbPro.getDivision3(cateNum);					
				}				
			}
		}				
		
		m.addAttribute("rcpAllCount", rcpAllCount);
		m.addAttribute("rcpAllList", rcpAllList);
		m.addAttribute("category", category);
		m.addAttribute("division", division);
		m.addAttribute("keyword", keyword);
		m.addAttribute("cateNum", cateNum);

		return "rcp/list";
	}
	
	@RequestMapping(value = "content", method = RequestMethod.GET)
	public String rcp_content(HttpServletRequest request, int rcpnum, Model m) throws Exception {
		HttpSession session = request.getSession();
		
		int loginNum = 0;

		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
			loginNum = (int) session.getAttribute("memNum");
		} else {
			loginNum = (int) session.getAttribute("memNum");
		}
		
		Rcp rcpContent=dbPro.rcpContent(rcpnum);
		List<RcpContent> rcpContent2=dbPro.rcpContent2(rcpnum);
		List<Ingredient> rcpContent3=dbPro.rcpContent3(rcpnum);
		List<Nutrient> nutrient=dbPro.rcpNutrient(rcpnum);
		List<Comments> commentList = dbPro.readComment(rcpnum);
		
		int checkScrap = dbPro.checkScrap(loginNum, rcpnum);
		int scrapCount = dbPro.scrapCount(rcpnum);
		int checkLike = dbPro.checkLike(loginNum, rcpnum);
		
		String[] tags = null;
		tags=rcpContent.getHashtag().split("/");
		
		m.addAttribute("rcpContent", rcpContent);
		m.addAttribute("rcpContent2", rcpContent2);
		m.addAttribute("rcpContent3", rcpContent3);
		m.addAttribute("checkScrap", checkScrap);
		m.addAttribute("scrapCount", scrapCount);
		m.addAttribute("loginNum", loginNum);
		m.addAttribute("nutrient", nutrient);
		m.addAttribute("checkLike", checkLike);
		m.addAttribute("tags", tags);
		m.addAttribute("commentList", commentList);
		
		return "rcp/content";
	}

	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String rcp_writeForm(Model m) throws Exception {
		List<Category> category = null;
		
		category = dbPro.getCategory();
		
		List<Nutrient> nutrientList =dbPro.getNutrient();
	
		HashSet<String> nutrients = new HashSet<String>();
		
		for(int i=0;i<nutrientList.size();i++){
			Nutrient nutrient=nutrientList.get(i);
			nutrients.add(nutrient.getFood());
		}
		
		m.addAttribute("nutrients", nutrients);		
		m.addAttribute("category", category);
		
		return "rcp/writeForm";
	}

	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String rcp_writePro(MultipartHttpServletRequest multipart,Rcp rcp, RcpContent rcpContent,
							String[] cateNum, String[] hashtags) throws Exception {
		HttpSession session = multipart.getSession();	
	    int memNum=(int) session.getAttribute("memNum");
	    rcp.setMemnum(memNum);	   
	   
	    MultipartFile multi=multipart.getFile("thumbNail");		
	    String filename=multi.getOriginalFilename();
	    if(filename!=null && !filename.equals("")){
		   String uploadPath=multipart.getRealPath("/")+"/uploadRcpFile";			
		   FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
		   rcp.setThumbnail(filename);
	    }else{
		   rcp.setThumbnail("");	
	    }
	    
	    Ingredient ingre=new Ingredient();
	    int x = 1;
		while (multipart.getParameter("ingredient" + x) != null) {
			x++;
		}
		for(int i=1;i<x;i++){
			ingre.setIngredient(multipart.getParameter("ingredient" + i));
			ingre.setQuantity(multipart.getParameter("quantity" + i)+"/"+multipart.getParameter("gram"+i));
			dbPro.insertIngredient(ingre);
		}
		
		int y = 1;
		while (multipart.getParameter("step" + y) != null) {
			y++;
		}
		for(int i=1;i<y;i++){
			rcpContent.setStep(Integer.parseInt(multipart.getParameter("step"+i)));
			
			MultipartFile multi2=multipart.getFile("rcpFile"+i);		
		    String filename2=multi2.getOriginalFilename();
		    if(filename2!=null && !filename2.equals("")){
			   String uploadPath=multipart.getRealPath("/")+"/uploadRcpContentFile";			
			   FileCopyUtils.copy(multi2.getInputStream(), new FileOutputStream(uploadPath+"/"+multi2.getOriginalFilename()));
			   rcpContent.setFileName(filename2);
		    }else{
			   rcpContent.setFileName("");	
		    }
		    
			rcpContent.setContent(multipart.getParameter("content" + i));
			dbPro.insertRcpContent(rcpContent);
		}
		
		String categories = "";
	
		for(int i=0;i<cateNum.length;i++){			
			categories+="/"+cateNum[i];
		}
		
		String hashtag = "";
		
		for(int i=0;i<hashtags.length;i++){			
			hashtag+="/"+hashtags[i];
		}
		
		rcp.setCategory(categories);
		rcp.setHashtag(hashtag);
		
	    dbPro.insertRcp(rcp);
		
	    return "redirect:/member/mypage?memNum="+memNum;	   
	}

	@RequestMapping(value = "addLike", method = RequestMethod.POST)
	public String rcp_addLike(HttpServletRequest request, int rcpnum) throws Exception {
		HttpSession session = request.getSession();

		Likes likes = new Likes();
		int loginNum = 0;

		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
			loginNum = (int) session.getAttribute("memNum");
		} else {
			loginNum = (int) session.getAttribute("memNum");
		}
		
		likes.setMemnum(loginNum); // 나
		likes.setMypick(rcpnum); // 내가 고른 글

		dbPro.addLike(likes);
		System.out.println("좋아요를 눌렀습니다");

		return "redirect:/rcp/content?rcpnum=" + rcpnum;
	}

	@RequestMapping(value = "cancelLike", method = RequestMethod.POST)
	public String rcp_delLike(HttpServletRequest request, int rcpnum) throws Exception {
		HttpSession session = request.getSession();

		Likes likes = new Likes();
		int loginNum = 0;

		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
			loginNum = (int) session.getAttribute("memNum");
		} else {
			loginNum = (int) session.getAttribute("memNum");
		}
		
		likes.setMemnum(loginNum);
		likes.setMypick(rcpnum);

		dbPro.cancelLike(likes);
		System.out.println("좋아요 취소");

		return "redirect:/rcp/content?rcpnum=" + rcpnum;
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value = "recommend", method = RequestMethod.POST)
	public String rcp_recommend(String[] foods, Model m) throws Exception {		
		if(foods==null){
			foods=new String[]{""};
		}
		
		List<Division> division=dbPro.getDivision();
		List<Nutrient> recNutrients =dbPro.recNutrient(foods);
		List<Rcp> recommendList=dbPro.recommend(foods);
		int recommendCount = dbPro.recommendCount(foods);
		
		m.addAttribute("recommendList", recommendList);
		m.addAttribute("recommendCount", recommendCount);
		m.addAttribute("division", division);
		m.addAttribute("recNutrients", recNutrients);
		
		return "rcp/recommendList";
	}
	
	@RequestMapping(value = "insertComment", method = RequestMethod.POST)
	public String rcp_insertComment(HttpServletRequest request, int rcpnum, String comment) throws Exception {
		HttpSession session = request.getSession();
		
		Comments comments = new Comments();
		int loginNum = 0;

		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
			loginNum = (int) session.getAttribute("memNum");
		} else {
			loginNum = (int) session.getAttribute("memNum");
		}
		
		comments.setRcpnum(rcpnum);
		comments.setMemnum(loginNum);
		comments.setContent(comment);
		
		dbPro.insertComment(comments);

		return "redirect:/rcp/content?rcpnum=" + rcpnum;

	}
	
	@RequestMapping(value = "deleteComment", method = RequestMethod.POST)
	public String rcp_deleteComment(HttpServletRequest request, int rcpnum, int commentnum) throws Exception {
		HttpSession session = request.getSession();
		
		Comments comments = new Comments();
		int loginNum = 0;

		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
			loginNum = (int) session.getAttribute("memNum");
		} else {
			loginNum = (int) session.getAttribute("memNum");
		}
		
		dbPro.deleteComment(commentnum);
		
		return "redirect:/rcp/content?rcpnum=" + rcpnum;

	}
	
	
	
}
