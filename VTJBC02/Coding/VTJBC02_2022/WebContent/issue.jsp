<!DOCTYPE HTML>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
				<div class="logo"><a href="mrohome.jsp">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="mrohome.jsp">Home</a></li>
					<li><a href="issue.jsp">Repair</a></li>
					<li><a href="pissue.jsp">History</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="images/slide05.jpg"  alt="" />
					<div class="inner">
						<header>
						<%
						session = request.getSession(false);
						String dom = (String) session.getAttribute("dom");
						String sql = "select cid from mro where userid='"+session.getAttribute("uid")+"'";
						String cid = Dao.getName(sql);
						%>
							<h2>Issues</h2>
							<table>
							<tr><th style="color: white;">UserId</th><th style="color: white;">Issue</th>
							<th style="color: white;">Date</th><th style="color: white;">Update</th></tr>
							<%
							sql = "select * from issue where domain='"+dom+"' and cid='"+cid+"' and status1='pending'";
							System.out.println(sql);
							List<String> lt = Dao.getIssue(sql);
							Iterator<String> itr = lt.iterator();
							while(itr.hasNext()){
								String id = itr.next();
							%>
							<tr><td><%=id %></td><td><%=itr.next() %></td>
							<td><%=itr.next() %></td>
							<td><a href="Issue?id=<%=id%>" class="button small">Update</a></td></tr>
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