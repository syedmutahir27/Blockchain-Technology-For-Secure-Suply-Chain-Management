package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.MROBean;
import com.dao.Dao;

/**
 * Servlet implementation class AddMRO
 */
@WebServlet("/AddMRO")
public class AddMRO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMRO() {
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
		String dom = request.getParameter("dom");
		String mob = request.getParameter("mob");
		MROBean mb = new MROBean();
		mb.setUid(uid);
		mb.setName(name);
		mb.setEmail(email);
		mb.setPwd(pwd);
		mb.setDom(dom);
		mb.setMob(mob);
		mb.setCid(cid);
		String sql = "insert into mro values(?,?,?,?,?,?,?)";
		int i = Dao.addMRO(sql, mb);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('MRO Added Successfully...');");
			o.println("window.location='mmro.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='addmro.jsp';</script>");
		}
	}

}
