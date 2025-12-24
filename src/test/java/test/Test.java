package test;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.List;

import org.junit.jupiter.api.DisplayName;

import day1224.EmpDTO;
import day1224.SelectDAO;

public class Test {

	@org.junit.Test
	@DisplayName("select 테스트")
	public void test() {
		//SelectService ss = SelectService.getInstance();
		//assertNotNull(ss.scsr(10));
//		assertEquals(ss.scmr(10), "ACCOUNTING");
		//assertNotNull(ss.scmr(10));
		SelectDAO sDAO = SelectDAO.getInstance();
//		EmpDTO eDTO = sDAO.mcsr(7788);
//		System.out.println(eDTO);
//		assertNotNull(eDTO);
		List<EmpDTO> list = sDAO.mcmr(10);
		System.out.println(list);
		//assertNotNull(list);
		assertEquals(list.size(), 3);
		
	}

}
