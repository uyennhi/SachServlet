package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class dungchung {
	public Connection cn;
	public void KetNoi() throws Exception{
		//b1: xac dinh he quan tri co so du lieu
	//	Connection conn = null;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		
		System.out.print("Da xac dinh HeQTCSDL");
		//Ket noi
		String url = "jdbc:sqlserver://DESKTOP-3JPSQ8B\\MSSQLSEVER:1433;databaseName=QlSach;user=sa; password=123";
		//DESKTOP-3JPSQ8B\\MSSQLSEVER:1433
		cn = DriverManager.getConnection(url);
		System.out.print("Da ket noi");
	}
}
