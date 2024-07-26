package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.OPersonBean;
import com.dao.Dao;

/**
 * Servlet implementation class AddOP
 */
@WebServlet("/AddOP")
public class AddOP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOP() {
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
		String zone = request.getParameter("zone");
		String mob = request.getParameter("mob");
		OPersonBean pb = new OPersonBean();
		pb.setUid(uid);
		pb.setName(name);
		pb.setEmail(email);
		pb.setPwd(pwd);
		pb.setMob(mob);
		pb.setZone(zone);
		pb.setCid(cid);
		String sql = "insert into oemperson values(?,?,?,?,?,?,?)";
		int i = Dao.addOPerson(sql, pb);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('OEM Person Added Successfully...');");
			o.println("window.location='oemperson.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='addoperson.jsp';</script>");
		}
	}

}
