<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.*"%>
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
	//	giohangbo g = null;
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
                
        	
        	<form action="SearchController"  class="form-inline my-2 my-lg-0" style="margin-left: 400px;" >
        		<input type="text" name="txtsearch">
        		<button> Search</button>
        	</form>
        
        
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
                            <div class="carousel-inner slider-images">
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
                    <h3 style="Text-align:Center; color:red"> SÁCH MỚI </h3>
                    <div class="row">
                    <% 
						int ss = ds.size();
						for(int i = 0 ; i < ss ; i++){
							sachbean sach = ds.get(i);
							
					%>
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail">
                                <a href="/BookStore/Details/16">
                                    <img alt="Thủ Thuật Lập Tr&#236;nh Visual Basic 6 " src="<%=sach.getAnh() %>" width="200" />
                                    <div>
                                        <br />
                                        <h4 style="text-align:center">
                                            <%=sach.getTensach() %>
                                        </h4>
                                        <p></p>
                                    </div>
                                    <div class="ratings">
                                        <p class="pull-right"><a href='GioHangController?mh=<%=sach.getMasach() %>&th=<%=sach.getTensach() %>&tg=<%=sach.getTaciga()%>&gia=<%=sach.getGia() %>&anh=<%=sach.getAnh() %>'><img alt="" src="buynow.jpg"></a></p>
                                        <p>
                                           Giá: <%=sach.getGia() %>
                                           
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </div>
                      <%} %>         

                    Trang 1/3;
                    <div class="MenuTrang">

                        <div class="pagination-container"><ul class="pagination"><li class="active"><a>1</a></li><li><a href="/BookStore?page=2">2</a></li><li><a href="/BookStore?page=3">3</a></li><li class="PagedList-skipToNext"><a href="/BookStore?page=2" rel="next">»</a></li></ul></div>
                    </div>
                    <style>
                        .MenuTrang li {
                            display: inline;
                        }
                    </style>
                </div>

            </div>
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