package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.DealerBean;
import com.dao.Dao;

/**
 * Servlet implementation class DReg
 */
@WebServlet("/DReg")
public class DReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DReg() {
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
		String state = request.getParameter("state");
		DealerBean db = new DealerBean();
		db.setUid(uid);
		db.setName(name);
		db.setEmail(email);
		db.setPwd(pwd);
		db.setMob(mob);
		db.setMob(mob);
		db.setLoc(loc);
		db.setState(state);
		String sql = "insert into dealer values(?,?,?,?,?,?,?)";
		int i = Dao.setDealer(sql, db);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Dealer Register Successfully...');");
			o.println("window.location='dealer.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='dreg.jsp';</script>");
		}
	}

}
