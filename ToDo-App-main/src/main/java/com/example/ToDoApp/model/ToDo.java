package com.example.ToDoApp.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.annotation.Nonnull;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name="todo")
public class ToDo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Nonnull
	private Long id;
	
	@Column
	@Nonnull
	private String title;
	
	@Column(name="date")
	@Nonnull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	
	@Column
	@Nonnull
	private String status;
	
	public ToDo() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column
	private String gender;

	@Column
	private String course;

	@Column
	private java.time.LocalDate dob;

	@Column
	private String address;

	// Getters & Setters
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }

	public String getCourse() { return course; }
	public void setCourse(String course) { this.course = course; }

	public java.time.LocalDate getDob() { return dob; }
	public void setDob(java.time.LocalDate dob) { this.dob = dob; }

	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }

}
