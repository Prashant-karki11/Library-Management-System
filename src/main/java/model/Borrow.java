package model;

import java.util.Date;

public class Borrow {
    // Instance variables
    private int borrowID;
    private int userID;
    private int bookID;
    private Date borrowDate;
    private Date dueDate;
    private Date returnDate;
    private double fine;

    // Constructors
    public Borrow() {
    }

    public Borrow(int borrowID, int userID, int bookID, Date borrowDate, Date dueDate, Date returnDate, double fine) {
        this.borrowID = borrowID;
        this.userID = userID;
        this.bookID = bookID;
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.returnDate = returnDate;
        this.fine = fine;
    }

    // Getters and setters
    public int getBorrowID() {
        return borrowID;
    }

    public void setBorrowID(int borrowID) {
        this.borrowID = borrowID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public Date getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public double getFine() {
        return fine;
    }
    // setter method
    public void setFine(double fine) {
        this.fine = fine;
    }
}