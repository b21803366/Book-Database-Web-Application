<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="database.CategoryDAO" import="model.Category" import="model.User"%>
<!DOCTYPE html>

<%
	User currentUser = (User)session.getAttribute("currentSessionUser");
	if(currentUser == null)
		response.sendRedirect("../Index.jsp");
	else if(!currentUser.isValid() || currentUser.isAdmin())
		response.sendRedirect("../Index.jsp");
%>
<html>
<title>Categories</title>
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
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 80%;
  height: 80px;
  border-radius: 5px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}
</style>
<body>
	<div class="navbar">
		<a href="../logout"><i class="fa fa-fw fa-sign-out"></i> Sign Out</a>
		<a href="Search.jsp"><i class="fa fa-fw fa-search"></i> Search</a>
		<a class="active" href="Categories.jsp"><i class="fa fa-fw fa-list"></i> Categories</a>
		<a href="Homepage.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
	</div>
	<div class="booklist">
		<%
			ArrayList<Category> categories = CategoryDAO.getAllCategories();
			for(int i=0; i<categories.size();)
			{
				out.print("<div class=\"row\">");
				for(int j=0; j<5 && i<categories.size(); j++, i++)
				{
					out.print("<div class=\"column\">"
							+ 	"<div id=\""+categories.get(i).getTitle()+"\" onclick=\"link(this.id)\" class=\"card\" href=\"#\">"
							+ 		"<h1>"+categories.get(i).getTitle()+"</h1>"
							+ 	"</div>"
							+ "</div>");
				}
				out.print("</div>");
			}
		%>
	</div>
</body>
<script>
	function link(id)
	{
		location.href = "Subcategories.jsp?id="+id;
	}
</script>
</html>
