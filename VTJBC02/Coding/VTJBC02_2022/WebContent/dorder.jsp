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
				<div class="logo"><a href="dhome.jsp">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="dhome.jsp">Home</a></li>
					<li><a href="dorder.jsp">Send Order</a></li>
					<li><a href="dtran.jsp">Received Order</a></li>
					<li><a href="dtrans.jsp">Order Details</a></li>
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
							<h2>Make Order</h2>
							<form action="SendOrder" method="post">
							<table>
							<tr><td>Model</td><td><input type="text" name="mod"></td></tr>
							<tr><td>Total</td><td><input type="text" name="tot"></td></tr>
							<tr><td>Req Date</td><td><input type="text" name="rda"></td></tr>
							<tr><td>Management</td><td>
							<select name="mgt">
							<option value="non">-----Select-----</option>
							<%
							String sql = "select userid from management";
							List<String> lt = Dao.getOId(sql);
							Iterator<String> itr = lt.iterator();
							while(itr.hasNext()){
								String mgt = itr.next();
							%>
							<option value="<%=mgt%>" style="color: black;"><%=mgt %></option>
							<%} %>
							</select></td></tr>
							<tr><td><input type="submit" value="Send"></td></tr>
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