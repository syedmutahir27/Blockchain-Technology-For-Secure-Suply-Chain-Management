<!DOCTYPE HTML>
<%@page import="com.dao.PortNumber"%>
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
				<div class="logo"><a href="mmhome.jsp">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="mmhome.jsp">Home</a></li>
					<li><a href="mmember.jsp">Members</a></li>
					<li><a href="mmpro.jsp">Products</a></li>
					<li><a href="mmstatus.jsp">Production</a></li>
					<li><a href="mmrepair.jsp">Repairs</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="images/slide04.jpg"  alt="" />
					<div class="inner">
						<header>
						<%
						session = request.getSession(false);
						String uid = PortNumber.getUid("mper");
						%>
							<h2 style="font-size: 5rem;">Add Member</h2>
							<form action="AddMem" method="post">
							<table>
							<tr><td>UserId</td><td><input type="text" name="uid"></td></tr>
							<tr><td>Name</td><td><input type="text" name="name"></td></tr>
							<tr><td>Email</td><td><input type="text" name="email"></td></tr>
							<tr><td>Password</td><td><input type="password" name="pwd"></td></tr>
							<tr><td>Mobile</td><td><input type="text" name="mob"></td></tr>
							<tr><td>Department</td><td><input type="text" name="dep" value="fabrication, electrical work, fitting, It/firmware, Checkup"></td></tr>
							<tr><td><input type="submit" value="Add Member"></td></tr>
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