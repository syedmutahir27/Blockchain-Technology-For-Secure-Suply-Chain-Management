<!DOCTYPE HTML>
<%@page import="com.dao.PortNumber"%>
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
						String uid = PortNumber.getUid("mro");
						%>
							<h2 style="font-size: 5rem;">Add MRO</h2>
							<form action="AddMRO" method="post">
							<table>
							<tr><td>UserId</td><td><input type="text" name="uid"></td></tr>
							<tr><td>Name</td><td><input type="text" name="name"></td></tr>
							<tr><td>Email</td><td><input type="text" name="email"></td></tr>
							<tr><td>Password</td><td><input type="password" name="pwd"></td></tr>
							<tr><td>Domain</td><td><input type="text" name="dom"></td></tr>
							<tr><td>Mobile</td><td><input type="text" name="mob"></td></tr>
							<tr><td><input type="submit" value="Add MRO"></td></tr>
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