package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.BookDAO;
import database.SubcategoryDAO;
import model.Book;

import javax.servlet.annotation.*;

@WebServlet(name = "addBook", urlPatterns = { "/addBook" })
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class addBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart = request.getPart("image");
	    String fileName = filePart.getSubmittedFileName();
	    
	    String savePath = "C:\\Users\\Mali\\eclipse-workspace-web\\Bookstore\\src\\main\\webapp\\upload\\";
	    File fileSaveDir = new File(savePath);
	    if (!fileSaveDir.exists()) {
	      fileSaveDir.mkdir();
	    }
	    filePart.write(savePath + fileName);
	    String imageURL = "..\\upload\\" + fileName;
	    imageURL = imageURL.replace('\\', '/');
	    
	    Book newBook = new Book(Integer.parseInt(request.getParameter("subcategory")), request.getParameter("author"), 
	    						Integer.parseInt(request.getParameter("publishYear")), request.getParameter("title"), 
	    						request.getParameter("isbn"), imageURL, request.getParameter("publisherName"), 
	    						request.getParameter("subjects"), Integer.parseInt(request.getParameter("amount")), 
	    						Float.parseFloat(request.getParameter("price")), -1);
	    
	    BookDAO.addBook(newBook);
	    
	    response.addHeader("message", "Successfully Added");
	    response.sendRedirect("admin/AddBook.jsp");
	}

}
