package database;

import model.User;
import java.sql.ResultSet;

public class UserDAO {
	public static User login(User bean) {
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
        String email = bean.getEmail();
        String password = AES.encrypt(bean.getPassword(), "key");
        System.out.println(password);
	    
        String searchQuery =
              "SELECT * FROM customer "
              + "WHERE email = \"" + email + "\""
              + "AND customer_password = \"" + password + "\"";
	    
	     // "System.out.println" prints in the console; Normally used to trace the process
	     System.out.println("Your user name is " + email);          
	     System.out.println("Your password is " + password);
	     System.out.println("Query: "+searchQuery);
	     
	     String searchAdminQuery = 
	    		 "SELECT * FROM page_admin "
	    	     + "WHERE email = \"" + email + "\""
	    	     + "AND admin_password = \"" + password + "\"";
		    
	     try 
	     {
	        ResultSet rs = manager.executeQuery(searchQuery);
	        boolean more = rs.next();
		       
	        // if user does not exist set the isValid variable to false
	        if (!more) 
	        {
	        	rs = manager.executeQuery(searchAdminQuery);
		        more = rs.next();
		        
		        if(!more)
		        {
		        	System.out.println("Sorry, you are not a registered user! Please sign up first");
			        bean.setValid(false);
			        bean.setAdmin(false);
		        }
		        else if(more)
		        {
			        bean.setValid(true);
			        bean.setAdmin(true);
		        }
	        } 
		        
	        //if user exists set the isValid variable to true
	        else if (more) 
	        {
	           String name = rs.getString("customer_name");
	           System.out.println("Welcome " + name);
	           bean.setName(name);
	           bean.setValid(true);
	           bean.setAdmin(false);
	        }
	        
	     }
	
	     catch (Exception ex) 
	     {
	        System.out.println("Log In failed: An Exception has occurred! " + ex);
	     }
	     return bean;
	}
	public static void register(User bean)
	{
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
        String password = bean.getPassword();
        System.out.println(password);
        password = AES.encrypt(password, "key");
        System.out.println(password);
        
        manager.insertCustomer(bean.getName(), bean.getPhone(), bean.getEmail(), password, bean.getAddress());
	}
}
