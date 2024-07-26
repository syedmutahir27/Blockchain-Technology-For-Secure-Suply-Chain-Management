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
						%>
							<h2>Specifications</h2>
							<table>
							<tr><th style="color: white;">OEMId</th><th style="color: white;">UserId</th>
							<th style="color: white;">Type</th><th style="color: white;">Download</th>
							<th style="color: white;">Update</th></tr>
							<%
							String sql = "select * from spec where oemid='"+session.getAttribute("uid")+"'";
								List<String> lt1 = Dao.getOSpec(sql);
								Iterator<String> itr1 = lt1.iterator();
								while(itr1.hasNext()){
									String fid = itr1.next();
									String uid = itr1.next();
							%>
							<tr><td><%=session.getAttribute("uid") %></td><td><%=uid %></td>
							<td><%=itr1.next() %></td><td><a href="ODownload?fid=<%=fid%>" class="button small">Download</a></td>
							<td><a href="SpecUpdate?fid=<%=fid%>" class="button small">Update</a></td></tr>
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