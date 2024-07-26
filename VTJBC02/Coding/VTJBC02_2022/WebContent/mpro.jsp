<!DOCTYPE HTML>
<%@page import="com.dao.PortNumber"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.dao.Dao"%>
<%@page import="java.util.Set"%>
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
						%>
							<h2 style="font-size: 5rem;">Production Vs Sale</h2>
							<%
								Gson gsonObj = new Gson();
								Map<Object,Object> map = null;
								String sql = "select models from mm where cid='"+session.getAttribute("uid")+"'";
								Set<String> st = Dao.getModels(sql);
								Iterator<String> itr = st.iterator();
								List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
								while(itr.hasNext()){
									String mod = itr.next();
									sql = "select userid from mm where cid='"+session.getAttribute("uid")+"' and models='"+mod+"'";
									String mm = Dao.getName(sql);
									sql = "select pid from dmm where mid='"+mm+"'";
									List<String> lt = Dao.getOId(sql);
									Iterator<String> tr = lt.iterator();
									int count = 0;
									while(tr.hasNext()){
										String pid = tr.next();
										count = PortNumber.getCount(pid, mm);
									}
									map = new HashMap<Object,Object>(); map.put("label", mod); map.put("y", count); list.add(map);
								}
								String dataPoints1 = gsonObj.toJson(list);
								sql = "select model from orders where mid='"+session.getAttribute("uid")+"'";
								Set<String> st1 = Dao.getModels(sql);
								Iterator<String> itr1 = st1.iterator();
								list = new ArrayList<Map<Object,Object>>();
								while(itr1.hasNext()){
									String mod = itr1.next();
									sql = "select sum(tot) from orders where model='"+mod+"' and mid='"+session.getAttribute("uid")+"' and status1!='pending'";
									int c = Dao.getCount(sql);
									map = new HashMap<Object,Object>(); map.put("label", mod); map.put("y", c); list.add(map);
								}
								String dataPoints2 = gsonObj.toJson(list);
							%>
 
							<script type="text/javascript">
								window.onload = function() { 
								 
									var chart = new CanvasJS.Chart("chartContainer", {
										title: {
											text: "Production Vs Sale"
										},
										axisY: {
											includeZero: false,
											title: "Total Products"
										},
										legend: {
											verticalAlign: "top"
										},
										toolTip: {
											shared: true
										},
										data: [{
											type: "stackedBar",
											name: "Manufactured",
											showInLegend: true,
											dataPoints: <%out.print(dataPoints1);%>
										},
										{
											type: "stackedBar",
											name: "Sold",
											showInLegend: true,
											dataPoints: <%out.print(dataPoints2);%>
										}]
									});
									chart.render();
	 
								}
							</script>
							<div id="chartContainer" style="height: 370px; width: 100%;"></div>
							<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
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