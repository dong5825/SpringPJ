package service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Follow;
import model.Member;
import model.Rcp;
import model.Scrap;
import mybatis.AbstractRepository;

@Component
public class MybatisMemberDao
{
    private final String namespace = "mybatis.MemberMapper";

    @Autowired
	public AbstractRepository opendb;
    
    public Member selectById(String email) 
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            String statement = namespace + ".selectById";
            return sqlSession.selectOne(statement, email);
        }
        finally
        {
            sqlSession.close();
        }
    }
    public String selectByIdChk(String email) 
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            String statement = namespace + ".selectById";
            return sqlSession.selectOne(statement, email);
        }
        finally
        {
            sqlSession.close();
        }
    }
    public void insert(Member mem) 
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        int number;
        
        try
        {
        	number=sqlSession.selectOne(namespace+".insert_max");	
        	mem.setMemNum(number);
        	
            String statement = namespace + ".insert";
            sqlSession.insert(statement, mem);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getProfileCount(){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		int count;
		
		try{
			String statement=namespace+".getProfileCount"; 
			count=sqlSession.selectOne(statement);
		}finally{
			sqlSession.close();
		}

		return count;
	}
	
	public List<Member> getProfile(){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		List<Member> profileList=null;
		
		try{
			String statement=namespace+".getProfile";         
			profileList=sqlSession.selectList(statement);
		}finally{
			sqlSession.close();
		}

		return profileList;
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
	
	public int updateMember(Member member) throws Exception{
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		String dbpasswd="";
		int x=-1;
		
		try{
			dbpasswd=sqlSession.selectOne(namespace+".getPasswd", member.getMemNum());
			
			if(dbpasswd.equals(member.getPasswd())){
				sqlSession.update(namespace+".updateMember", member);
				sqlSession.commit();
				x=1;
			}else{
				x=0;
			}		
		}finally{
			sqlSession.close();
		}
		return x;
	}
	
	public int insertFollow(Follow follow){
		 SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();	   
		 int check;
		 
	        try
	        {
	        	if(follow.getMemNum()==0){
	        		check=0;
	        	}else{
	        		String statement = namespace + ".insertFollow";
		            sqlSession.insert(statement, follow);
		            sqlSession.commit();
		            check=1;
	        	}	            
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	        return check;
	}
	
	public int checkFollow(int loginNum, int memNum){
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();	  		
		int checkFollow=-1;		
		
		Map map=new HashMap();
		map.put("memNum", loginNum);
		map.put("followNum", memNum);
		
	        try
	        {
	            String statement = namespace + ".checkFollow";
	            checkFollow=sqlSession.selectOne(statement, map);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	        return checkFollow;
	}
	
	public void unFollow(Follow follow){
		 SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();	   
		 
	        try
	        {
	            String statement = namespace + ".unFollow";
	            sqlSession.delete(statement, follow);
	            sqlSession.commit();
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	}
	
	public int followCount(int memNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		int count;
		
		try{
			String statement=namespace+".followCount"; 
			count=sqlSession.selectOne(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return count;
	}
	
	public int followerCount(int memNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		int count;
		
		try{
			String statement=namespace+".followerCount"; 
			count=sqlSession.selectOne(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return count;
	}
	
	public List<Follow> followerCount2(int memNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		List<Follow> followerCount2=null;
		String statement;
		
		try{
			statement=namespace+".followerCount2";         
			followerCount2=sqlSession.selectList(statement, memNum);
		}finally{
			sqlSession.close();
		}
		
		return followerCount2;
	}
	
	public List<Member> followList(int memNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		List<Member> followList=null;
		String statement;
		
		try{
			statement=namespace+".followList";         
			followList=sqlSession.selectList(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return followList;
	}
	
	public int rcpCount(int memNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		int count;
		
		try{
			String statement=namespace+".rcpCount"; 
			count=sqlSession.selectOne(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return count;
	}
	
	public List<Rcp> rcpList(int memNum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		List<Rcp> rcpList=null;
		String statement;
		
		try{
			statement=namespace+".rcpList";         
			rcpList=sqlSession.selectList(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return rcpList;
	}
	
	public int insertScrap(Scrap scrap){
		 SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();	   
		 int check;
		 
	        try
	        {
	        	if(scrap.getMemnum()==0){
	        		check=0;
	        	}else{
	        		String statement = namespace + ".insertScrap";
		            sqlSession.insert(statement, scrap);
		            sqlSession.commit();
		            check=1;
	        	}	            
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	        return check;
	}	
	
	public void delScrap(Scrap scrap){
		 SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	            String statement = namespace + ".delScrap";
	            sqlSession.delete(statement, scrap);
	            sqlSession.commit();
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	}
	
	public int scrapCount(int memnum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		int count;
		
		try{
			String statement=namespace+".scrapCount"; 
			count=sqlSession.selectOne(statement, memnum);
		}finally{
			sqlSession.close();
		}

		return count;
	}
	
	public List<Rcp> scarpList(int memnum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		List<Rcp> scarpList=null;
		String statement;
		
		try{
			statement=namespace+".scarpList";         
			scarpList=sqlSession.selectList(statement, memnum);
		}finally{
			sqlSession.close();
		}

		return scarpList;
	}
	
	public List<Rcp> followRcpCount(int memnum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		List<Rcp> followRcpCount=null;
		String statement;
		
		try{
			statement=namespace+".followRcpCount";         
			followRcpCount=sqlSession.selectList(statement, memnum);
		}finally{
			sqlSession.close();
		}

		return followRcpCount;
	}
	
	public List<Rcp> followRcp(int memnum){
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		List<Rcp> followRcp=null;
		String statement;
		
		try{
			statement=namespace+".followRcp";         
			followRcp=sqlSession.selectList(statement, memnum);
		}finally{
			sqlSession.close();
		}

		return followRcp;
	}
	
	/*public void changePwd(String newPwd, String email) throws Exception{
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		String dbpasswd="";
		int x=-1;
		Member member=null;
		try{
			 String statement = namespace + ".selectById";
			dbpasswd=sqlSession.selectOne(statement, email);
			
			if(dbpasswd.equals(member.getEmail())){
				sqlSession.update(namespace+".updatepasswd", member.getPasswd());
				sqlSession.commit();
				x=1;
			}else{
				x=0;
			}		
		}finally{
			sqlSession.close();
		}
		//return "";
	}*/
	
	public int changePwd(String newPwd, String email) throws Exception{
		SqlSession sqlSession=opendb.getSqlSessionFactory().openSession();
		String dbpasswd="";
		int x=-1;
		Member member=null;
		try{
			 String statement = namespace + ".selectById";
	       sqlSession.selectOne(statement, email);
	            
	            
			System.out.println(email);
		//	dbpasswd=sqlSession.selectOne(namespace+".getPasswd1", member.getEmail());
		
			System.out.println(newPwd);
			
			String statement1=sqlSession.selectOne(namespace+".getPasswd1", email);
			System.out.println(statement1);
			Map map = new HashMap();
			map.put("email", email);
			map.put("passwd", newPwd);
			sqlSession.update(namespace+".updatepasswd", map);
				//member.setPasswd(newPwd);
				
			/*	  Map<String, String> map = new HashMap<String, String>();
			        map.put("email", email);
			        map.put("newPwd", newPwd);
			        sqlSession.update(namespace+".updatepasswd", newPwd);*/
				/*System.out.println(dbpasswd1);*/
				sqlSession.commit();
				x=1;
			/*}else{
				x=0;
			}		*/
		}finally{
			sqlSession.close();
		}
		return x;
	}
	
	    
}
