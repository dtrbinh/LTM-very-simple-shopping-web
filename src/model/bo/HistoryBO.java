package model.bo;

import java.util.List;

import model.bean.History;
import model.dao.HistoryDAO;

public class HistoryBO {
	

	public static void addHistory(History h) {
		HistoryDAO.addHistory(h);
	};
	
	//l�?c lịch sử của khách hàng.
	public static List<History> getList(int user_id){
		return HistoryDAO.getList(user_id);
	};

}
