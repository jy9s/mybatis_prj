package day1226;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;

public class SelectDAO2 {
	private static SelectDAO2 sDAO;
	private SelectDAO2() {		
	}
	
	public static SelectDAO2 getInstance() {
		if(sDAO==null) {
			sDAO = new SelectDAO2();
		}
		
		return sDAO;
	}
	
	
	
	public EmpDomain useDomain(EmpDTO empDTO) throws PersistenceException{
		EmpDomain empDomain = null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		empDomain = ss.selectOne("day1226.useDomain",empDTO);
		if(ss!=null) {
			ss.close();
		}
		
		return empDomain;
	}
	
	public List<ZipcodeDomain> useLike(String dong) throws PersistenceException{
		List<ZipcodeDomain> list = new ArrayList<ZipcodeDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1226.like",dong);
		if(ss!=null) {
			ss.close();
		}
		return list;
	}
	
	public List<EmpDomain> lessThan(int sal) throws PersistenceException{
		List<EmpDomain> list = new ArrayList<EmpDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1226.lessThan",sal);
		if(ss!=null) {
			ss.close();
		}
		return list;
	}
	
	public List<EmpDomain> greaterThan(int sal) throws PersistenceException{
		List<EmpDomain> list = new ArrayList<EmpDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1226.greaterThan",sal);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	public List<EmpAllDomain> subquery() throws PersistenceException{
		List<EmpAllDomain> list = new ArrayList<EmpAllDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1226.subquery");
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	public List<EmpAllDomain> union() throws PersistenceException{
		List<EmpAllDomain> list = new ArrayList<EmpAllDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1226.union");
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	public List<CarModelDomain> join() throws PersistenceException{
		List<CarModelDomain> list = new ArrayList<CarModelDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1226.join");
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	
	
	
	
}
