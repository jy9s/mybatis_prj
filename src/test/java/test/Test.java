package test;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.DisplayName;

import day1230.SelectDAO4;
import kr.co.sist.board.BoardDAO;
import kr.co.sist.board.RangeDTO;

public class Test {

	@org.junit.Test
	@DisplayName("select 테스트")
	public void test() {
		//SelectService ss = SelectService.getInstance();
		//assertNotNull(ss.scsr(10));
//		assertEquals(ss.scmr(10), "ACCOUNTING");
		//assertNotNull(ss.scmr(10));
//		SelectDAO2 sDAO = SelectDAO.getInstance();
//		EmpDTO eDTO = sDAO.mcsr(7788);
//		System.out.println(eDTO);
//		assertNotNull(eDTO);
//		List<EmpDTO> list = sDAO.mcmr(10);
		//assertNotNull(list);
//		assertEquals(list.size(), 3);
//		day1226.EmpDTO eDTO = new day1226.EmpDTO();
//		eDTO.setEmpno(7521);
//		eDTO.setDeptno(30);
		//System.out.println(eDTO);
		
//		SelectDAO2 sDAO = SelectDAO2.getInstance();
//		CarDAO cDAO = CarDAO.getInstance();
//		try {
//		EmpDomain ed=sDAO.useDomain(eDTO);
//		assertNotNull(ed);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		try {
//		assertNotNull(sDAO.useLike("대치동"));
//		}catch(Exception e ){
//			e.printStackTrace();
//		} 
		//SelectDAO3 sDAO = SelectDAO3.getInstance();
		
		//BoardDAO bDAO = BoardDAO.getInstance();
		
		SelectDAO4 sDAO = SelectDAO4.getInstance();
		try {
//			assertNotNull(bDAO.selectBoardTotalCnt(new RangeDTO()));
			//RangeDTO rDTO = new RangeDTO();
//			rDTO.setField("1");
//			rDTO.setKeyword("오늘은");
			
			
			
//			assertNotNull(sDAO.dynamicChoose(3));
			int[] empno= {7521,7566,7564,7698};
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("empnoArr", empno);
			
			assertNotNull(sDAO.dynamicForEach(map));
			
//			assertNotNull(bDAO.selectBoardTotalCnt(rDTO));
		//assertNotNull(sDAO.greaterThan(2000));
		//assertNotNull(sDAO.subquery());
		//assertNotNull(sDAO.join());
		//assertNotNull(cDAO.selectCarMaker("수입"));
//		CarService cs = CarService.getInstance();
//		System.out.println(cs.searchModel("현대"));
//			assertNotNull(sDAO.subQueryNjoin());
			//assertNotNull(sDAO.dollar("cp_emp5"));
			//assertNotNull(sDAO.dynamicIf(0));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
