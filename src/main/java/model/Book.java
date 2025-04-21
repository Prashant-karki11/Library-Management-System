package model;

public class Book {
    private int id;
    private String title;
    private String author;
    private String publisher;
    private String isbn;
    private int publicationYear;
    private String genre;

    public Book(int id, String title, String author, String publisher, String isbn, int publicationYear, String genre) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.isbn = isbn;
        this.publicationYear = publicationYear;
        this.genre = genre;
    }

    // Getters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public String getPublisher() { return publisher; }
    public String getIsbn() { return isbn; }
    public int getPublicationYear() { return publicationYear; }
    public String getGenre() { return genre; }
}