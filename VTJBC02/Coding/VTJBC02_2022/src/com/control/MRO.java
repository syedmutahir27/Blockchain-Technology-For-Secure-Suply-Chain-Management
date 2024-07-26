package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;

/**
 * Servlet implementation class MRO
 */
@WebServlet("/MRO")
public class MRO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MRO() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter o = response.getWriter();
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();
		String sql = "select * from mro where userid='"+uid+"' and password='"+pwd+"'";
		if(Dao.getLogin(sql)){
			session.setAttribute("uid", uid);
			sql = "select name from mro where userid='"+uid+"'";
			String name = Dao.getName(sql);
			session.setAttribute("name", name);
			sql = "select domain from mro where userid='"+uid+"'";
			String dom = Dao.getName(sql);
			session.setAttribute("dom", dom);
			response.sendRedirect("mrohome.jsp");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='mro.jsp';</script>");
		}
	}

}
