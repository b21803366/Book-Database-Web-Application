package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.UserDAO;
import model.User;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{	    
			System.out.println("Register!");
		     User user = new User();
		     user.setEmail(request.getParameter("email"));
		     user.setPassword(request.getParameter("password"));
		     user.setName(request.getParameter("name"));
		     user.setPhone(request.getParameter("phone"));
		     user.setAddress(request.getParameter("address"));

		     UserDAO.register(user);
		     
		     response.sendRedirect("Login.jsp");
		} 
				
				
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
	}

}
