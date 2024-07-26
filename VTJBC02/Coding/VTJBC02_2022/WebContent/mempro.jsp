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
				<div class="logo"><a href="memhome.jsp">Supply Chain</a></div>
				<a href="#menu">Menu</a>
			</header>
			<%
						session = request.getSession(false);
						String dep = (String) session.getAttribute("dep");
						%>
		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="memhome.jsp">Home</a></li>
					<li><a href="mempro.jsp?dep=<%=dep%>">Product</a></li>
					<li><a href="memrepair.jsp">Repair</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="images/slide04.jpg"  alt="" />
					<div class="inner">
						<header>
							<h2>Product Details</h2>
							<%
							String db = "";
							if(dep.equalsIgnoreCase("fabrication")){
								db = "dmm";
							}else if(dep.equalsIgnoreCase("electrical work")){
								db = "fab";
							}else if(dep.equalsIgnoreCase("it/firmware")){
								db = "ew";
							}else if(dep.equalsIgnoreCase("fitting")){
								db = "fw";
							}else if(dep.equalsIgnoreCase("check up")){
								db = "fit";
							}
							%>
							<table>
							<tr><td>PID</td><td>MID</td><td>Status</td><td>Date</td><td>Update</td></tr>
							<%
							String sql = "select cid from mem where userid='"+session.getAttribute("uid")+"'";
							String cid = Dao.getName(sql);
							sql = "select * from "+db+" where MID='"+cid+"'";
							List<String> lt = Dao.getPDet(sql);
							Iterator<String> itr = lt.iterator();
							while(itr.hasNext()){
								String pid = itr.next();
							%>
							<tr><td><%=pid %></td><td><%=itr.next() %></td>
							<td><%=itr.next() %></td><td><%=itr.next() %></td>
							<td><a href="MemUpdate?pid=<%=pid%>" class="button small">Update</a></td></tr>
							<%} %>
							</table>
						</header>
					</div>
				</article>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div class="grid-style">

						<div>
							<div class="box">
								<div class="image fit">
									<img src="images/pic02.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<p>maecenas sapien feugiat ex purus</p>
										<h2>Lorem ipsum dolor</h2>
									</header>
									<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
									<footer class="align-center">
										<a href="#" class="button alt">Learn More</a>
									</footer>
								</div>
							</div>
						</div>

						<div>
							<div class="box">
								<div class="image fit">
									<img src="images/pic03.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<p>mattis elementum sapien pretium tellus</p>
										<h2>Vestibulum sit amet</h2>
									</header>
									<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
									<footer class="align-center">
										<a href="#" class="button alt">Learn More</a>
									</footer>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>Nam vel ante sit amet libero scelerisque facilisis eleifend vitae urna</p>
						<h2>Morbi maximus justo</h2>
					</header>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style2">
				<div class="inner">
					<header class="align-center">
						<p class="special">Nam vel ante sit amet libero scelerisque facilisis eleifend vitae urna</p>
						<h2>Morbi maximus justo</h2>
					</header>
					<div class="gallery">
						<div>
							<div class="image fit">
								<a href="#"><img src="images/pic01.jpg" alt="" /></a>
							</div>
						</div>
						<div>
							<div class="image fit">
								<a href="#"><img src="images/pic02.jpg" alt="" /></a>
							</div>
						</div>
						<div>
							<div class="image fit">
								<a href="#"><img src="images/pic03.jpg" alt="" /></a>
							</div>
						</div>
						<div>
							<div class="image fit">
								<a href="#"><img src="images/pic04.jpg" alt="" /></a>
							</div>
						</div>
					</div>
				</div>
			</section>



		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>