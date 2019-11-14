package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.loaibean;
import bean.sachbean;

public class loaidao {
	dungchung dc = new dungchung();
	public ArrayList<loaibean> getloai() throws Exception{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		//B1: ket noi vao csdl
		dc.KetNoi();
		String sql = "select * from loai";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			 String maloai = rs.getString("maloai");
			 String tenloai = rs.getString("tenloai");
			 loaibean s = new loaibean(maloai,tenloai);
			 
			 ds.add(s);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}
	
	public ArrayList<loaibean> getloaiChiTiet(String madcgui) throws Exception{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		//B1: ket noi vao csdl
		dc.KetNoi();
		String sql = "select * from loai inner jon sach on loai.maloai = sach.maloai where sach.maloai="+madcgui;
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			 String maloai = rs.getString("maloai");
			 String tenloai = rs.getString("tenloai");
			 loaibean s = new loaibean(maloai,tenloai);
			 
			 ds.add(s);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}
}
