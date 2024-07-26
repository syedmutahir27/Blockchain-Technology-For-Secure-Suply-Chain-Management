package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.OrderBean;
import com.dao.Dao;
import com.dao.PortNumber;

/**
 * Servlet implementation class SendOrder
 */
@WebServlet("/SendOrder")
public class SendOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendOrder() {
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
		String del = (String) session.getAttribute("uid");
		String oid = PortNumber.getFid();
		String mod = request.getParameter("mod");
		int tot = Integer.parseInt(request.getParameter("tot"));
		String rda = request.getParameter("rda");
		String mgt = request.getParameter("mgt");
		OrderBean od = new OrderBean();
		od.setOid(oid);
		od.setDel(del);
		od.setMod(mod);
		od.setTot(tot);
		od.setRda(rda);
		od.setMgt(mgt);
		String sql = "insert into orders(oid,dealer,model,tot,rdate,mid,status1) values(?,?,?,?,?,?,?)";
		int i = Dao.sendOrder(sql, od);
		if(i > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Order Details Sent Successfully...');");
			o.println("window.location='dorder.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Order Details not Sent');");
			o.println("window.location='dorder.jsp';</script>");
		}
	}

}
