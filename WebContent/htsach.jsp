<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.sachbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>


<%//if(session.getAttribute("un") == null) response.sendRedirect("formlogin.jsp"); %>
<%
	String un = request.getParameter("txtun");
	session.setAttribute("un", un);

%>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="t1.jsp">Hiển Thị sách</a></li>
      <li><a href="htgio.jsp">Giỏ hàng</a></li>
      <li><a><%=session.getAttribute("un") %></a></li>
     
      <li><a href="#">Dang xuat</a></li>
    </ul>
  </div>
 
</nav>
<%
	if(session.getAttribute("un") != null){
	 	String user = (String)session.getAttribute("un");
	 	
	}
 %>



	<table align="center" width="800px">
		<tr>
		<%
		sachbo s = new sachbo();
		loaibo lb = new loaibo();
		ArrayList<sachbean> ds= (ArrayList<sachbean>)request.getAttribute("dssach");
		ArrayList<loaibean> dsloai= (ArrayList<loaibean>)request.getAttribute("dsloai");
		%>
		<td>
		<%
		int sizeLoai = dsloai.size();
		for(int i = 0 ; i < sizeLoai ; i++){
			loaibean loai = dsloai.get(i);
		%>
			
				<ul>
					
					<li>	<a href="#?maloai=<%= loai.getMaloai()%>"> <%=loai.getTenloai() %></a> </li>
					
				</ul>
			
			
		
		<% } %>
		</td>
		<% 
		int ss = ds.size();
		for(int i = 0 ; i < ss ; i++){
			sachbean sach = ds.get(i);
			%>
		
			<td>
			<img alt="" src="<%=sach.getAnh()%>"> <br>
			<%= sach.getTensach() %><br>
			<%= sach.getTaciga() %>
			<a href="htgio.jsp?mh=<%=sach.getMasach() %>&th=<%=sach.getTensach() %>&tg=<%=sach.getTaciga()%>&gia=<%=sach.getGia() %>"><img alt="" src="buynow.jpg"></a>
			
			</td>
			<%i++;
			if(i < ss) {
				sach = ds.get(i); %>
				<td>
					<img alt="" src="<%=sach.getAnh()%>"> <br>
					<%= sach.getTensach() %><br>
					<%= sach.getGia() %>
				<a href='htgio.jsp?mh=<%=sach.getMasach() %>&th=<%=sach.getTensach() %>&tg=<%=sach.getTaciga()%>&gia=<%=sach.getGia() %>'><img alt="" src="buynow.jpg"></a>
			
			</td>
			<%} %>
			
			
		
			
			
		<%} %>
		
		</tr>
	</table>

	
	
</body>
</html>