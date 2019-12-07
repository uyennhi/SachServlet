<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="bean.loaibean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
	if(request.getAttribute("ktnhap") != null){%>
	<script type="text/javascript">alert("Mã bị trùng");</script>
	<% } %>
<% 	if(request.getAttribute("ktxoa") != null){%>
	<script type="text/javascript">alert("Loại có sách không xóa được");</script>
	
	<% } %>
	
	<%loaibean ll = (loaibean)request.getAttribute("chon"); %>


<% 	ArrayList<loaibean> ds= (ArrayList<loaibean>)request.getAttribute("dsloai");%>
<form action="LoaiAdminController" method="post">
	<label> Mã loại</label>
	<input type="text" name="txtmaloai" value="<%= ll!=null? ll.getMaloai():"" %>" class="form_control"> <br>
	<label> Tên  loại</label>
	<input type="text" name="txttenloai" value="<%= ll!=null? ll.getTenloai():"" %>" class="form_control"> <br>
	<input type="submit" name="butthem" value="Thêm" class="btn-primary"> 
	<input type="submit" name="butsua" value="Sửa" class="btn-primary"> 
</form>
<table class="table table-boder table hover">
	<%for(loaibean l: ds){ %>
	<tr>
		<td> <%=l.getMaloai() %></td>
		<td> <%=l.getTenloai() %></td>
		<td>
			<a href="LoaiAdminController?mlchon=<%= l.getMaloai()%>"> Chọn</a>
		
		</td>
		<td>
			<a href="LoaiAdminController?mlxoa=<%= l.getMaloai()%>"> Xóa</a>
		
		</td>
	<tr>
	<%} %>
</table>
	
</body>
</html>