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
		<link rel="stylesheet" href="assets/f.css" />
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
						<form action="SendSpe" method="post" enctype="multipart/form-data">
							<h2>Send Specifications</h2>
							<table>
							<tr><th style="color: white;">OEM ID</th><th style="color: white;">Type</th>
							<th style="color: white;">Specifications</th><th style="color: white;">Send</th></tr>
							<tr><td><select name="oid">
							<option value="non">------Select------</option>
							<%
							String sql = "select userid from oemperson";
							List<String> lt = Dao.getOId(sql);
							Iterator<String> itr = lt.iterator();
							while(itr.hasNext()){
								String oid= itr.next();
							%>
							<option value="<%=oid%>"  style="color: black;"><%=oid %></option>
							<%} %>
							</select></td>
							<td><input type="text" name="type"></td>
							<td><input type="file" name="spe"></td>
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