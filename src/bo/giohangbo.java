package bo;


import java.util.ArrayList;


import bean.giohangbean;

public class giohangbo {
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	public void Them(String masach, String tensach, String tacgia, long gia, long soluong) {
		giohangbean gh = new giohangbean(masach, tensach, tacgia, gia, soluong);
		ds.add(gh);
	}
	
	public void Them1(String masach, String tensach, String tacgia, long gia, long soluong) {
		
		int n = ds.size();
		for(int i = 0 ; i < n ; i ++) {
			if(ds.get(i).getMasach().toLowerCase().trim().equals(masach.toLowerCase().trim())) {
				long slt = ds.get(i).getSoluong() + soluong;
				ds.get(i).setSoluong(slt);
				long g = ds.get(i).getGia();
				long tt = g*slt;
				ds.get(i).setThanhtien(tt);
				return;
			}
		}
		giohangbean h = new giohangbean(masach, tensach, tacgia, gia, soluong);
		ds.add(h);
	}
	
	
	
	public long tong() {
		long s = 0;
		for(giohangbean gh : ds) {
			s+= gh.getThanhtien();
		
		}
		return s;
	}
}
