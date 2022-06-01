package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class SqlManager {
	private String url;
	private String username;
	private String password;
	public SqlManager(String url, String username, String password){
		this.url = url;
		this.username = username;
		this.password = password;
	}
	public ArrayList<String> getTableNames(String schemaName)
	{
		try{
			ArrayList<String> tableNames = new ArrayList<String>();
			String query = "SELECT table_name FROM information_schema.tables "
					+ "		WHERE table_schema = \"" + schemaName + "\";";
			ResultSet rs = executeQuery(query);
			
			while(rs.next())
			{
				tableNames.add(rs.getString("table_name"));
			}
			return tableNames;
		} catch (SQLException e) {
		    throw new IllegalStateException("Cannot get table names!", e);
		}
	}
	public HashMap<String, Integer> getTableRecordCounts(String schemaName)
	{
		try{
			ArrayList<String> tableNames = getTableNames(schemaName);
			HashMap<String, Integer> recordCounts = new HashMap<String, Integer>();
				
			for(int i=0; i<tableNames.size(); i++)
			{
				String query = "SELECT COUNT(*) AS count FROM " + tableNames.get(i) + ";";
				ResultSet resultSet = executeQuery(query);
				if(resultSet.next()){
					recordCounts.put(tableNames.get(i), resultSet.getInt("count"));
				}
			}
			return recordCounts;
		} catch (SQLException e) {
		    throw new IllegalStateException("Cannot get record counts!", e);
		}
	}
	public ResultSet executeQuery(String query)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			return resultSet;
		} catch (Exception e) {
		    throw new IllegalStateException("Cannot execute the query!" + e, e);
		}
	}
	private String generateProcedureString(String procedureName, ArrayList<String> variableString, ArrayList<String> variableTypes)
	{
		String result = "";
		result = result.concat("call " + procedureName + "(");
		if(variableTypes.get(0).equalsIgnoreCase("String"))
			result = result.concat("\""+ variableString.get(0) +"\"");
		else if(variableTypes.get(0).equalsIgnoreCase("int"))
			result = result.concat(variableString.get(0));
		
		for(int i=1; i<variableString.size(); i++)
		{
			if(variableTypes.get(i).equalsIgnoreCase("String"))
				result = result.concat(", \""+ variableString.get(i) +"\"");
			else if(variableTypes.get(i).equalsIgnoreCase("int") || variableTypes.get(i).equalsIgnoreCase("float") 
																|| variableTypes.get(i).equalsIgnoreCase("date"))
				result = result.concat(", " + variableString.get(i));
		}
		return result.concat(");");
	}
	
	//	Category
	public void insertCategory(String title) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(title);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_category", variableString, variableTypes));
	}
	public void updateCategory(int id, String title) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(title);	variableTypes.add("String");
		executeQuery(generateProcedureString("update_category", variableString, variableTypes));
	}
	public void deleteCategory(int id) {executeQuery("call delete_category("+id+")");}
	
	//	Subcategory
	public void insertSubcategory(int categoryId, String title) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(categoryId));	variableTypes.add("int");
		variableString.add(title);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_subcategory", variableString, variableTypes));
	}
	public void updateSubcategory(int id, String title) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(title);	variableTypes.add("String");
		executeQuery(generateProcedureString("update_subcategory", variableString, variableTypes));
	}
	public void deleteSubcategory(int id) {executeQuery("call delete_subcategory("+id+")");}
	
	//	Book
	public void insert_book(int subcategoryId, String authorName, int publishYear, String title, String isbn, String imageURL, 
							String publisherName, String subjects, int count, float price) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(subcategoryId));	variableTypes.add("int");
		variableString.add(authorName);	variableTypes.add("String");
		variableString.add(String.valueOf(publishYear));	variableTypes.add("int");
		variableString.add(title);	variableTypes.add("String");
		variableString.add(isbn);	variableTypes.add("String");
		variableString.add(imageURL);	variableTypes.add("String");
		variableString.add(publisherName);	variableTypes.add("String");
		variableString.add(subjects);	variableTypes.add("String");
		variableString.add(String.valueOf(count));	variableTypes.add("int");
		variableString.add(String.valueOf(price));	variableTypes.add("float");
		executeQuery(generateProcedureString("insert_book", variableString, variableTypes));
	}
	public void update_book(int id, int subcategoryId, String authorName, int publishYear, String title, String isbn, String imageURL, 
							String publisherName, String subjects, int count, float price) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(String.valueOf(subcategoryId));	variableTypes.add("int");
		variableString.add(authorName);	variableTypes.add("String");
		variableString.add(String.valueOf(publishYear));	variableTypes.add("int");
		variableString.add(title);	variableTypes.add("String");
		variableString.add(isbn);	variableTypes.add("String");
		variableString.add(imageURL);	variableTypes.add("String");
		variableString.add(publisherName);	variableTypes.add("String");
		variableString.add(subjects);	variableTypes.add("String");
		variableString.add(String.valueOf(count));	variableTypes.add("int");
		variableString.add(String.valueOf(price));	variableTypes.add("float");
		executeQuery(generateProcedureString("update_book", variableString, variableTypes));
	}
	public void delete_book(int id) {executeQuery("call delete_book("+id+")");}
	
	//	Campaign
	public void insertCampaign(int bookId, float discountPercentage, String note, String imageURL) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(bookId));	variableTypes.add("int");
		variableString.add(String.valueOf(discountPercentage));	variableTypes.add("float");
		variableString.add(note);	variableTypes.add("String");
		variableString.add(imageURL);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_customer", variableString, variableTypes));
	}
	public void updateCampaign(int bookId, float discountPercentage, String note, String imageURL) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(bookId));	variableTypes.add("int");
		variableString.add(String.valueOf(discountPercentage));	variableTypes.add("float");
		variableString.add(note);	variableTypes.add("String");
		variableString.add(imageURL);	variableTypes.add("String");
		executeQuery(generateProcedureString("update_customer", variableString, variableTypes));
	}
	public void deleteCampaign(int id) {executeQuery("call delete_customer("+id+")");}
	
	//	Customer
	public void insertCustomer(String customerName, String phone, String email, String customerPassword, String address) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(customerName);	variableTypes.add("String");
		variableString.add(phone);	variableTypes.add("String");
		variableString.add(email);	variableTypes.add("String");
		variableString.add(customerPassword);	variableTypes.add("String");
		variableString.add(address);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_customer", variableString, variableTypes));
	}
	public void updateCustomer(int id, String customerName, String phone, String email, String customerPassword, String address) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(customerName);	variableTypes.add("String");
		variableString.add(phone);	variableTypes.add("String");
		variableString.add(email);	variableTypes.add("String");
		variableString.add(customerPassword);	variableTypes.add("String");
		variableString.add(address);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_customer", variableString, variableTypes));
	}
	public void deleteCustomer(int id) {executeQuery("call delete_campaign("+id+")");}
	
	//	Page Admin
	public void insertPageAdmin(String password, String email) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(password);	variableTypes.add("String");
		variableString.add(email);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_page_admin", variableString, variableTypes));
	}
	public void updatePageAdmin(int id, String password, String email) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(password);	variableTypes.add("String");
		variableString.add(email);	variableTypes.add("String");
		executeQuery(generateProcedureString("update_page_admin", variableString, variableTypes));
	}
	public void deletePageAdmin(int id) {executeQuery("call delete_page_admin("+id+")");}
	
	//	Mail
	public void insertMail(int pageAdminId, int customerId, String title, String content) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(pageAdminId));	variableTypes.add("int");
		variableString.add(String.valueOf(customerId));	variableTypes.add("int");
		variableString.add(title);	variableTypes.add("String");
		variableString.add(content);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_mail", variableString, variableTypes));
	}
	
	//	Book Comment
	public void insertBookComment(int bookId, int customerId, float rate, String userComment) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(bookId));	variableTypes.add("int");
		variableString.add(String.valueOf(customerId));	variableTypes.add("int");
		variableString.add(String.valueOf(rate));	variableTypes.add("float");
		variableString.add(userComment);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_book_comment", variableString, variableTypes));
	}
	public void updateBookComment(int id, int bookId, int customerId, float rate, String userComment) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(String.valueOf(bookId));	variableTypes.add("int");
		variableString.add(String.valueOf(customerId));	variableTypes.add("int");
		variableString.add(String.valueOf(rate));	variableTypes.add("float");
		variableString.add(userComment);	variableTypes.add("String");
		executeQuery(generateProcedureString("update_book_comment", variableString, variableTypes));
	}
	public void deleteBookComment(int id) {executeQuery("call delete_book_comment("+id+")");}
	
	//	Payment Service
	public void insertPaymentService(String paymentName, String accountNumber) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(paymentName);	variableTypes.add("String");
		variableString.add(accountNumber);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_payment_service", variableString, variableTypes));
	}
	public void updatePaymentService(int id, String paymentName, String accountNumber) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(paymentName);	variableTypes.add("String");
		variableString.add(accountNumber);	variableTypes.add("String");
		executeQuery(generateProcedureString("update_payment_service", variableString, variableTypes));
	}
	public void deletePaymentService(int id) {executeQuery("call delete_payment_service("+id+")");}
	
	//	Courier Company
	public void insertCourierCompany(String url, String phone, String companyName, float price) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(url);	variableTypes.add("String");
		variableString.add(phone);	variableTypes.add("String");
		variableString.add(companyName);	variableTypes.add("String");
		variableString.add(String.valueOf(price));	variableTypes.add("float");
		executeQuery(generateProcedureString("insert_courier_company", variableString, variableTypes));
	}
	public void updateCourierCompany(int id, String url, String phone, String companyName, float price) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(url);	variableTypes.add("String");
		variableString.add(phone);	variableTypes.add("String");
		variableString.add(companyName);	variableTypes.add("String");
		variableString.add(String.valueOf(price));	variableTypes.add("float");
		executeQuery(generateProcedureString("update_courier_company", variableString, variableTypes));
	}
	public void deleteCourierCompany(int id) {executeQuery("call delete_courier_company("+id+")");}
	
	//	Billing Information
	public void insertBillingInformation(int customerId, String customerName, String phone, String email, String address) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(customerId));	variableTypes.add("int");
		variableString.add(customerName);	variableTypes.add("String");
		variableString.add(phone);	variableTypes.add("String");
		variableString.add(email);	variableTypes.add("String");
		variableString.add(address);	variableTypes.add("String");
		executeQuery(generateProcedureString("insert_billing_information", variableString, variableTypes));
	}
	public void updateBillingInformation(int id, int customerId, String customerName, String phone, String email, String address) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(String.valueOf(customerId));	variableTypes.add("int");
		variableString.add(customerName);	variableTypes.add("String");
		variableString.add(phone);	variableTypes.add("String");
		variableString.add(email);	variableTypes.add("String");
		variableString.add(address);	variableTypes.add("String");
		executeQuery(generateProcedureString("update_billing_information", variableString, variableTypes));
	}
	public void deleteBillingInformation(int id) {executeQuery("call delete_billing_information("+id+")");}
	
	//	Purchase Request
	public void insertPurchaseRequest(int isConfirmed) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(isConfirmed));	variableTypes.add("int");
		executeQuery(generateProcedureString("insert_purchase_request", variableString, variableTypes));
	}
	public void updatePurchaseRequest(int id, int paymentServiceId, int courierCompanyId, int billingInformationId, int isConfirmed) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(String.valueOf(paymentServiceId));	variableTypes.add("int");
		variableString.add(String.valueOf(courierCompanyId));	variableTypes.add("int");
		variableString.add(String.valueOf(billingInformationId));	variableTypes.add("int");
		variableString.add(String.valueOf(isConfirmed));	variableTypes.add("int");
		executeQuery(generateProcedureString("update_purchase_request", variableString, variableTypes));
	}
	public void deletePurchaseRequest(int id) {executeQuery("call delete_purchase_request("+id+")");}
	
	//	Cart
	public void insertCart(int bookId, int customerId, int count, int purchaseRequestId) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(bookId));	variableTypes.add("int");
		variableString.add(String.valueOf(customerId));	variableTypes.add("int");
		variableString.add(String.valueOf(count));	variableTypes.add("int");
		variableString.add(String.valueOf(purchaseRequestId));	variableTypes.add("int");
		executeQuery(generateProcedureString("insert_cart", variableString, variableTypes));
	}
	public void updateCart(int id, int bookId, int customerId, int count, int purchaseRequestId) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(id));	variableTypes.add("int");
		variableString.add(String.valueOf(bookId));	variableTypes.add("int");
		variableString.add(String.valueOf(customerId));	variableTypes.add("int");
		variableString.add(String.valueOf(count));	variableTypes.add("int");
		variableString.add(String.valueOf(purchaseRequestId));	variableTypes.add("int");
		executeQuery(generateProcedureString("update_cart", variableString, variableTypes));
	}
	public void deleteCart(int id) {executeQuery("call delete_cart("+id+")");}
	
	//	In Cargo
	public void insertInCargo(int purchaseRequestId) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(purchaseRequestId));	variableTypes.add("int");
		executeQuery(generateProcedureString("insert_in_cargo", variableString, variableTypes));
	}
	public void updateInCargo(int purchaseRequestId, Date exportDate, Date arrivalDate) {
		ArrayList<String> variableString = new ArrayList<String>();
		ArrayList<String> variableTypes = new ArrayList<String>();
		
		variableString.add(String.valueOf(purchaseRequestId));	variableTypes.add("int");
		variableString.add(String.valueOf(exportDate));	variableTypes.add("Date");
		variableString.add(String.valueOf(arrivalDate));	variableTypes.add("Date");
		executeQuery(generateProcedureString("update_in_cargo", variableString, variableTypes));
	}
	public void deleteInCargo(int purchaseRequestId) {executeQuery("call delete_in_cargo("+purchaseRequestId+")");}
}
