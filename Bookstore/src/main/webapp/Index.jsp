<!DOCTYPE html>
<html>
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
</style>
<body>
	<div class="navbar">
		<a href="Register.jsp"><i class="fa fa-fw fa-sign-in"></i> Register</a>
		<a href="Login.jsp"><i class="fa fa-fw fa-user"></i> Login</a>
		<a class="active" href="#"><i class="fa fa-fw fa-home"></i> Home</a> 	
	</div>
	<div>
		<h1>Bookstore Homepage</h1>
		Please Login or Register to See Available Books
	</div>
</body>
</html>
