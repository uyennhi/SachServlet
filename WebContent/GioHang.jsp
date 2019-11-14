<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width" />
    <title>Index</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Shop Homepage - Start Bootstrap Template</title>
    <!-- Bootstrap Core CSS -->
    <link href="Content/bootstrap.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="Content/shop-homepage.css" rel="stylesheet" />


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<%
		sachbo s = new sachbo();
		loaibo lb = new loaibo();
		int soluong = 0;
		ArrayList<sachbean> ds;
		ArrayList<loaibean> dsloai= (ArrayList<loaibean>)request.getAttribute("dsloai");
		if(request.getParameter("maloai") == null && request.getParameter("txtsearch") == null){
			ds= (ArrayList<sachbean>)request.getAttribute("dssach");
		}else if(request.getParameter("txtsearch") == null){
			ds= (ArrayList<sachbean>)request.getAttribute("dstheoloai");
		}else{
			ds = (ArrayList<sachbean>)request.getAttribute("dstheoten");
		}
		
		//giohangbo g = (giohangbo)session.getAttribute("gh");
		if(session.getAttribute("gh") != null){
			giohangbo g = (giohangbo)session.getAttribute("gh");
			soluong = g.ds.size();
		}
		%>
		
		
	   <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Start Bootstrap</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/BookStore">TRANG CHỦ</a>
                    </li>
                    <li>
                        <a href="/Nguoidung/Dangky">ĐĂNG K&#221;</a>
                    </li>
                    <li>
                        <a href="/Nguoidung/Dangnhap">ĐĂNG NHẬP</a>
                    </li>
                    <li>
                        <a href="GioHangController" style="color: white; font-weight: bold; text-decoration: none;">
                            <img src="images/giohang.gif" />Giỏ Hàng (<%=soluong %>)
                        </a>

                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-3">

                <p class="lead"> CHỦ ĐỀ SÁCH</p>
                <div class="list-group">
                	<%
						int sizeLoai = dsloai.size();
						for(int i = 0 ; i < sizeLoai ; i++){
							loaibean loai = dsloai.get(i);
					%>
                    <a href="getAllFromID?maloai=<%=loai.getMaloai() %>" class="list-group-item">
                        <%=loai.getTenloai() %>
                    </a>
                   <% } %>
                </div>

		<%  if(session.getAttribute("gh")!=null){ 
					giohangbo g = (giohangbo)session.getAttribute("gh");
				 	int nsize = g.ds.size(); 
			%>
               




            </div>
            <div class="col-md-9">
                <div class="row carousel-holder">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="images/ancient-place.jpg" alt="">

                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/riverside-city.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="images/kayaks.jpg" alt="">
                                </div>


                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>

			 <div>
			

                    <h2 style="text-align:center">THÔNG TIN GIỎ HÀNG</h2>
                    <table align="center" border="1">
                        <tbody>
                            <tr style="text-align:center; font-weight:bold">
                                <td>  Mã sách </td>
                                <td> Tên sách </td>
                                <td> Ảnh bìa </td>
                                <td> Số lượng </td>
                                <td> Đơn giá </td>
                                <td> Thành tiền </td>
                                <td width="50px"></td>
                                <td width="50px"></td>
                                <td width="50px"></td>
                            </tr>
                            <%for(int i = 0 ; i < nsize ; i++) {%>
                            <tr style="text-align:center; font-weight:bold">
                                <td> <%=g.ds.get(i).getMasach() %> </td>
                                <td> <%= g.ds.get(i).getTensach() %></td>
                                <td><img src="Hinhsanpham/TiengAnh01.jpg"></td>
                                <form action="CapNhatController?mh=<%=g.ds.get(i).getMasach() %>&th=<%=g.ds.get(i).getTensach() %>&tg=<%=g.ds.get(i).getTacgia()%>&gia=<%=g.ds.get(i).getGia() %>" method="get">
                                <td>
                                    <input type="number"  name="txtSoluong" value="<%=g.ds.get(i).getSoluong() %>" style="background-color:yellow">
                                </td>
                                <td><%= g.ds.get(i).getGia() %> </td>
                                <td><%= g.ds.get(i).getThanhtien() %> </td>
                                <td> <a href="#"> Chi tiết </a></td>
                                <td> <a href="XoaController?idds=<%= i%>">Xóa</a></td>
                                <td> <input type="submit" value="Cập Nhật"></td>
                                </form>
                            </tr>
                           <% } %>
                            <tr style="font-weight: bold; text-align:right; color:red">
                                <td colspan="4"> Số lượng sách: <%=g.ds.size() %> </td>
                                <td colspan="5"> Tổng tiền: <%=g.tong()   %> </td>
                            </tr>
                            <tr style="font-weight: bold; color:blue; text-align:right ">
                                <td colspan="9">
                                    <a href="XoaAllController">Xóa Giỏ Hàng</a>
                                </td>
                            </tr>
                            <tr style="font-weight: bold; color:blue; text-align:right ">
                                <td colspan="9" align="center">
                                    <a href="sachcontroller">ĐẶT HÀNG</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
			<%} %>
                
        </div>
    </div>
    <!-- /.container -->
    <div class="container">
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; MVC 5</p>
                </div>
            </div>
        </footer>
    </div>
    <!-- /.container -->
    <!-- jQuery -->
    <script src="/Scripts/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Scripts/bootstrap.min.js"></script>
</body>
</html>