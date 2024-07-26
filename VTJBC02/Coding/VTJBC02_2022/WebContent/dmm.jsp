<!DOCTYPE HTML>
<%@page import="java.util.Iterator"%>
<%@page import="com.dao.Dao"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<title>Supply Chain</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="dehome.jsp">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="dehome.jsp">Home</a></li>
					<li><a href="dspe.jsp">Specifications</a></li>
					<li><a href="dver.jsp">Verification</a></li>
					<li><a href="ddes.jsp">Designs</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="images/slide03.jpg"  alt="" />
					<div class="inner">
						<header>
						<%
						session = request.getSession(false);
						String pid = request.getParameter("pid");
						String sql = "select cid from de where userid='"+session.getAttribute("uid")+"'";
						String cid = Dao.getName(sql);
						%>
						<form action="SendMM" method="post">
							<h2 style="font-size: 5rem;">Send Specifications</h2>
							<table>
							<tr><th style="color: white;">MM ID</th><th style="color: white;">PID</th>
							<th style="color: white;">Send</th></tr>
							<tr><td><select name="oid">
							<option value="non">------Select------</option>
							<%
							sql = "select userid from mm where cid='"+cid+"'";
							List<String> lt = Dao.getOId(sql);
							Iterator<String> itr = lt.iterator();
							while(itr.hasNext()){
								String oid= itr.next();
							%>
							<option value="<%=oid%>" style="color: black;"><%=oid %></option>
							<%} %>
							</select></td>
							<td><input type="text" name="pid" value="<%=pid %>"></td>
							<td><input type="submit" value="Send"></td></tr>
							</table>
						</form>
						</header>
					</div>
				</article>
			</section>



		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>