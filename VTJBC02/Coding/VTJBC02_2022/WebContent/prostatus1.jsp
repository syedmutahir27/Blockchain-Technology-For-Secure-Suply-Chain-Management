<!DOCTYPE HTML>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.dao.Dao"%>
<html>
	<head>
		<title>Supply Chain</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/w3.css" />
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
					<img src="images/slide01.jpg"  alt="" />
					<div class="inner">
						<header>
						<%
						session = request.getSession(false);
						String pid = request.getParameter("pid");
						%>
							<h2>Product Status</h2>
							<table>
							<tr><th style="color: white;">UID</th><th style="color: white;">MID</th>
							<th style="color: white;">Status</th><th style="color: white;">Date</th></tr>
							<%
							int k = 0;
							String s = "";
							String arr[] = {"fab", "ew", "fw", "fit", "checkup"};
							for(int i = 0; i < arr.length; i++){
								String sql = "select * from "+arr[i]+" where pid='"+pid+"'";
								List<String> lt = Dao.proStatus(sql);
								Iterator<String> itr = lt.iterator();
								while(itr.hasNext()){
									k++;
									s = s +arr[i] + "       ";
									String d = itr.next();
							%>
								<tr><td><%=d %></td><td><%=itr.next() %></td>
								<td><%=itr.next() %></td><td><%=itr.next() %></td></tr>
							<%} 
							}
							k = k * 20;
							%>
							</table>
							<div class="w3-light-grey w3-round-xlarge">
   								<div class="w3-container w3-green w3-round-xlarge" style="width:<%=k%>%"><%=s %></div>
   							</div>
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