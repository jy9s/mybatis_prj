package day1224;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;

public class SelectDAO {
	private static SelectDAO sDAO;
	private SelectDAO() {		
	}
	
	public static SelectDAO getInstance() {
		if(sDAO==null) {
			sDAO = new SelectDAO();
		}
		
		return sDAO;
	}
	
	public String scsr(int deptno) throws PersistenceException {
		String dname="";
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		dname = ss.selectOne("day1224.scsr",deptno);
		if(ss!=null) {
			ss.close();
		}
		return dname;
	}
	
	
	public List<String> scmr(int deptno) throws PersistenceException {
		List<String> list = new ArrayList<String>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1224.scmr",deptno);
		if(ss!=null) {
			ss.close();
		}
		return list;
	}
	
	public EmpDTO mcsr(int empno) throws PersistenceException{
		EmpDTO eDTO = new EmpDTO();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		eDTO = ss.selectOne("day1224.mcsr",empno);
		if(ss!=null) {
			ss.close();
		}
		
		return eDTO;
	}
	public List<EmpDTO> mcmr(int deptno) throws PersistenceException {
		List<EmpDTO> list = new ArrayList<EmpDTO>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("day1224.mcmr",deptno);
		if(ss!=null) {
			ss.close();
		}
		return list;
	}
	
	
	
	
	
	
	
}
