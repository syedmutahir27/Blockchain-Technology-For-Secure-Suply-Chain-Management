package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ManagementBean;
import com.dao.Dao;

/**
 * Servlet implementation class MReg
 */
@WebServlet("/MReg")
public class MReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MReg() {
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
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String mob = request.getParameter("mob");
		String loc = request.getParameter("loc");
		ManagementBean mb = new ManagementBean();
		mb.setUid(uid);
		mb.setName(name);
		mb.setEmail(email);
		mb.setPwd(pwd);
		mb.setMob(mob);
		mb.setLoc(loc);
		String sql = "insert into management values(?,?,?,?,?,?)";
		int i = Dao.setManagement(sql, mb);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Management Register Successfully...');");
			o.println("window.location='management.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='mreg.jsp';</script>");
		}
	}

}
