package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.UserDAO;
import model.User;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{	    

		     User user = new User();
		     user.setEmail(request.getParameter("email"));
		     user.setPassword(request.getParameter("password"));

		     user = UserDAO.login(user);
			   		    
		     if (user.isValid())
		     {
		    	 HttpSession session = request.getSession(true);
		         session.setAttribute("currentSessionUser",user);
		    	 if(!user.isAdmin())
			         response.sendRedirect("user/Homepage.jsp"); //logged-in page 
			     else
			    	 response.sendRedirect("admin/AdminHomepage.jsp"); //logged-in page
		     }
		     else
		          response.sendRedirect("Login.jsp"); //error page
		} 
				
				
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
	}

}
