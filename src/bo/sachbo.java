package bo;

import java.util.ArrayList;

import bean.sachbean;
import dao.sachdao;

public class sachbo {
	sachdao s = new sachdao();
	public ArrayList<sachbean> getsach() throws Exception{
		return s.getsach();
	}
	
	public ArrayList<sachbean> getsachChiTiet(String madcgui) throws Exception{
		return s.getsachChiTiet(madcgui);
	}
	
	public ArrayList<sachbean> getTenSach(String tensearch) throws Exception{
		return s.getTenSach(tensearch);
	}
}
