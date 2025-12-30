package day1230;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day1226.CarModelDomain;
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
	
	public int dynamicSet() throws PersistenceException{
		int cnt = 0;
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		cnt = ss.update(null);
		if(ss!=null) {ss.close();}
		return cnt;
	}
	
	
	
	
	
}
