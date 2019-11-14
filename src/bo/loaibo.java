package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	
	loaidao s = new loaidao();
	public ArrayList<loaibean> getloai() throws Exception{
		return s.getloai();
	}
	
	public ArrayList<loaibean> getloaiChitiet(String madcgui) throws Exception{
		return s.getloaiChiTiet(madcgui);
	}
	

}
