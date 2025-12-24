package day1224;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class EmpDTO {
	private String ename, job, strHiredate;
	private Date hiredate;
	private int empno, mgr, deptno;
	private double sal, comm;

}
