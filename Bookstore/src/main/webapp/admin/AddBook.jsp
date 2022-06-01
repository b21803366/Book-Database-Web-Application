<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.User" import="model.Subcategory" import="database.SubcategoryDAO" 
    import="java.util.ArrayList" import= "java.text.*"%>
<!DOCTYPE html>
<%
	User currentUser = (User)session.getAttribute("currentSessionUser");
	if(currentUser == null)
		response.sendRedirect("../Index.jsp");
	else if(!currentUser.isValid() || !currentUser.isAdmin())
		response.sendRedirect("../Index.jsp");
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.navbar {
	width: 100%;
	background-color: #555;
	overflow: auto;
}

.login_div {
	width: 50%;
	position: fixed;
  	top: 55%;
  	left: 50%;
  	transform: translate(-50%, -50%);
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
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password], input[type=number]{
	width: 100%;
	padding: 8px 20px;
	margin: 4px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #04AA6D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 50%;
	<!-- border-radius: 50%; -->
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>
	<div class="navbar">
		<a href="../logout"><i class="fa fa-fw fa-sign-out"></i> Sign Out</a>
		<a class="active" href="AddBook.jsp"><i class="fa fa-fw fa-plus"></i> Add Book</a>
		<a href="AdminHomepage.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
	</div>
	<div class="login_div">
		<form action="../addBook" method="post" enctype = "multipart/form-data">
			<div class="container">
				<label for="title"><b>Title</b></label> <input type="text"
					placeholder="Title" name="title" required>
				<label for="author"><b>Author</b></label> <input type="text"
					placeholder="Author" name="author" required>
				<label for="isbn"><b>Isbn</b></label> <input type="text"
					placeholder="Isbn" name="isbn" maxLength=20 required>
				<label for="publisherName"><b>Publisher Name</b></label> <input type="text"
					placeholder="Publisher Name" name="publisherName" required>
				<label for="subjects"><b>Subjects</b></label> <input type="text"
					placeholder="Subjects" name="subjects" size="50" required>
				<label for="publishYear"><b>Publish Year</b></label> <input type="number"
					placeholder="Publish Year" name="publishYear" min="0" max="3000" step="1" required>
				<label for="price"><b>Price</b></label> <input type="number"
					placeholder="Price" name="price" min="0.00" max="10000.00" step="0.01" required>
				<label for="amount"><b>Amount</b></label> <input type="number"
					placeholder="Amount" name="amount" min="0" step="1" required>
				<label for="image"><b>Image</b></label> <input type = "file"
					name="image" required>
				<label for="subcategory"><b>Subcategory</b></label>
				<select name="subcategory" id="subcategory">
				<%
					ArrayList<Subcategory> subcategories = SubcategoryDAO.getAllSubcategories();
					for(int i=0; i<subcategories.size(); i++)
					{
						out.println("<option value=\""+subcategories.get(i).getCategoryId()+"\">"+subcategories.get(i).getTitle()+"</option>");
					}
				%>
				</select>
					
				<button type="submit">Add</button>
				<%
					String message = response.getHeader("message");
					if(message != null)
					{
						out.println(message);
					}
				%>
			</div>
		</form>
	</div>
	

</body>
</html>