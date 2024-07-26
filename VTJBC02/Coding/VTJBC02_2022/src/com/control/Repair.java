package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.RepairBean;
import com.dao.Dao;

/**
 * Servlet implementation class Repair
 */
@WebServlet("/Repair")
public class Repair extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Repair() {
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
		String uid = (String) session.getAttribute("uid");
		String dep = (String) session.getAttribute("dep");
		String sql = "select cid from mem where userid='"+uid+"'";
		String c = Dao.getName(sql);
		sql = "select cid from mm where userid='"+c+"'";
		String cid = Dao.getName(sql);
		String iss = request.getParameter("iss");
		Date d = new Date();
		String da = "" + d;
		RepairBean rb = new RepairBean();
		rb.setUid(uid);
		rb.setCid(cid);
		rb.setIss(iss);
		rb.setDa(da);
		rb.setDep(dep);
		sql = "insert into issue(id, userid, cid, issue, status1, date1, domain) values(0,?,?,?,?,?,?)";
		int i = Dao.sendRepair(sql, rb);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Repair Details Sent Successfully...');");
			o.println("window.location='memrepair.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Repair Details not Sent');");
			o.println("window.location='memrepair.jsp';</script>");
		}
	}

}
