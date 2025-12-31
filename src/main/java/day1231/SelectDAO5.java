package day1231;

import java.util.HashMap;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;

public class SelectDAO5 {
	private static SelectDAO5 sDAO;
	
	private SelectDAO5() {
	}
	
	public static SelectDAO5 getInstance() {
		if( sDAO == null ) {
			sDAO=new SelectDAO5();
		}//end if
		return sDAO;
	}//getInstance
	
	public void insertMember(MemberDTO mDTO)throws PersistenceException {
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		ss.selectOne("day1231.insertProc",mDTO);
		if( ss != null) { ss.close(); }//end if
		
	}//insertMember
	
	public void updateMember(MemberDTO mDTO)throws PersistenceException {
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		ss.selectOne("day1231.updateProc",mDTO);
		if( ss != null) { ss.close(); }//end if
		
	}//updateMember
	
	public void deleteMember(MemberDTO mDTO)throws PersistenceException {
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		ss.selectOne("day1231.deleteProc",mDTO);
		if( ss != null) { ss.close(); }//end if
		
	}//updateMember
	
	
	public void selectOneMember(HashMap<String, Object> hashmap)throws PersistenceException {
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		ss.selectOne("day1231.SelectOneProc",hashmap);
		if( ss != null) { ss.close(); }//end if
		
	}//updateMember

	public void selectAllMember(HashMap<String, Object> hashmap)throws PersistenceException {
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		ss.selectOne("day1231.SelectAllProc",hashmap);
		if( ss != null) { ss.close(); }//end if
		
	}//updateMember
	
	
	
	
}//class









