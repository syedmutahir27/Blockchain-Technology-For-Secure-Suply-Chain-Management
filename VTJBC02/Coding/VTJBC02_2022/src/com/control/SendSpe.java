package com.control;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bean.SentBean;
import com.bean.SpecBean;
import com.dao.Dao;
import com.dao.PortNumber;
import com.dao.Test;

/**
 * Servlet implementation class SendSpe
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/SendSpe")
public class SendSpe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendSpe() {
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
		String type = request.getParameter("type");
		Part img = request.getPart("spe");
		InputStream fi1 = null, fi2 = null;
		if(img != null){
			fi1 = img.getInputStream();
			fi2 = img.getInputStream();
		}
		String text = "";
		int c = 0;
		while((c = fi1.read()) != -1){
			text = text + (char) c;
		}
		String content = img.getContentType();
		String key = PortNumber.getKeys();
		String fi = Test.encryption(text, key);
		String fid = PortNumber.getFid();
		String pid = PortNumber.getPid();
		SpecBean spb = new SpecBean();
		spb.setFid(fid);
		spb.setUid(uid);
		spb.setOid(oid);
		spb.setType(type);
		spb.setFi(fi);
		spb.setKey(key);
		spb.setPid(pid);
		SentBean sb = new SentBean();
		sb.setFid(fid);
		sb.setFi(fi2);
		sb.setContent(content);
		String sql = "insert into spec values(?,?,?,?,?,?,?)";
		int i = Dao.sendSpec(sql, spb);
		sql = "insert into ospec values(?,?,?)";
		int j = Dao.sendOSpec(sql, sb);
		if(i > 0 && j > 0){
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Specifications Sent to OEM Successfully...');");
			o.println("window.location='dspe.jsp';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Specifications not Sent to OEM');");
			o.println("window.location='dspe.jsp';</script>");
		}
	}

}
