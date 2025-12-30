package day1230;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day1224.EmpDTO;
import day1226.EmpAllDomain;
import kr.co.sist.dao.MyBatisHandler;

public class SelectDAO4 {
	private static SelectDAO4 sDAO;
	private SelectDAO4() {		
	}
	
	public static SelectDAO4 getInstance() {
		if(sDAO==null) {
			sDAO = new SelectDAO4();
		}
		
		return sDAO;
	}
	
	
	
	public List<EmpAllDomain> dynamicChoose(int deptno) throws PersistenceException{
		List<EmpAllDomain> list = new ArrayList<EmpAllDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1230.dynamicChoose", deptno);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	
	public List<Integer> selectAllEmpno() throws PersistenceException{
		List<Integer> list = new ArrayList<Integer>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1230.selectAllEmpno");
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}

	public List<EmpAllDomain> dynamicForEach(Map<String, Object> empMap) throws PersistenceException{
		List<EmpAllDomain> list = new ArrayList<EmpAllDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1230.dynamicForEach", empMap);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	public int dynamicSet(EmpDTO eDTO) throws PersistenceException{
		int cnt = 0;
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		cnt = ss.update("day1230.dynamicSet",eDTO);
		if(ss!=null) {ss.close();}
		return cnt;
	}
	public int transaction(TransactionDTO tDTO) throws PersistenceException{
		int cnt = 0;
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		cnt += ss.insert("day1230.trans1",tDTO);
		cnt += ss.insert("day1230.trans2",tDTO);
		
		if(cnt==2) {
			System.out.println("insert commit");
			ss.commit();
		}
		
		if(ss!=null) {ss.close();}
		return cnt;
	}
	
	public int transaction2(TransactionDTO tDTO) throws PersistenceException{
		int cnt = 0;
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		cnt += ss.update("day1230.upTrans1",tDTO);
		cnt += ss.update("day1230.upTrans2",tDTO);
		//insert => commit 아니면 예외
		//update, delete => commit, rollback 아니면 예외
		if(cnt==2) {
			System.out.println("update commit");
			ss.commit();
		}else {
			System.out.println("update rollback");
			ss.rollback();
		}
		
		if(ss!=null) {ss.close();}
		return cnt;
	}
	
	
	
}
