package bean;

import java.util.Date;

public class sachbean {
	private String masach;
	private String tensach;
	private String taciga;
	private long gia;
	private String anh;
	private Date ngaynhap;
	private String maloai;
	public sachbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public sachbean(String masach, String tensach, String taciga, long gia, String anh, Date ngaynhap, String maloai) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.taciga = taciga;
		this.gia = gia;
		this.anh = anh;
		this.ngaynhap = ngaynhap;
		this.maloai = maloai;
	}
	public String getMasach() {
		return masach;
	}
	public void setMasach(String masach) {
		this.masach = masach;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public String getTaciga() {
		return taciga;
	}
	public void setTaciga(String taciga) {
		this.taciga = taciga;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public Date getNgaynhap() {
		return ngaynhap;
	}
	public void setNgaynhap(Date ngaynhap) {
		this.ngaynhap = ngaynhap;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	
	
	
	// phat sinh 1 ham tao co tham so
	// phat sinh 5 ham get, 5 ham set
	
	
}
