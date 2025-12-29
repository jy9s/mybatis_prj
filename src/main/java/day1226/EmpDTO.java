package day1226;

import lombok.ToString;

/**
 * insert에 추가되는 값, update의 변경값, where절 사용하는 값, delete에 where절에서 사용하는 값
 * select where절 사용하는 값
 * 
 * <jsp:useBean> : 기본생성자를 사용하여 객체화를 하고
 * <jsp:setProperty> : setter method를 통해 입력값이 저장.
 * MyBatis 에서는 parameterType="EmpDTO" 입력받아서 #{getter명}으로 사용.
 */
@ToString

public class EmpDTO {
	private int deptno, empno;

	public EmpDTO(){
		System.out.println("<jsp:useBean>에 의해서 객체화");
	}

	public int getDeptno() {
		System.out.println("MyBatis에서 #{deptno}로 사용");
		return deptno;
	}

	public void setDeptno(int deptno) {
		System.out.println("<jsp:setProperty>에서 setDeptno사용");
		this.deptno = deptno;
	}

	public int getEmpno() {
		System.out.println("MyBatis에서 #{empno}로 사용");
		return empno;
	}

	public void setEmpno(int empno) {
		System.out.println("<jsp:setProperty>에서 setEmpno사용");
		this.empno = empno;
	}
	
}
