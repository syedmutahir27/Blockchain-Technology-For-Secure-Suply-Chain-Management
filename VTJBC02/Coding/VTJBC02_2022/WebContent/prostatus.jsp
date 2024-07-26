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
						String pid = request.getParameter("pid");
						%>
							<h2 style="font-size: 5rem;">Manufacturing Status</h2>
							<table>
							<tr><th style="color: white;">UID</th><th style="color: white;">MID</th>
							<th style="color: white;">Status</th><th style="color: white;">Date</th></tr>
							<%
							String arr[] = {"fab", "ew", "fw", "fit", "checkup"};
							int k = 0;
							String s = "";
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
   								<div class="w3-container w3-blue w3-round-xlarge" style="width:<%=k%>%"><%=s %></div>
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