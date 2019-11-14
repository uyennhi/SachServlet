package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class GioHangController
 */
@WebServlet("/GioHangController")
public class GioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GioHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    loaibo lbo = new loaibo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mh = request.getParameter("mh");
		String th = request.getParameter("th");
		String tg = request.getParameter("tg");
		String gia = request.getParameter("gia");
		
		
		HttpSession session = request.getSession();
		if(th != null && gia != null  && mh != null && tg != null){
			giohangbo g = new giohangbo();
			
			if(session.getAttribute("gh") == null){
				g = new giohangbo();
				session.setAttribute("gh",g);
				
			}
			// gan C giohang
			g = (giohangbo) session.getAttribute("gh");
			// them c
			g.Them1(mh,th,tg, Long.parseLong(gia), 1);
			
			// dat lai CgioHang
			session.setAttribute("gh", g);
		}
		
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			request.setAttribute("dsloai", lbo.getloai());
			RequestDispatcher rd = request.getRequestDispatcher("GioHang.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
