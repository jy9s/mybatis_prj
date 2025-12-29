package test;

import static org.junit.Assert.assertNotNull;

import org.junit.jupiter.api.DisplayName;

import day1226.EmpDomain;
import day1226.SelectDAO2;
import kr.co.sist.car.CarDAO;

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
		
		SelectDAO2 sDAO = SelectDAO2.getInstance();
		CarDAO cDAO = CarDAO.getInstance();
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
		try {
		//assertNotNull(sDAO.greaterThan(2000));
		//assertNotNull(sDAO.subquery());
		//assertNotNull(sDAO.join());
		assertNotNull(cDAO.selectCarMaker("수입"));
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
