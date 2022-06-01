package database;

import java.sql.ResultSet;
import java.util.ArrayList;

import model.Subcategory;

public class SubcategoryDAO {
	public static ArrayList<Subcategory> getSubcategoriesByCategory(String categoryName)
	{
		ArrayList<Subcategory> subCategories = new ArrayList<Subcategory>();
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
		String searchQuery =
	              "SELECT * FROM subcategory WHERE category_id IN (SELECT id FROM category WHERE title = \""+categoryName+"\");";
		
		try 
	    {
			ResultSet rs = manager.executeQuery(searchQuery);
		    while(rs.next())
		    {
		    	subCategories.add(new Subcategory(rs.getInt("category_id"), rs.getString("title")));
		    }
	        
	     }
	
	     catch (Exception ex) 
	     {
	        System.out.println("Get Subcategories Failed!: " + ex);
	     }
		
		return subCategories;
	}
	public static ArrayList<Subcategory> getAllSubcategories()
	{
		ArrayList<Subcategory> subCategories = new ArrayList<Subcategory>();
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
		String searchQuery =
	              "SELECT * FROM subcategory;";
		
		try 
	    {
			ResultSet rs = manager.executeQuery(searchQuery);
		    while(rs.next())
		    {
		    	subCategories.add(new Subcategory(rs.getInt("category_id"), rs.getString("title")));
		    }
	        
	     }
	
	     catch (Exception ex) 
	     {
	        System.out.println("Get Subcategories Failed!: " + ex);
	     }
		
		return subCategories;
	}
	public static int getSubcategoryID(String title)
	{
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
		String searchQuery =
	              "SELECT * FROM subcategory WHERE title = \""+title+"\";";
		
		try 
	    {
			ResultSet rs = manager.executeQuery(searchQuery);
			boolean more = rs.next();
	        
	        if(!more)
	        {
	        	System.out.println("Can't find subcategory!");
	        }
	        else if(more)
	        {
		        return rs.getInt("id");
	        }
	        
	    }
	    catch (Exception ex) 
	    {
	        System.out.println("Get Subcategories Failed!: " + ex);
	    }
		
		return -1;
	}
}
