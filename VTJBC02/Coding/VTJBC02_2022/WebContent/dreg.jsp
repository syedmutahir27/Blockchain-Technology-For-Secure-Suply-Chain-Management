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
				<div class="logo"><a href="index.html">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="management.jsp">Management</a></li>
					<li><a href="oem.jsp">OEM</a></li>
					<li><a href="operson.jsp">OEM Person</a></li>
					<li><a href="de.jsp">Design Engineer</a></li>
					<li><a href="mm.jsp">Manufacturing Manager</a></li>
					<li><a href="mmperson.jsp">MM Person</a></li>
					<li><a href="mro.jsp">MRO</a></li>
					<li><a href="dealer.jsp">Dealer</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="images/slide01.jpg" alt="" />
					<div class="inner">
						<header>
							<h2 style="font-size: 5rem;">Dealer Registration</h2>
							<%
							String uid = PortNumber.getUid("dl");
							%>
							<form action="DReg" method="post">
							<table>
							<tr><td>UserId</td><td><input type="text" name="uid"></td></tr>
							<tr><td>Name</td><td><input type="text" name="name"></td></tr>
							<tr><td>Email</td><td><input type="text" name="email"></td></tr>
							<tr><td>Password</td><td><input type="password" name="pwd"></td></tr>
							<tr><td>Mobile</td><td><input type="text" name="mob"></td></tr>
							<tr><td>Location</td><td><input type="text" name="loc"></td></tr>
							<tr><td>State</td><td><input type="text" name="state"></td></tr>
							<tr><td><input type="submit" value="Register"></td></tr>
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