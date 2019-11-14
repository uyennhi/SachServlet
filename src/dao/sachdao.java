package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.sachbean;

public class sachdao {
	dungchung dc = new dungchung();
	public ArrayList<sachbean> getsach() throws Exception{
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		//B1: ket noi vao csdl
		dc.KetNoi();
		String sql = "select * from sach";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			 String masach = rs.getString("masach");
			 String tensach = rs.getString("tensach");
			 String taciga= rs.getString("tacgia");
			 long gia = rs.getLong("gia");
			 String anh = rs.getString("anh");
			 Date ngaynhap = rs.getDate("ngaynhap");
			 String maloai = rs.getString("maloai");
			 sachbean s = new sachbean(masach, tensach, taciga, gia, anh, ngaynhap, maloai);
			 ds.add(s);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}
	
	public ArrayList<sachbean> getsachChiTiet(String madcgui) throws Exception{
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		//B1: ket noi vao csdl
		dc.KetNoi();
		String sql = "select * from loai INNER JOIN sach ON loai.maloai = sach.maloai where sach.maloai="+"'"+madcgui+"'";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			 String masach = rs.getString("masach");
			 String tensach = rs.getString("tensach");
			 String taciga= rs.getString("tacgia");
			 long gia = rs.getLong("gia");
			 String anh = rs.getString("anh");
			 Date ngaynhap = rs.getDate("ngaynhap");
			 String maloai = rs.getString("maloai");
			 sachbean s = new sachbean(masach, tensach, taciga, gia, anh, ngaynhap, maloai);
			 ds.add(s);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}
	
	public ArrayList<sachbean> getTenSach(String tensearch) throws Exception{
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		//B1: ket noi vao csdl
		dc.KetNoi();
	//	String sql = "select * from sach  where tensach LIKE " + "N'"+"%"+tensearch+"%"+"'";
		String sql = "select * from sach  where tensach LIKE ?";
		
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, "%"+tensearch+"%");
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			 String masach = rs.getString("masach");
			 String tensach = rs.getString("tensach");
			 String taciga= rs.getString("tacgia");
			 long gia = rs.getLong("gia");
			 String anh = rs.getString("anh");
			 Date ngaynhap = rs.getDate("ngaynhap");
			 String maloai = rs.getString("maloai");
			 sachbean s = new sachbean(masach, tensach, taciga, gia, anh, ngaynhap, maloai);
			 ds.add(s);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}
}
