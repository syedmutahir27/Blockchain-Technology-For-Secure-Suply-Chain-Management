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
				<div class="logo"><a href="ophome.jsp">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="ophome.jsp">Home</a></li>
					<li><a href="ospec.jsp">Specifications</a></li>
					<li><a href="ostatus.jsp">Status</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="images/slide02.jpg" alt="" />
					<div class="inner">
						<header>
						<%
						session = request.getSession(false);
						String oid = (String) session.getAttribute("uid");
						%>
							<h2 style="font-size: 5rem;">Specifications Status</h2>
							<table>
							<tr><th style="color: white;">UserID</th><th style="color: white;">OEMID</th>
							<th style="color: white;">Type</th><th style="color: white;">Date</th>
							<th style="color: white;">Status</th></tr>
							<%
							String sql = "Select * from req where oemid='"+oid+"'";
							List<String> lt = Dao.getOPSpec(sql);
							Iterator<String> itr = lt.iterator();
							while(itr.hasNext()){
							%>
							<tr><td><%=itr.next() %></td><td><%=oid %></td>
							<td><%=itr.next() %></td><td><%=itr.next() %></td>
							<td><%=itr.next() %></td></tr>
							<%} %>
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