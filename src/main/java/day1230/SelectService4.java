package day1230;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import day1224.EmpDTO;
import day1226.EmpAllDomain;

public class SelectService4 {

	private static SelectService4 ss;
	private SelectService4() {
	}
	public static SelectService4 getInstance() {
		if(ss==null) {
			ss=new SelectService4();
		}
		return ss;
	}
	
	public List<EmpAllDomain> dynamicChoose(int deptno) throws PersistenceException {
		List<EmpAllDomain> list = null;
		try {
			list = SelectDAO4.getInstance().dynamicChoose(deptno);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public List<Integer> searchAllEmpno() throws PersistenceException{
		List<Integer> list = null;
		try {
			list = SelectDAO4.getInstance().selectAllEmpno();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public List<EmpAllDomain> dynamicForEach(String[] empnoArr) throws PersistenceException {
		List<EmpAllDomain> list = null;
		try {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("empnoArr", empnoArr);
			list = SelectDAO4.getInstance().dynamicForEach(map);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public int dynamicSet(EmpDTO eDTO) throws PersistenceException {
		int cnt = 0;
		try {
			cnt = SelectDAO4.getInstance().dynamicSet(eDTO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}
	
	public boolean transaction(TransactionDTO tDTO) throws PersistenceException {
		int cnt = 0;
		try {
			cnt = SelectDAO4.getInstance().transaction(tDTO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt==2;
	}
	
	
	
	
}
