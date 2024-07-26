package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.OEMBean;
import com.dao.Dao;

/**
 * Servlet implementation class OEMReg
 */
@WebServlet("/OEMReg")
public class OEMReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OEMReg() {
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
		String pro = request.getParameter("pro");
		String loc = request.getParameter("loc");
		OEMBean ob = new OEMBean();
		ob.setUid(uid);
		ob.setName(name);
		ob.setEmail(email);
		ob.setPwd(pwd);
		ob.setMob(mob);
		ob.setPro(pro);
		ob.setLoc(loc);
		String sql = "insert into oem values(?,?,?,?,?,?,?)";
		int i = Dao.setOEM(sql, ob);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('OEM Register Successfully...');");
			o.println("window.location='oem.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='oemreg.jsp';</script>");
		}
	}
}
