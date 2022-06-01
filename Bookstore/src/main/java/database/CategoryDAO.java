package database;

import java.sql.ResultSet;
import java.util.ArrayList;

import model.Category;

public class CategoryDAO {
	public static ArrayList<Category> getAllCategories()
	{
		ArrayList<Category> categories = new ArrayList<Category>();
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
		String searchQuery =
	              "SELECT * FROM category";
		
		try 
	    {
			ResultSet rs = manager.executeQuery(searchQuery);
		    while(rs.next())
		    {
		    	categories.add(new Category(rs.getString("title")));
		    }
	        
	     }
	
	     catch (Exception ex) 
	     {
	        System.out.println("Get Categories Failed!: " + ex);
	     }
		
		return categories;
	}
}
