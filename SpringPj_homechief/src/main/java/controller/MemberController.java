package controller;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import exception.DuplicateldException;
import exception.LoginFailException;
import model.Follow;
import model.Ingredient;
import model.Member;
import model.Rcp;
import model.Scrap;
import model.User;
import service.MybatisMemberDao;
import service.MybatisRcpDao;
import util.JdbcUtil;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	MybatisMemberDao dbPro;
	@Autowired
	MybatisRcpDao dbPro2;

	@ModelAttribute
	public void initProcess(Model m){
		List<Rcp> rcpList =dbPro2.rcpAllList();
		
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
    
    @RequestMapping(value = "join", method = RequestMethod.GET)
    public String member_joinForm() throws Exception
    {
        return "member/joinForm";
    }
    
    @RequestMapping(value = "join", method = RequestMethod.POST)
    public String member_joinPro(Member newMember, Model m) throws Exception
    {  
       System.out.println(newMember);
       
       newMember.setProfile("profile.png");
        Map<String, Boolean> errors = new HashMap<>();
         m.addAttribute("errors", errors);
         
         newMember.vaildate(errors);
         
         if (!errors.isEmpty()) return "member/joinForm";
         Connection conn = null;
         try
         {            
            Member member = dbPro.selectById(newMember.getEmail());
        if (member != null)
        {
            JdbcUtil.rollback(conn);
            throw new DuplicateldException();
        }
        dbPro.insert(newMember);
        
      
         }catch (DuplicateldException e)
         {
             errors.put("duplicateId", Boolean.TRUE);
             return "member/joinForm";
         }
            return "member/loginForm";
            
        }
      
    @RequestMapping(value = "login")
    public String member_loginForm() throws Exception
    {
        return "member/loginForm";
    }
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String member_loginPro(HttpServletRequest req,String email,String passwd) throws Exception
    {
       HttpSession session = req.getSession();
 
        Member member=null;
        
        Map<String, Boolean> errors = new HashMap<>();
        req.setAttribute("errors", errors);
        
        if (email == null || email.isEmpty()) errors.put("email", Boolean.TRUE);
        if (passwd == null || passwd.isEmpty())
            errors.put("passwd", Boolean.TRUE);
        
        if (!errors.isEmpty()) 
            return "member/loginForm";
        
        try
        {           
            member = dbPro.selectById(email);
            if (member == null) throw new LoginFailException();
            if (!member.matchPassword(passwd)) throw new LoginFailException();
            
            User user = new User(member.getEmail(), member.getName());
            req.getSession().setAttribute("authUser", user);
            
        }
        catch (LoginFailException e)
        {
            errors.put("idOrPwNotMatch", Boolean.TRUE);
            return "member/loginForm";
        }
        
        session.setAttribute("memNum", member.getMemNum());
        req.setAttribute("memNum", session.getAttribute("memNum"));
        
        return "redirect:/main";
    }
    
    private String trim(String str)
    {
        return str == null ? null : str.trim();
    }
    
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String member_logout(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        HttpSession session = req.getSession(false);
        if (session != null)
        {
            session.invalidate();
        }
        return "redirect:/main";
    }

	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpServletRequest request, int memNum, Model m) throws Exception {
		HttpSession session = request.getSession();
		
		int loginNum = 0;

		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
			loginNum = (int) session.getAttribute("memNum");
		} else {
			loginNum = (int) session.getAttribute("memNum");
		}

		Member member = dbPro.getMember(memNum);
		int checkFollow = dbPro.checkFollow(loginNum, memNum);
		int followCount = dbPro.followCount(memNum);
		int followerCount = dbPro.followerCount(memNum);
		List<Follow> followerCount2 = dbPro.followerCount2(memNum);
		List<Member> followList = dbPro.followList(memNum);		
		int rcpCount = dbPro.rcpCount(memNum);
		List<Rcp> rcpList=dbPro.rcpList(memNum);
		int scrapCount=dbPro.scrapCount(memNum);
		List<Rcp> scarpList=dbPro.scarpList(memNum);
		List<Rcp> followRcpCount=dbPro.followRcpCount(memNum);
		List<Rcp> followRcp=dbPro.followRcp(memNum);

		m.addAttribute("loginNum", loginNum);

		m.addAttribute("member", member);
		m.addAttribute("checkFollow", checkFollow);
		m.addAttribute("followCount", followCount);
		m.addAttribute("followerCount", followerCount);
		m.addAttribute("followList", followList);
		m.addAttribute("rcpCount", rcpCount);
		m.addAttribute("rcpList", rcpList);
		m.addAttribute("scrapCount", scrapCount);
		m.addAttribute("scarpList", scarpList);
		m.addAttribute("followerCount2", followerCount2);
		m.addAttribute("followRcpCount", followRcpCount);
		m.addAttribute("followRcp", followRcp);
		
		return "mypage/mypage";
	}

	@RequestMapping(value = "modifyForm", method = RequestMethod.GET)
	public String modifyForm(int memNum, Model m) throws Exception {
		Member member = dbPro.getMember(memNum);
		m.addAttribute("member", member);

		return "member/modifyForm";
	}
	
	@RequestMapping(value = "modifyPro", method = RequestMethod.POST)
	public String modifyPro(MultipartHttpServletRequest multipart, Member member, Model m) throws Exception {
		MultipartFile multi=multipart.getFile("uploadfile");
		
		String filename=multi.getOriginalFilename();
		if(filename!=null && !filename.equals("")){
			String uploadPath=multipart.getRealPath("/")+"/uploadFile";			
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"/"+member.getMemNum()+multi.getOriginalFilename()));
			member.setProfile(member.getMemNum()+filename);;
		}else{
			member.setProfile(member.getProfile());			
		}
		int check = dbPro.updateMember(member);
		m.addAttribute("check", check);
		
		return "member/modifyPro";
	}
	 

	@RequestMapping(value = "follow", method = RequestMethod.GET)
	public String follow(HttpServletRequest request, int memNum, Model m) throws Exception {
		HttpSession session = request.getSession();
		int loginNum = (int) session.getAttribute("memNum");

		Follow follow = new Follow();
		follow.setMemNum(loginNum);
		follow.setFollowNum(memNum);

		int check = dbPro.insertFollow(follow);
		m.addAttribute("check", check);
		m.addAttribute("memNum", memNum);

		return "mypage/follow";
	}

	@RequestMapping(value = "unFollow", method = RequestMethod.GET)
	public String unFollow(HttpServletRequest request, int memNum, Model m) throws Exception {
		HttpSession session = request.getSession();
		int loginNum = (int) session.getAttribute("memNum");

		Follow follow = new Follow();
		follow.setMemNum(loginNum);
		follow.setFollowNum(memNum);

		dbPro.unFollow(follow);
		m.addAttribute("memNum", memNum);

		return "mypage/unFollow";
	}
	
	@RequestMapping(value = "scrap", method = RequestMethod.POST)
	public String scrap(HttpServletRequest request, int scrapnum, Model m) throws Exception {
		HttpSession session = request.getSession();
		
		int loginNum = 0;

		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
			loginNum = (int) session.getAttribute("memNum");
		} else {
			loginNum = (int) session.getAttribute("memNum");
		}
		
		Scrap scrap=new Scrap();
		scrap.setMemnum(loginNum);
		scrap.setScrapnum(scrapnum);
		int check = dbPro.insertScrap(scrap);
		
		m.addAttribute("check", check);
		m.addAttribute("rcpnum", scrap.getScrapnum());

		return "mypage/scrap";
	}
	
	@RequestMapping(value = "delScrap", method = RequestMethod.POST)
	public String delScrap(HttpServletRequest request, int scrapnum, Model m) throws Exception {
		HttpSession session = request.getSession();
		int loginNum = (int) session.getAttribute("memNum");

		Scrap scrap=new Scrap();
		scrap.setMemnum(loginNum);
		scrap.setScrapnum(scrapnum);
		dbPro.delScrap(scrap);

		return "redirect:/rcp/content?rcpnum="+scrapnum;
	}
	// 아이디이메일 중복 체크
		@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
		public @ResponseBody String AjaxView(@RequestParam("email") String email) {
			String str = "";
			String emailCheck = dbPro.selectByIdChk(email);
			if (emailCheck != null) { // 이미 존재하는 계정
				str = "NO";
			} else { // 사용 가능한 계정
				str = "YES";
			}
			return str;
		}
	
	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
	//@ResponseBody
	public String findPwd( String email,   String inputCode, HttpSession session,Model m) throws Exception {
	    String keyCode = (String) session.getAttribute("keyCode");
/*        
	    if (!inputCode.equals(keyCode)) {
	        return "discordance";
	    }
	        */
	   // session.removeAttribute("keyCode");
	        
	    String newPwd = FindUtil.getNewPwd();
	    dbPro.changePwd(newPwd, email);
	    
	    m.addAttribute("newPwd", newPwd);

	    session.getAttribute("newPwd");
	    
	    String subject = "[MIN-HA!] 임시 비밀번호 발급 안내";
	        
	    String msg = "";
	    msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
	    msg += "<h3 style='color: blue;'><strong>" + email;
	    msg += "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
	    msg += "<p>임시 비밀번호 : <strong>" + newPwd + "</strong></p></div>";
	        
	    MailUtil.sendMail(email, subject, msg);
	    m.addAttribute("mssg", "이메일전송 되었습니다.");
	    return "/member/loginForm";
	}
	
}