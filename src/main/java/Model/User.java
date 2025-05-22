package Model;

import java.sql.Timestamp;

public class User {
private int id;
private String username;
private String email;
private String password;
private String firstName;
private String lastName;
private String phone;
private byte[] profileImage; // BLOB data as byte array
private String imageContentType; // Content type for the image
private Timestamp createdAt;
private Timestamp updatedAt;


public User(int id, String username, String email, String password, String firstName, String lastName, String phone,
		byte[] profileImage, String imageContentType, Timestamp createdAt, Timestamp updatedAt) {
	super();
	this.id = id;
	this.username = username;
	this.email = email;
	this.password = password;
	this.firstName = firstName;
	this.lastName = lastName;
	this.phone = phone;
	this.profileImage = profileImage;
	this.imageContentType = imageContentType;
	this.createdAt = createdAt;
	this.updatedAt = updatedAt;
}


// Constructors, getters, and setters
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public byte[] getProfileImage() {
	return profileImage;
}
public void setProfileImage(byte[] profileImage) {
	this.profileImage = profileImage;
}
public String getImageContentType() {
	return imageContentType;
}
public void setImageContentType(String imageContentType) {
	this.imageContentType = imageContentType;
}
public Timestamp getCreatedAt() {
	return createdAt;
}
public void setCreatedAt(Timestamp createdAt) {
	this.createdAt = createdAt;
}
public Timestamp getUpdatedAt() {
	return updatedAt;
}
public void setUpdatedAt(Timestamp updatedAt) {
	this.updatedAt = updatedAt;
}



}