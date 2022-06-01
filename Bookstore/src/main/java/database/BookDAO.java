package database;

import java.sql.ResultSet;
import java.util.ArrayList;

import model.Book;

public class BookDAO {
	public static ArrayList<Book> getAllBooks() {
		ArrayList<Book> books = new ArrayList<Book>();
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
		String searchQuery = "SELECT * FROM book";

		try {
			ResultSet rs = manager.executeQuery(searchQuery);
			while (rs.next()) {
				books.add(new Book(rs.getInt("subcategory_id"), rs.getString("author_name"), rs.getInt("publish_year"),
						rs.getString("title"), rs.getString("isbn"), rs.getString("image_url"),
						rs.getString("publisher_name"), rs.getString("subjects"), rs.getInt("count"),
						rs.getFloat("price"), rs.getFloat("price_with_campaign")));
			}

		}

		catch (Exception ex) {
			System.out.println("Get Books Failed!: " + ex);
		}

		return books;
	}

	public static ArrayList<Book> getBooksBySubcategory(String subcategoryName) {
		ArrayList<Book> books = new ArrayList<Book>();
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
		String searchQuery = "SELECT * FROM book WHERE subcategory_id IN (SELECT id FROM subcategory WHERE title = \""
				+ subcategoryName + "\");";

		try {
			ResultSet rs = manager.executeQuery(searchQuery);
			while (rs.next()) {
				books.add(new Book(rs.getInt("subcategory_id"), rs.getString("author_name"), rs.getInt("publish_year"),
						rs.getString("title"), rs.getString("isbn"), rs.getString("image_url"),
						rs.getString("publisher_name"), rs.getString("subjects"), rs.getInt("count"),
						rs.getFloat("price"), rs.getFloat("price_with_campaign")));
			}

		}

		catch (Exception ex) {
			System.out.println("Get Books Failed!: " + ex);
		}

		return books;
	}

	public static ArrayList<Book> bookSearch(String searchString) {
		ArrayList<Book> books = new ArrayList<Book>();
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
		System.out.println("Search String: " + searchString);
		String searchQuery = "SELECT * FROM book WHERE LOWER(title) LIKE LOWER(\"%" + searchString + "%\")";

		try {
			ResultSet rs = manager.executeQuery(searchQuery);
			while (rs.next()) {
				books.add(new Book(rs.getInt("subcategory_id"), rs.getString("author_name"), rs.getInt("publish_year"),
						rs.getString("title"), rs.getString("isbn"), rs.getString("image_url"),
						rs.getString("publisher_name"), rs.getString("subjects"), rs.getInt("count"),
						rs.getFloat("price"), rs.getFloat("price_with_campaign")));
			}

		}

		catch (Exception ex) {
			System.out.println("Search Books Failed!: " + ex);
		}
		System.out.println(books);
		return books;
	}

	public static void addBook(Book book)
	{
		SqlManager manager = new SqlManager("jdbc:mysql://localhost:3306/bookstore", "root", "sifre");
		manager.insert_book(book.getSubcategory_id(), book.getAuthor_name(), book.getPublish_year(), book.getTitle(), book.getIsbn(), 
							book.getImage_url(), book.getPublisher_name(), book.getSubjects(), book.getCount(), book.getPrice());
	}
}
