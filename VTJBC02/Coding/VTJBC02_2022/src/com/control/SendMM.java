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

import com.bean.MSentBean;
import com.dao.Dao;

/**
 * Servlet implementation class SendMM
 */
@WebServlet("/SendMM")
public class SendMM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMM() {
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
		String oid = request.getParameter("oid");
		String pid = request.getParameter("pid");
		Date d = new Date();
		String da = "" + d;
		MSentBean mb = new MSentBean();
		mb.setUid(uid);
		mb.setOid(oid);
		mb.setPid(pid);
		mb.setDa(da);
		String sql = "insert into dmm values(?,?,?,?,?)";
		int i = Dao.sendDMM(sql, mb);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Equipment Sent to Manufaturing Manager Successfully...');");
			o.println("window.location='dver.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Equipment not Sent');");
			o.println("window.location='dver.jsp';</script>");
		}
	}

}
