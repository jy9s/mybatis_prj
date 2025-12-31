package day1231;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SelectService5 {

	private static SelectService5 ss;
	private SelectService5() {
	}
	public static SelectService5 getInstance() {
		if(ss==null) {
			ss=new SelectService5();
		}
		return ss;
	}
	

	public void addMember(MemberDTO mDTO) {
		SelectDAO5 sd5 = SelectDAO5.getInstance();
		sd5.insertMember(mDTO);
		
	}
	
	public MemberDomain searchOneMember(int num) {
		MemberDomain md = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		
		SelectDAO5.getInstance().selectOneMember(map);
		//숫자 BigDecimal, 문자열 String, 날짜 TimeStamp;
		
		List<Map<String,Object>> list = (List<Map<String,Object>>)map.get("searchMember");
		//검색 결과가 있다면 list 방에 값이 들어있고, 검색결과가 없다면 list는 생성되지만 방에 값이 없다.
		if(!list.isEmpty()) {
			Map<String, Object> resultMap = list.get(0);
			md = new MemberDomain();
			
			md.setName((String)resultMap.get("NAME"));
			BigDecimal bdAge = (BigDecimal)resultMap.get("AGE");
			int age=0;
			if(bdAge != null) {
				age = bdAge.intValue();
			}
			md.setAge(age);
			md.setGender((String)resultMap.get("GENDER"));
			md.setTel((String)resultMap.get("TELL"));
			md.setInputDate((Timestamp)resultMap.get("INPUT_DATE"));
			
			
		}
		return md; 
	}
	public List<MemberDomain> searchAllMember() {
		MemberDomain md = null;
		Timestamp ts = null;
		List<MemberDomain> mdList = new ArrayList<MemberDomain>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int age=0;
		
		SelectDAO5.getInstance().selectAllMember(map);
		//숫자 BigDecimal, 문자열 String, 날짜 TimeStamp;
		
		List<Map<String,Object>> list = (List<Map<String,Object>>)map.get("searchAllMember");
		//검색 결과가 있다면 list 방에 값이 들어있고, 검색결과가 없다면 list는 생성되지만 방에 값이 없다.
		if(list!=null && !list.isEmpty()) {
			for(int i = 0; i<list.size(); i++) {
				Map<String, Object> resultMap = list.get(i);
				md = new MemberDomain();
				md.setNum(((BigDecimal)resultMap.get("NUM")).intValue());
				md.setName((String)resultMap.get("NAME"));
				BigDecimal bdAge = (BigDecimal)resultMap.get("AGE");
				if(bdAge != null) {
					age = bdAge.intValue();
				}
				md.setAge(age);
				md.setGender((String)resultMap.get("GENDER"));
				md.setTel((String)resultMap.get("TELL"));
				ts=(Timestamp)resultMap.get("INPUT_DATE");
				md.setInputDate(ts);
				if(ts!=null) {
					md.setInput_date(new Date(ts.getTime()));
				}
				mdList.add(md);
			}
		}
		return mdList;
	}
	
}
