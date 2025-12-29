package day1229;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import day1226.CarModelDomain;

public class SelectService3 {

	private static SelectService3 ss;
	private SelectService3() {
	}
	public static SelectService3 getInstance() {
		if(ss==null) {
			ss=new SelectService3();
		}
		return ss;
	}
	
	public List<CarModelDomain> subQueryNjoin(){
		List<CarModelDomain> list = null;
		
		try {
			list = SelectDAO3.getInstance().subQueryNjoin();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
}
