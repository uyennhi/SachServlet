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
	

	
	public int Them(String maloai,String tenloai)  throws Exception{
		return s.Them(maloai, tenloai);
	}
	
	
	public int Sua(String maloai,String tenloaimoi) throws Exception{
		return s.Sua(maloai, tenloaimoi);
	}
	
	
	public int Xoa(String maloai) throws Exception{
		return s.Xoa(maloai);
	}
	
	public loaibean TimMaLoai(String maloai) throws Exception{
		return s.TimMaLoai(maloai);
	}
}
