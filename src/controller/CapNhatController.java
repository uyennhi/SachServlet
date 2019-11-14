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

/**
 * Servlet implementation class CapNhatController
 */
@WebServlet("/CapNhatController")
public class CapNhatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CapNhatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mh = request.getParameter("mh");
		String th = request.getParameter("th");
		String tg = request.getParameter("tg");
		String gia = request.getParameter("gia");
		String sl = request.getParameter("txtSoluong");

		HttpSession session = request.getSession();
		giohangbo g = (giohangbo) session.getAttribute("gh");
			// gan C giohang
			
			// them c
			System.out.println(Long.parseLong(sl));
			g.Them1(mh,th,tg, Long.parseLong(gia),Long.parseLong(sl));
			
			session.setAttribute("gh", g);
			
			RequestDispatcher rd = request.getRequestDispatcher("/GioHangController");
			
			
			rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
