<!DOCTYPE HTML>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.dao.Dao"%>
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
				<div class="logo"><a href="mhome.jsp">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="mhome.jsp">Home</a></li>
					<li><a href="mde.jsp">Design Engineer</a></li>
					<li><a href="mamm.jsp">Manufacturing Manager</a></li>
					<li><a href="mmro.jsp">MRO</a></li>
					<li><a href="mman.jsp">Manufacturing</a></li>
					<li><a href="morder.jsp">Orders</a>
					<li><a href="mpro.jsp">Production</a>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="images/slide01.jpg" alt="" />
					<div class="inner">
						<header>
						<%
						session = request.getSession(false);
						%>
							<h2>Repair Status</h2>
						<table>
						<tr><th style="color: white;">Issue</th><th style="color: white;">Status</th>
						<th style="color: white;">Date</th><th style="color: white;">MRO</th>
						<th style="color: white;">Solved Date</th></tr>
							<%
							session = request.getSession(false);
							String id = request.getParameter("id");
							String sql = "select * from issue where userid='"+id+"'";						
								List<String> lt = Dao.getRStatus(sql);
								Iterator<String> itr = lt.iterator();
								while(itr.hasNext()){
								%>
								<tr><td><%=itr.next() %></td><td><%=itr.next() %></td>
								<td><%=itr.next() %></td><td><%=itr.next() %></td>
								<td><%=itr.next() %></td></tr>
								<%} 
							%>
							</table>
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