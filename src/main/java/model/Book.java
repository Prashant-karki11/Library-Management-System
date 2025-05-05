package model;

public class Book {
    private int id;
    private String title;
    private String author;
    private String publisher;
    private String isbn;
    private int publicationYear;
    private String genre;
    private int pages;
    private String image;

    public Book(int id, String title, String author, String publisher, String isbn, int publicationYear, String genre, int pages, String image) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.isbn = isbn;
        this.publicationYear = publicationYear;
        this.genre = genre;
        this.pages = pages;
        this.image = image;
    }

    // Getters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public String getPublisher() { return publisher; }
    public String getIsbn() { return isbn; }
    public int getPublicationYear() { return publicationYear; }
    public String getGenre() { return genre; }
    public int getPages() { return pages; }
    public void setPages(int pages) { this.pages = pages; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}