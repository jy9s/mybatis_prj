package day1224;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

public class SelectService {

	private static SelectService ss;
	private SelectService() {
	}
	public static SelectService getInstance() {
		if(ss==null) {
			ss=new SelectService();
		}
		return ss;
	}
	
	/**
	 * 부서번호를 입력하여 부서명을 검색
	 * @param deptno
	 * @return
	 */
	public String scsr(int deptno) {
		String dname ="";
		try {
		dname = SelectDAO.getInstance().scsr(deptno);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return dname;
	}
	/**
	 * 부서번호를 입력하여 사원명을 검색
	 * @param deptno
	 * @return
	 */
	public List<String> scmr(int deptno) {
		List<String> list=null;
		try {
			list = SelectDAO.getInstance().scmr(deptno);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 사원번호를 입력받아 사원 정보를 검색
	 * @param deptno
	 * @return
	 */
	public EmpDTO mcsr(int empno) {
		EmpDTO eDTO = null;
		
		try {
			eDTO = SelectDAO.getInstance().mcsr(empno);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return eDTO;
	}
	
	public List<EmpDTO> mcmr(int deptno) {
		List<EmpDTO> list=null;
		try {
			list = SelectDAO.getInstance().mcmr(deptno);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return list;
	}
}
