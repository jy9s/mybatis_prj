package kr.co.sist.car;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;

public class CarDAO {
	private static CarDAO sDAO;
	private CarDAO() {		
	}
	
	public static CarDAO getInstance() {
		if(sDAO==null) {
			sDAO = new CarDAO();
		}
		
		return sDAO;
	}
	
	
	
	public List<String> selectCarMaker(String type) throws PersistenceException{
		List<String> list = null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("kr.co.sist.car.carMaker",type);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	public List<String> selectCarModel(String carMaker) throws PersistenceException{
		List<String> list = null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("kr.co.sist.car.carModel",carMaker);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	public List<ViewDomain> selectTotalView(CarDTO cDTO) throws PersistenceException{
		List<ViewDomain> list = new ArrayList<ViewDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("kr.co.sist.car.carView",cDTO);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	public List<ViewDomain> selectCar(String model) throws PersistenceException{
		List<ViewDomain> list = new ArrayList<ViewDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("kr.co.sist.car.carView2",model);
		if(ss!=null) {
			ss.close();
		}
		
		return list;
	}
	
	
	
}
