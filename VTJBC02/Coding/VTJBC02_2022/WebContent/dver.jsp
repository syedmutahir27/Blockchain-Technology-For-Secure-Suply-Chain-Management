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
						%>
							<h2 style="font-size: 6rem;">Verify Products</h2>
							<table>
							<tr><th style="color: white;">OEMID</th><th style="color: white;">Type</th>
							<th style="color: white;">ProductID</th><th style="color: white;">Approve</th>
							<th style="color: white;">Reject</th></tr>
							<%
							String sql = "select * from req where UserId='"+session.getAttribute("uid")+"' and status1='pending'";
							List<String> lt = Dao.getSVerify(sql);
							Iterator<String> itr = lt.iterator();
							while(itr.hasNext()){
							%>
							<tr><td><%=itr.next() %></td><td><%=itr.next() %></td>
							<%String pid = itr.next();
							String da = itr.next(); %>
							<td><%=pid %>
							</td><td><a href="DApprove?pid=<%=pid%>&&da=<%=da%>" class="button small">Approve</a></td>
							<td><a href="DReject?pid=<%=pid%>&&da=<%=da%>" class="button small">Reject</a></td></tr>
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