package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.DEBean;
import com.dao.Dao;

/**
 * Servlet implementation class AddDE
 */
@WebServlet("/AddDE")
public class AddDE extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDE() {
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
		HttpSession session = request.getSession(false);
		String cid = (String) session.getAttribute("uid");
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String exp = request.getParameter("exp");
		String mob = request.getParameter("mob");
		DEBean db = new DEBean();
		db.setUid(uid);
		db.setName(name);
		db.setEmail(email);
		db.setPwd(pwd);
		db.setExp(exp);
		db.setMob(mob);
		db.setCid(cid);
		String sql = "insert into de values(?,?,?,?,?,?,?)";
		int i = Dao.addDE(sql, db);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Design Engineer Added Successfully...');");
			o.println("window.location='mde.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='mdeadd.jsp';</script>");
		}
	}

}
