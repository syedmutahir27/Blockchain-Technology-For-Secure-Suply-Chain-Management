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
				<div class="logo"><a href="oemhome.jsp">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="oemhome.jsp">Home</a></li>
					<li><a href="oemperson.jsp">OEM Person</a></li>
					<li><a href="oemspec.jsp">Specifications</a></li>
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
						%>
							<h2 style="font-size: 5rem;">OEM Persons</h2>
							<table>
							<tr><th style="color: white;">UserID</th><th style="color: white;">Name</th>
							<th style="color: white;">Email</th><th style="color: white;">Mobile</th>
							<th style="color: white;">Zone</th></tr>
							<%
							String sql = "select * from oemperson where cid='"+session.getAttribute("uid")+"'";
							List<String> lt = Dao.getOPerson(sql);
							Iterator<String> itr = lt.iterator();
							while(itr.hasNext()){
							%>
							<tr><td><%=itr.next() %></td><td><%=itr.next() %></td>
							<td><%=itr.next() %></td><td><%=itr.next() %></td>
							<td><%=itr.next() %></td></tr>
							<%} %>
							</table>
							<a href="addoperson.jsp">Add Person</a>
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