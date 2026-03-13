# 🎓 Student Admission System

A full-stack web application built with Spring Boot, MySQL, and JSP to manage student admissions efficiently.

---

## 🚀 Features

- 🔐 Secure Login — DB-based authentication with session management
- 📊 Dashboard — Total, Completed, Incomplete student count
- ➕ Add Student — Register new students with full details
- ✏️ Edit Student — Update existing student information
- 🗑️ Delete Student — Remove student records
- 🔍 Search — Find students by name
- 📄 Pagination — 10 records per page
- ✅ Toggle Status — Mark Complete  Incomplete
- 📥 Export PDF — Download full student report
- 📱 Responsive UI — Works on all screen sizes

---

## 🛠️ Tech Stack

 Layer  Technology 
------
 Backend  Java, Spring Boot 
 Frontend  JSP, HTML, CSS 
 Database  MySQL 
 ORM  Spring Data JPA  Hibernate 
 PDF  iText PDF 
 UI Libraries  Bootstrap, Font Awesome, Toastr 

---

## 📋 Student Fields

- Admission Number (Auto)
- Student Name
- Date of Birth
- Gender
- Course  Department
- Joining Date
- Address
- Admission Status

---

## ⚙️ Setup Instructions

### Prerequisites
- Java 17+
- MySQL 8+
- Maven
- Spring Tool Suite 4 (STS)

### Steps

1. Clone the repository
```bash
git clone httpsgithub.comஉன்_usernamestudent-admission-system.git
```

2. Create MySQL Database
```sql
CREATE DATABASE todo_app;
```

3. Configure `application.properties`
```properties
spring.datasource.url=jdbcmysqllocalhost3306todo_app
spring.datasource.username=root
spring.datasource.password=உன்_password
spring.jpa.hibernate.ddl-auto=update
```

4. Add Login User
```sql
INSERT INTO todo_app.users (username, password) 
VALUES ('admin', 'admin123');
```

5. Run the application
```bash
mvn spring-bootrun
```

6. Open Browser
```
httplocalhost8080login
```

---

## 📸 Screenshots

 Login Page, Dashboard, Student List, Add Form, PDF Export

---

## 👨‍💻 Developer

Vicky  
Student Admission System — Built with Spring Boot

---

## 📄 License

This project is for educational purposes.