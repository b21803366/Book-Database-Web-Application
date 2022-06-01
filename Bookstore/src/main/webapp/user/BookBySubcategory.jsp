<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="database.BookDAO" import="model.Book" import="model.User"
    import= "java.text.*"%>
<!DOCTYPE html>

<%
	User currentUser = (User)session.getAttribute("currentSessionUser");
	if(currentUser == null)
		response.sendRedirect("../Index.jsp");
	else if(!currentUser.isValid() || currentUser.isAdmin())
		response.sendRedirect("../Index.jsp");
	
	String subcategoryName = request.getParameter("id");
	if(subcategoryName == null)
	{
		response.sendRedirect("Categories.jsp");
		return;
	}
%>
<html>
<title>Books By Subcategory</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

.navbar {
	width: 100%;
	background-color: #555;
	overflow: auto;
}

.navbar a {
	float: right;
	padding: 12px;
	color: white;
	text-decoration: none;
	font-size: 17px;
}

.navbar a:hover {
	background-color: #000;
}

.active {
	background-color: #04AA6D;
}

@media screen and (max-width: 500px) {
	.navbar a {
		float: none;
		display: block;
	}
}
/* Float four columns side by side */
.column {
  float: left;
  width: 20%;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 200px;
  margin: auto;
  text-align: center;
  font-family: arial;
  font-size: 8px;
}

.price {
  color: grey;
  font-size: 20px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}

</style>
<body>
	<div class="navbar">
		<a href="../logout"><i class="fa fa-fw fa-sign-out"></i> Sign Out</a>
		<a href="Search.jsp"><i class="fa fa-fw fa-search"></i> Search</a>
		<a href="Categories.jsp"><i class="fa fa-fw fa-list"></i> Categories</a>
		<a href="Homepage.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
	</div>
	<div class="booklist">
		<%
			NumberFormat formatter = new DecimalFormat("0.00");
			ArrayList<Book> books = BookDAO.getBooksBySubcategory(subcategoryName);
			for(int i=0; i<books.size();)
			{
				out.print("<div class=\"row\">");
				for(int j=0; j<5 && i<books.size(); j++, i++)
				{
					out.print("<div class=\"column\">"
							+ 	"<div class=\"card\">"
							+ 		"<img src=\""+books.get(i).getImage_url()+"\" alt=\""+books.get(i).getTitle()+"\" style=\"height:250px\">"
							+ 		"<h1>"+books.get(i).getTitle()+"</h1>"
							+ 		"<p class=\"price\">₺"+formatter.format(books.get(i).getPrice())+"</p>"
							+ 		"<p>"+books.get(i).getSubjects()+"</p>"
							+ 		"<p><button>Add to Cart</button></p>"
							+ 	"</div>"
							+ "</div>");
				}
				out.print("</div>");
			}
		%>
	</div>
</body>
</html>