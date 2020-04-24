package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Brand;
import model.Cart;
import model.Follow;
import model.Jjim;
import model.Member;
import model.Rcp;
import model.Sale;
import mybatis.AbstractRepository;

@Component
public class BrandRepository{
	private final String namespace = "mybatis.dao.BrandMapper";
	private static BrandRepository instance = new BrandRepository();
	
	@Autowired
	public AbstractRepository opendb;
	
	
	public String selectById(String id) 
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            String statement = namespace + ".selectById";
            return sqlSession.selectOne(statement, id);
          
        }
        finally
        {  System.out.println(id);
            sqlSession.close();
        }
    }
	
	public int insertBrand(Brand Brand){
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		//int cartnum = 0;
		try{
			//cartnum = sqlSession.selectOne(namespace+".insert_maxCart");
		/*	Brand.setCartNum(cartnum);*/
			//System.out.println(Brand);
			String statement = namespace + ".insertBrand";
			int result = sqlSession.insert(statement, Brand);
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

	public Brand getBrand(String id) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Brand brand=null;
		
		
		try{
			String statement = namespace + ".getBrand";
			brand=sqlSession.selectOne(statement, id);
			
			
		
		}finally{
			sqlSession.close();
		}
		return brand;
	}
	
	public int deleteCartvalue(int cartNum) throws Exception{
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try{
			
			String statement = namespace + ".deleteCartvalue";
			sqlSession.selectOne(statement, cartNum);
			System.out.println("repository1"+cartNum);
			sqlSession.commit();
			System.out.println("repository2"+cartNum);
			return 1;
		}finally{
			sqlSession.close();
		}
		
	}
	public int registjjim(int cartNum, String memNum){
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Cart cart = new Cart(); 
		Jjim jjim = new Jjim();
		int jnum = 0;
		int cknum = 0;
		int result = 0;
		try{
			cart = sqlSession.selectOne(namespace+".getCartintoJjim", cartNum);
			System.out.println("dao_c : " + cart.toString());
			
			Map map = new HashMap();
			map.put("memNum", memNum);
			map.put("productName", cart.getProductName());
			cknum = sqlSession.selectOne(namespace+".checkjjim", map);
			if(cknum>0){
				System.out.println(cknum);
				return 0; 
			}else{
				jnum = sqlSession.selectOne(namespace+".insert_maxJjim");
				//������ īƮ�� ������ ����ϴ� �������丮 �ۼ�
				jjim.setJjimNum(jnum);
				jjim.setMemNum(cart.getMemNum());
				jjim.setPrice(cart.getPrice());
				jjim.setProductName(cart.getProductName());
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
	
	public Cart order_product(int cartNum){
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Cart cart = new Cart(); 
		try{
			cart = sqlSession.selectOne(namespace+".getCartintoJjim", cartNum);
			System.out.println("dao_c : " + cart.toString());
			return cart;
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
	public List<Member> memList() {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		List<Member> searchList=null;
		
		try{
			String statement = namespace + ".memList";
			searchList=sqlSession.selectList(statement);
			
			
		
		}finally{
			sqlSession.close();
		}
		return   searchList;
	}

	public List<Member> memSearch(String keyword) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		List<Member> memSearch=null;
		
		try{
			String statement = namespace + ".memSearch";
			memSearch=sqlSession.selectList(statement, keyword);			
		
		}finally{
			sqlSession.close();
		}
		return   memSearch;
	}
	
	 public List<Member> selectName(String name) {
		 
			
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        List<Member> searchprofile=null;
	        try
	        {
	            String statement = namespace + ".selectName";
	            searchprofile=sqlSession.selectList(statement);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	        return searchprofile;
	    }
	
}
