package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
import mybatis.AbstractRepository;

@Component
public class ShoppingRepository{
	private final String namespace = "mybatis.dao.ShoppingMapper";
	private static ShoppingRepository instance = new ShoppingRepository();
	
	@Autowired
	public AbstractRepository opendb;
	
	
	public int insertCart(Cart cart){
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		int cartnum = 0;
		try{
			cartnum = sqlSession.selectOne(namespace+".insert_maxCart");
			cart.setCartNum(cartnum);
			System.out.println(cart);
			String statement = namespace + ".insertCart";
			int result = sqlSession.insert(statement, cart);
			if(result > 0){
				sqlSession.commit();
				System.out.println("commit");
			}else{
				sqlSession.rollback();
				System.out.println("rollback");
			}
			return result;
		}finally{
			sqlSession.close();
		}
	}
	
	public List<Cart> getCart(int memNum) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getCart";
			return sqlSession.selectList(statement, memNum);
		}finally{
			sqlSession.close();
		}
	}
	
	public int deleteCartvalue(int cartNum) throws Exception{
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			
			String statement = namespace + ".deleteCartvalue";
			sqlSession.delete(statement, cartNum);
			System.out.println("repository : "+cartNum);
			sqlSession.commit();
			return 1;
		}finally{
			sqlSession.close();
		}
		
	}
	public List<Jjim> getJjimlist(int memNum) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getJjimlist";
			return sqlSession.selectList(statement, memNum);
		}finally{
			sqlSession.close();
		}
	}
	public int registjjim(int saleNum, int memNum){
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Sale sale = new Sale(); 
		Jjim jjim = new Jjim();
		int jnum = 0;
		int cknum = 0;
		int result = 0;
		try{
			sale = sqlSession.selectOne(namespace+".getSaleintoJjim", saleNum);
			System.out.println("dao_sale : " + sale.toString());
			
			Map map = new HashMap();
			map.put("memNum", memNum);
			map.put("productName", sale.getProductname());
			System.out.println("map : "+map);
			cknum = sqlSession.selectOne(namespace+".checkjjim", map);
			System.out.println("cknum : "+cknum);
			if(cknum>0){
				System.out.println(cknum);
				return 0; 
			}else{
				jnum = sqlSession.selectOne(namespace+".insert_maxJjim");
				
				jjim.setJjimNum(jnum);
				jjim.setMemNum(memNum);
				jjim.setThumbnail(sale.getThumbnail());
				jjim.setPrice(sale.getPrice());
				jjim.setProductName(sale.getProductname());
				System.out.println("dao_j : " + jjim.toString());
				String statement = namespace + ".insertjjim";
				result = sqlSession.insert(statement, jjim);
				if(result > 0){
					sqlSession.commit();
					System.out.println("commit");
				}else{
					sqlSession.rollback();
					System.out.println("rollback");
				}	
				return 1;
			}

		}finally{
			sqlSession.close();
		}
	}
	
	public int deletejjimvalue(int jjimNum) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			
			String statement = namespace + ".deleteJjimvalue";
			sqlSession.delete(statement, jjimNum);
			System.out.println("repository : "+jjimNum);
			sqlSession.commit();
			return 1;
		}finally{
			sqlSession.close();
		}
	}

	
	public Cart getCartByNum(int cartNum){
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Cart cart = new Cart(); 
		try{
			cart = sqlSession.selectOne(namespace+".getCartintoJjim", cartNum);
			//System.out.println("dao_c : " + cart.toString());
			return cart;
		}finally{
			sqlSession.close();
		}
	}
	
	public List<Sale> getSale(int startRow, int endRow) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		System.out.println(startRow+" : "+endRow);
		System.out.println("1 = "+startRow+" : "+endRow);
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		try{
			String statement = namespace + ".getSale_nonParam";
			return sqlSession.selectList(statement, map);
		}finally{
			sqlSession.close();
		}
	}
	
	public List<Sale> getSale_cate(int startRow, int endRow, int category) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		System.out.println(startRow+" : "+endRow);
		System.out.println("1 = "+startRow+" : "+endRow);
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("category", category);
		try{
			String statement = namespace + ".getSale_nonParam_Cate";
			return sqlSession.selectList(statement, map);
		}finally{
			sqlSession.close();
		}
	}
	
	public Sale getSale(int rcpNum) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getSale";
			return (Sale)sqlSession.selectOne(statement, rcpNum);
		}finally{
			sqlSession.close();
		}
	}
	
	public List<Salecategory> getSaleCategory() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		String SIDX = "asc";
		try{
			String statement = namespace + ".getSalecategory";
			return sqlSession.selectList(statement,SIDX);
		}finally{
			sqlSession.close();
		}
	}
	
	
	public Member getMember(int memNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		Member member=null;
		
		try{
			String statement=namespace+".getMember";         
			member=sqlSession.selectOne(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return member;
	}
	
	public List<MemAddress> getAddress(int memNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		
		try{
			String statement=namespace+".getAddress";         
			return sqlSession.selectList(statement, memNum);
		}finally{
			sqlSession.close();
		}
	}
	public MemAddress getAddress1(int addressNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		
		try{
			String statement=namespace+".getAddress1";         
			return sqlSession.selectOne(statement, addressNum);
		}finally{
			sqlSession.close();
		}
	}

	public void insertMemAddr(MemAddress memaddr) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		int addrnum = 0;
		try{
			addrnum = sqlSession.selectOne(namespace+".insert_maxMA");
			memaddr.setAddressNum(addrnum);
			System.out.println(memaddr);
			String statement = namespace + ".insertMemaddr";
			int result = sqlSession.insert(statement, memaddr);
			if(result > 0){
				sqlSession.commit();
				System.out.println("commit");
			}else{
				sqlSession.rollback();
				System.out.println("rollback");
			}
		}finally{
			sqlSession.close();
		}
	}
	
	public void insertOrderForm(OrderInfo orderinfo, List<Integer> nums) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Cart cart = new Cart(); 
		OrderProduct ordpro = new OrderProduct();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strDate = sdf.format(new Date());
		Long ordernum = Long.parseLong((String)strDate+orderinfo.getMemNum());
		orderinfo.setOrderNum(ordernum);
		ordpro.setOrderNum(ordernum);
		
		int ordpronum = 0;
		try{
			String statement = namespace + ".insertOrderInfo";
			int result = sqlSession.insert(statement, orderinfo);
			if(result > 0){
				sqlSession.commit();
				System.out.println("commit_orderinfo");
			}else{
				sqlSession.rollback();
				System.out.println("rollback_orderinfo");
			}
			
			for(int i : nums){
				cart = getCartByNum(i);
				ordpro.setThumbnail(cart.getThumbnail());
				ordpro.setProductName(cart.getProductName());
				ordpro.setQty(cart.getQty());
				ordpro.setPrice(cart.getQty()*cart.getPrice());
				ordpronum = sqlSession.selectOne(namespace+".insert_maxOP");
				ordpro.setProductNum(ordpronum);
				System.out.println(ordpro);
				statement = namespace + ".insertOrderProduct";
				result = sqlSession.insert(statement, ordpro);
				if(result > 0){
					sqlSession.commit();
					System.out.println("commit_ordpro");
				}else{
					sqlSession.rollback();
					System.out.println("rollback_ordpro");
				}
				try {
					//주문완료된 카트 종료
					deleteCartvalue(i);
					Map map = new HashMap();
					map.put("productname", cart.getProductName());
					map.put("qty", cart.getQty());
					sqlSession.update(namespace + ".updateSale", map);
					System.out.println("update1 : "+map);
					System.out.println("update2 : "+i);
					sqlSession.commit();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			
		}finally{
			sqlSession.close();
		}
	}
	
	
	public List<OrderInfo> getorderinfolist(int memNum) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getorderinfolist";
			return sqlSession.selectList(statement, memNum);
		}finally{
			sqlSession.close();
		}
	}
	
	public List<OrderProduct> getorderproductlist(Long orderNum) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getorderproductlist";
			return sqlSession.selectList(statement, orderNum);
		}finally{
			sqlSession.close();
		}
	}

	public int getCountCart(int memNum) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getCountCart";
			return sqlSession.selectOne(statement, memNum);
		}finally{
			sqlSession.close();
		}
	}
	
	public int getCountSale() {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try{
			String statement = namespace + ".getCountSale";
			return sqlSession.selectOne(statement);
		}finally{
			sqlSession.close();
		}
	}

	public int getCountSale_cate(int category) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try{
			String statement = namespace + ".getCountSale_cate";
			return sqlSession.selectOne(statement, category);
		}finally{
			sqlSession.close();
		}
	}

	public List<Sale> getSale_desc() {
	      // TODO Auto-generated method stub
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try{
	         String statement = namespace + ".getSale_saledesc";
	         return sqlSession.selectList(statement);
	      }finally{
	         sqlSession.close();
	      }
	   }

}
