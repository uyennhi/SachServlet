package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.loaibean;
import bean.sachbean;

public class loaidao {
	dungchung dc = new dungchung();
	public boolean KtraMa(String maloai) throws Exception{
		String sql = "select maloai from loai where maloai = ?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		ResultSet rs = cmd.executeQuery();
		boolean kq = rs.next();
		rs.close();
		return kq;
	}
	
	public int Them(String maloai,String tenloai)  throws Exception{
		dc.KetNoi();
		if(KtraMa(maloai)) return 0;
		String sql = "INSERT INTO loai (maloai, tenloai)" + 
				"VALUES (?, ?)";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		int kq = cmd.executeUpdate();
		dc.cn.close();
		//neu trung ma thi thoat
		//nguoc lai thi them vao 1 loai
		//b1: ket noi; b2: thiet lap cau lenh sql; b3: tao cau lenh
		//b4: truyen than so vao cau lenh; b5 : chay cau lenh: b6: dong ket noi
		return kq;
	}
	public int Sua(String maloai,String tenloaimoi) throws Exception{
		dc.KetNoi();
		if(KtraMa(maloai)) return 0;
		String sql = "UPDATE loai SET tenloai = ? WHERE maloai= ?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, tenloaimoi);
		cmd.setString(2, maloai);
		int kq = cmd.executeUpdate();
		dc.cn.close();
		return 1;
	}
	
	public boolean KtLoaiSach(String maloai) throws Exception{
		String sql = "select masach from sach where masach = ?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		ResultSet rs = cmd.executeQuery();
		boolean kq = rs.next();
		rs.close();
		return kq;
		
	}
	public int Xoa(String maloai) throws Exception{
		dc.KetNoi();
		if(KtLoaiSach(maloai)) return 0;
		String sql = "delete from loai WHERE maloai= ?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		
		cmd.setString(1, maloai);
		int kq = cmd.executeUpdate();
		dc.cn.close();
		return 1;
	}
	
	public loaibean TimMaLoai(String maloai) throws Exception{
		
		//B1: ket noi vao csdl
		dc.KetNoi();
		String sql = "select * from loai where maloai= ?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		ResultSet rs = cmd.executeQuery();
		loaibean l = null;
		if(rs.next()) {
			 String ml = rs.getString("maloai");
			 String tenloai = rs.getString("tenloai");
			 l = new loaibean(maloai,tenloai);
			 
			
		}
		rs.close();
		dc.cn.close();
		return l;
	}
	
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
