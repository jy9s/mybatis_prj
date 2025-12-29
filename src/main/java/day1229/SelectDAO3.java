package day1229;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day1226.CarModelDomain;
import day1226.EmpAllDomain;
import kr.co.sist.dao.MyBatisHandler;

public class SelectDAO3 {
	private static SelectDAO3 sDAO;
	private SelectDAO3() {		
	}
	
	public static SelectDAO3 getInstance() {
		if(sDAO==null) {
			sDAO = new SelectDAO3();
		}
		
		return sDAO;
	}
	
	public List<CarModelDomain> subQueryNjoin() throws PersistenceException{
		List<CarModelDomain> list = new ArrayList<CarModelDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1229.subNjoin");
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	
	public List<EmpAllDomain> dollar(String tableName) throws PersistenceException{
		List<EmpAllDomain> list = new ArrayList<EmpAllDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1229.dollar", tableName);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	
	public List<EmpAllDomain> dynamicIf(int deptno) throws PersistenceException{
		List<EmpAllDomain> list = new ArrayList<EmpAllDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1229.if", deptno);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	
	
	
}
