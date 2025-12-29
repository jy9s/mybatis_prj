package kr.co.sist.car;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


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
	
	public String searchMaker(String country){
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("makerCnt", 0);
		
		CarDAO csDAO = CarDAO.getInstance();
		try {
		List<String> makerList = csDAO.selectCarMaker(country);
		jsonObj.put("result",true);
		jsonObj.put("makerCnt", makerList.size());
		
		JSONObject jsonTemp = null;
		JSONArray jsonArr = new JSONArray();
		
		for(String maker: makerList) {
			jsonTemp = new JSONObject();
			
			jsonTemp.put("maker", maker);
			
			jsonArr.add(jsonTemp);
		}
		
		jsonObj.put("data", jsonArr);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return jsonObj.toJSONString();
	}
	public String searchModel(String maker){
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("makerCnt", 0);
		
		CarDAO csDAO = CarDAO.getInstance();
		try {
			List<String> modelList = csDAO.selectCarModel(maker);
			jsonObj.put("result",true);
			
			jsonObj.put("makerCnt", modelList.size());
			
			JSONObject jsonTemp = null;
			JSONArray jsonArr = new JSONArray();
			
			for(String model: modelList) {
				jsonTemp = new JSONObject();
				
				jsonTemp.put("model", model);
				
				jsonArr.add(jsonTemp);
			}
			
			jsonObj.put("data", jsonArr);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return jsonObj.toJSONString();
	}
	public String searchCar(String model){
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("makerCnt", 0);
		
		CarDAO csDAO = CarDAO.getInstance();
		try {
			List<ViewDomain> carList = csDAO.selectCar(model);
			jsonObj.put("result",true);
			
			jsonObj.put("makerCnt", carList.size());
			
			JSONObject jsonTemp = null;
			JSONArray jsonArr = new JSONArray();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");
			String carOption ="";
			for(ViewDomain vd : carList) {
				
				
				carOption=vd.getCar_option();
				if(carOption != null && carOption.length()>20) {
					carOption=carOption.substring(0,19)+"...";
				}
				
				jsonTemp = new JSONObject();
				
				jsonTemp.put("car_img", vd.getCar_img());
				jsonTemp.put("car_option", vd.getCar_option());
				jsonTemp.put("car_year", vd.getCar_year());
				jsonTemp.put("price", vd.getPrice());
				jsonTemp.put("cc", vd.getCc());
				jsonTemp.put("inputDate", sdf.format(vd.getInput_date()));
				
				jsonArr.add(jsonTemp);
			}
			
			jsonObj.put("data", jsonArr);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return jsonObj.toJSONString();
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
