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

import com.bean.MUpdateBean;
import com.dao.Dao;

/**
 * Servlet implementation class MemUpdate
 */
@WebServlet("/MemUpdate")
public class MemUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter o = response.getWriter();
		HttpSession session = request.getSession(false);
		String uid = (String) session.getAttribute("uid");
		String dep = (String) session.getAttribute("dep");
		String pid = request.getParameter("pid");
		String sql = "select cid from mem where userid='"
				+ session.getAttribute("uid") + "'";
		String mid = Dao.getName(sql);
		String status = "", db = "";
		if (dep.equalsIgnoreCase("fabrication")) {
			db = "fab";
			status = "Fabrication Completed";
		} else if (dep.equalsIgnoreCase("electrical work")) {
			db = "ew";
			status = "Electrical Work Completed";
		} else if (dep.equalsIgnoreCase("it/firmware")) {
			db = "fw";
			status = "IT/ Firmware Completed";
		} else if (dep.equalsIgnoreCase("fitting")) {
			db = "fit";
			status = "Fitting Completed";
		} else if (dep.equalsIgnoreCase("check up")) {
			db = "checkup";
			status = "Regularity Check Up Completed";
		}
		sql = "select * from " + db + " where pid='" + pid + "'";
		if (Dao.getLogin(sql) == true) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Work Update Already from " + dep+"');");
			o.println("window.location='mempro.jsp';</script>");
		} else {
			Date d = new Date();
			String da = "" + d;
			MUpdateBean mb = new MUpdateBean();
			mb.setPid(pid);
			mb.setUid(uid);
			mb.setMid(mid);
			mb.setStatus(status);
			mb.setDa(da);
			sql = "insert into " + db + " values(?,?,?,?,?)";
			int i = Dao.sendUpdates(sql, mb);
			if (i > 0) {
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Work Updated Successfully from " + dep
						+ "...');");
				o.println("window.location='mempro.jsp';</script>");
			} else {
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Work not update');");
				o.println("window.location='mempro.jsp';</script>");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
