package model;

public class Book {
	private int subcategory_id;
	private String author_name;
	private int publish_year;
	private String title;
	private String isbn;
	private String image_url;
	private String publisher_name;
	private String subjects;
	private int count;
	private float price;
	private float price_with_campaign;
	public int getSubcategory_id() {
		return subcategory_id;
	}
	public Book(int subcategory_id, String author_name, int publish_year, String title, String isbn, String image_url,
			String publisher_name, String subjects, int count, float price, float price_with_campaign) {
		super();
		this.subcategory_id = subcategory_id;
		this.author_name = author_name;
		this.publish_year = publish_year;
		this.title = title;
		this.isbn = isbn;
		this.image_url = image_url;
		this.publisher_name = publisher_name;
		this.subjects = subjects;
		this.count = count;
		this.price = price;
		this.price_with_campaign = price_with_campaign;
	}
	public void setSubcategory_id(int subcategory_id) {
		this.subcategory_id = subcategory_id;
	}
	public String getAuthor_name() {
		return author_name;
	}
	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}
	public int getPublish_year() {
		return publish_year;
	}
	public void setPublish_year(int publish_year) {
		this.publish_year = publish_year;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}
	public String getSubjects() {
		return subjects;
	}
	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getPrice_with_campaign() {
		return price_with_campaign;
	}
	public void setPrice_with_campaign(float price_with_campaign) {
		this.price_with_campaign = price_with_campaign;
	}
	
}
