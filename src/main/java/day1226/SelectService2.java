package day1226;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

public class SelectService2 {

	private static SelectService2 ss;
	private SelectService2() {
	}
	public static SelectService2 getInstance() {
		if(ss==null) {
			ss=new SelectService2();
		}
		return ss;
	}
	
	public EmpDomain useDomain(EmpDTO empDTO) {
		EmpDomain empDomain = null;
		
		try {
			empDomain = SelectDAO2.getInstance().useDomain(empDTO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return empDomain;
	}
	
	public List<ZipcodeDomain> useLike(String dong){
		List<ZipcodeDomain> list = null;
		
		try {
			list = SelectDAO2.getInstance().useLike(dong);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public List<EmpDomain> lessThan(int sal){
		List<EmpDomain> list = null;
		
		try {
			list = SelectDAO2.getInstance().lessThan(sal);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public List<EmpDomain> greaterThan(int sal){
		List<EmpDomain> list = null;
		
		try {
			list = SelectDAO2.getInstance().greaterThan(sal);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	public List<EmpAllDomain> subquery(){
		List<EmpAllDomain> list = null;
		
		try {
			list = SelectDAO2.getInstance().subquery();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	public List<EmpAllDomain> union(){
		List<EmpAllDomain> list = null;
		
		try {
			list = SelectDAO2.getInstance().union();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public List<CarModelDomain> join(){
		List<CarModelDomain> list = null;
		
		try {
			list = SelectDAO2.getInstance().join();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
}
