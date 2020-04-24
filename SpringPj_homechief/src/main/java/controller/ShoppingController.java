package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import model.Cart;
import model.Ingredient;
import model.Jjim;
import model.MemAddress;
import model.Member;
import model.OrderInfo;
import model.OrderProduct;
import model.Rcp;
import model.Sale;
import model.Salecategory;
import service.MybatisRcpDao;
import service.ShoppingRepository;

//서블릿 그자체, 왜냐하면 서블릿을 상속받았기 때문에
@Controller
@RequestMapping("/shopping/")
public class ShoppingController {
   
   @Autowired
   ShoppingRepository service;
   
   @ModelAttribute
   public void initProcess(HttpSession session, Model model) {
      System.out.println("====================");
      //회원기능 머지 전이라 초기화
      //
      System.out.println("memNum : "+session.getAttribute("memNum"));
      
	  System.out.println("====================");
	  
	  
   }

   @RequestMapping(value = "list") // 맨끝단의 url만 가지고 옴, get방식으로 한다.
   public String reciptview(@RequestParam("saleNum")int saleNum, Model model) {
      // TODO Auto-generated method stub
      
      Sale sale = service.getSale(saleNum);
      
      System.out.println("sale : "+sale);
      
      model.addAttribute("sale", sale);

      return "shopping/goodsview";
   }
   
   private String cartNum_split(String value){
		String str = value;
		String[] array = str.split(",");
		return array[0];
	}
   
   @RequestMapping(value = "addcart", method=RequestMethod.POST) // 맨끝단의 url만 가지고 옴, get방식으로 한다.
   public String addcart(Cart cart, HttpSession session, Model m) {
      // TODO Auto-generated method stub
      
      int memNo = (int) session.getAttribute("memNum");
      cart.setMemNum(memNo);
      
      service.insertCart(cart);
      List<Cart> cartlist = service.getCart(memNo);
      System.out.println("getcart : "+cartlist);
      
      return "redirect:/shopping/cartview";
      
   }
   
   @RequestMapping(value = "addcart") // 맨끝단의 url만 가지고 옴, get방식으로 한다.
   public String addcart_get(@RequestParam("price")int price, @RequestParam("productName")String productName, @RequestParam("thumbnail")String thumbnail, HttpSession session) {
      // TODO Auto-generated method stub
	   if(session.getAttribute("memNum")==null){
	    	  return "redirect:/member/login";
	      }
	   Cart cart = new Cart(); 
      int memNo = (int) session.getAttribute("memNum");
      cart.setMemNum(memNo);
      cart.setPrice(price);
      cart.setProductName(productName);
      cart.setThumbnail(thumbnail);
      cart.setQty(1);
      service.insertCart(cart);
      return "redirect:/shopping/cartview";
      
   }
  
   @RequestMapping(value = "cartview", method=RequestMethod.GET) // 맨끝단의 url만 가지고 옴, get방식으로 한다.
   public String cartview(HttpSession session, Model m){
      // TODO Auto-generated method stub
      if(session.getAttribute("memNum")==null){
    	  return "redirect:/member/login";
      }
      int memNo = (int) session.getAttribute("memNum");
      List<Cart> cartlist = service.getCart(memNo);
      System.out.println(memNo);
      System.out.println("getcart : "+cartlist);
     
      m.addAttribute("cartlist",cartlist);
      
      return "shopping/shoppingcartForm";
   }
   
   @RequestMapping(value = "cart_delete", method=RequestMethod.POST)
   public String cart_delete(HttpServletRequest request) throws Exception {
      // TODO Auto-generated method stub
      
      String[] values = request.getParameterValues("cart");
      for(String str : values){
         
         int check = service.deleteCartvalue(Integer.parseInt(cartNum_split(str)));
         System.out.println(str+" : "+check);
      }
      
      return "redirect:/shopping/cartview";
   }
   
   @RequestMapping(value = "regist_jjim", method=RequestMethod.POST)
   public String regist_jjim(HttpSession session, @RequestParam("saleNum")int saleNum , Model m) throws Exception {
      // TODO Auto-generated method stub
	if(session.getAttribute("memNum")==null){
	    	  return "redirect:/member/login";
	   }
     int check = service.registjjim(saleNum, (int)session.getAttribute("memNum"));
     System.out.println("check " + check);
     System.out.println("dddd : "+(int)session.getAttribute("memNum"));
     if(check >= 1){
        System.out.println( saleNum+"-- 성공");
     }else{
        System.out.println( saleNum+"-- 중복");
     }
      return "redirect:/shopping/list?saleNum="+saleNum;
   }
   
   @RequestMapping(value = "regist_jjim")
   public String regist_jjim_get(HttpSession session, @RequestParam("saleNum")int saleNum , Model m) throws Exception {
      // TODO Auto-generated method stub
	if(session.getAttribute("memNum")==null){
	    	  return "redirect:/member/login";
	   }
     int check = service.registjjim(saleNum, (int)session.getAttribute("memNum"));
     if(check >= 1){
        System.out.println( saleNum+"-- 성공");
     }else{
        System.out.println( saleNum+"-- 중복");
     }
      return "redirect:/shopping/jjimlist";
   }
   
   
   @RequestMapping(value = "jjimlist")
   public String jjimlist(HttpSession session, Model m) throws Exception {
      // TODO Auto-generated method stub
	   if(session.getAttribute("memNum")==null){
	    	  return "redirect:/member/login";
	   }
	 List<Jjim> jjimlist = service.getJjimlist((int)session.getAttribute("memNum"));
	 m.addAttribute("jjimlist", jjimlist);

      return "/shopping/Wishlist";
   }
   
   @RequestMapping(value = "jjim_delete", method=RequestMethod.POST)
   public String jjim_delete(HttpServletRequest request) throws Exception {
      // TODO Auto-generated method stub
      
      String[] values = request.getParameterValues("jjim");
      for(String str : values){
         
         int check = service.deletejjimvalue(Integer.parseInt(str));
         System.out.println(str+" : "+check);
      }
      
      return "redirect:/shopping/jjimlist";
   }
   
   @RequestMapping(value = "order", method=RequestMethod.POST) // 
	public String order_form(HttpServletRequest request, Model m){
		// TODO Auto-generated method stub
		List<Cart> cartlist = new ArrayList<>();
		List<MemAddress> address = new ArrayList<>();
		Member mem = new Member();
		
		HttpSession session = request.getSession();
		
		//카트에서 선택된 항목만 가져오기
		String[] values = request.getParameterValues("cart");
		for(String str : values){
			System.out.println("str : " +str);
			cartlist.add(service.getCartByNum(Integer.parseInt(cartNum_split(str))));
		}
		int memNum = (int) session.getAttribute("memNum");
		mem = service.getMember(memNum);

		
		address = service.getAddress(memNum);
		
		System.out.println(cartlist);
		System.out.println(address);
		
		m.addAttribute("member", mem);
		m.addAttribute("cartlist", cartlist);
		m.addAttribute("reg_address", address);
		
		return "shopping/orderForm";
	}

	@RequestMapping(value = "complete", method=RequestMethod.POST)
	@ResponseBody
	public void order(@RequestBody String orderInfo) throws Exception{
		
		//serialize를 가져와 디코딩후  hashmap 저장
		List<Integer> nums = new ArrayList<>();
		String info = URLDecoder.decode(orderInfo, "UTF-8");
		HashMap<String, String> order_info = new HashMap<>();
		String address = "";
		for(String str : orderinfo_split(info)){
			String[] array = str.split("=");
			if(array.length == 1) continue;
			for(String str2 : array){
				//System.out.println("- "+ str2 );
			}
			switch(array[0]){
				case "address": address+=array[1]+" "; continue;
				case "nums": nums.add(Integer.parseInt(array[1])); continue;
			}
			order_info.put(array[0], array[1]);
		}
		order_info.put("adress", address);
		/*Set<String> keySet = order_info.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()){
			String key = keyIterator.next();
			String value = order_info.get(key);
			System.out.println(key+" : "+order_info.get(key));
		}*/
		
		
		//데이터 저장
		OrderInfo orderinfo = new OrderInfo();
		MemAddress memaddr = new MemAddress();
		int select = Integer.parseInt(order_info.get("select"));
		orderinfo.setMemo(order_info.get("memo"));
		orderinfo.setHowtopay(order_info.get("howtopay"));
		orderinfo.setMemNum(Integer.parseInt(order_info.get("memNum")));
		orderinfo.setAmount(Integer.parseInt(order_info.get("amount")));
		orderinfo.setMemName(order_info.get("memName"));
		
		if(select==0){
			System.out.println("셀렉 0");
			
			orderinfo.setAddress(address);
			orderinfo.setRecipient(order_info.get("recipient"));
			orderinfo.setZipcode(order_info.get("zipcode"));
			
			if(order_info.get("addradd")!=null && order_info.get("addradd").equals("1")){
				memaddr.setMemNum(Integer.parseInt(order_info.get("memNum")));
				memaddr.setMemName(order_info.get("memName"));
				memaddr.setAddress(address);
				memaddr.setRecipient(order_info.get("recipient"));
				memaddr.setZipcode(order_info.get("zipcode"));
				System.out.println("select0  "+memaddr);
				service.insertMemAddr(memaddr);
			}
		}else{
			// 기존 배송지 일경우, 주문완료된 카트들 삭제..
			System.out.println("셀렉 1");
			
			memaddr = service.getAddress1(Integer.parseInt(order_info.get("sel_address")));
			orderinfo.setAddress(memaddr.getAddress());
			orderinfo.setRecipient(memaddr.getRecipient());
			orderinfo.setZipcode(memaddr.getZipcode());
			orderinfo.setMemo(order_info.get("memo2"));
			System.out.println("select1  "+memaddr);

		}
		System.out.println(orderinfo);
		service.insertOrderForm(orderinfo, nums);
		
		
		System.out.println(memaddr);
		System.out.println(orderinfo);
			
		
	}
	
	private String[] orderinfo_split(String value){
		String str = value;
		String[] array = str.split("&");
		return array;
	}
	
	
	@RequestMapping(value = "complete2")
	public String orderSuccess(){
		System.out.println("complete!2");
		return "shopping/orderSuccess";

	}
	

	
	@RequestMapping(value = "orderinfo")
	   public String orderinfo(HttpSession session, Model m) throws Exception {
	      // TODO Auto-generated method stub
		 if(session.getAttribute("memNum")==null){
		    	  return "redirect:/member/login";
		 }
		 List<OrderProduct> productlist = new ArrayList<>();
		 List<OrderInfo> orderlist = service.getorderinfolist((int)session.getAttribute("memNum"));
		 for(OrderInfo order : orderlist){
			 List<OrderProduct> product = service.getorderproductlist(order.getOrderNum());
			 System.out.println(product);
			 for(OrderProduct product1 : product){
				 productlist.add(product1);
			 }
		 }
		 System.out.println("p_list : "+productlist);
		 
		 m.addAttribute("orderlist", orderlist);
		 m.addAttribute("productlist", productlist);

	      return "/shopping/orderinfo";
	   }
}