package kr.co.sist.car;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;


public class CarService {

	private static CarService ss;
	private CarService() {
	}
	public static CarService getInstance() {
		if(ss==null) {
			ss=new CarService();
		}
		return ss;
	}
	
	
	
	public List<String> searchCarMaker(String type){
		List<String> list = null;
		
		try {
			list = CarDAO.getInstance().selectCarMaker(type);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	
	public List<String> searchCarModel(String carMaker){
		List<String> list = null;
		
		try {
			list = CarDAO.getInstance().selectCarModel(carMaker);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
	public List<ViewDomain> searchTotalView(CarDTO cDTO){
		List<ViewDomain> list = null;
		try {
			list = CarDAO.getInstance().selectTotalView(cDTO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return list;
	}
}
