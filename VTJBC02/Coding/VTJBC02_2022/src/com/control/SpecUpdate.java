package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UpdateBean;
import com.dao.Dao;

/**
 * Servlet implementation class SpecUpdate
 */
@WebServlet("/SpecUpdate")
public class SpecUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SpecUpdate() {
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
		String oid = (String) session.getAttribute("uid");
		String fid = request.getParameter("fid");
		String sql = "select * from spec where fid='" + fid + "'";
		List<String> lt = Dao.getSpec(sql);
		Iterator<String> itr = lt.iterator();
		String uid = "", type = "", pid = "";
		while (itr.hasNext()) {
			uid = itr.next();
			type = itr.next();
			pid = itr.next();
		}
		sql = "select * from req where pid='" + pid + "' and oemid='" + oid
				+ "'";
		if (Dao.getLogin(sql) == true) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Equipment Already Sent');");
			o.println("window.location='ospec.jsp';</script>");
		} else {
			Date d = new Date();
			String da = "" + d;
			UpdateBean ub = new UpdateBean();
			ub.setUid(uid);
			ub.setOid(oid);
			ub.setType(type);
			ub.setPid(pid);
			ub.setDa(da);
			sql = "insert into req values(?,?,?,?,?,?)";
			int i = Dao.sendReq(sql, ub);
			if (i > 0) {
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Equipment Sent to Design Engineer Successfully...');");
				o.println("window.location='ospec.jsp';</script>");
			} else {
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Equipment not Sent');");
				o.println("window.location='ospec.jsp';</script>");
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
