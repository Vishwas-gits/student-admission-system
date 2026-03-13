<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Admission Records</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap');

:root {
  --navy: #0d1f3c; --navy-mid: #1a3260; --accent: #c8973a;
  --text-dark: #0d1f3c; --text-muted: #6b7a99;
  --success: #1d7a5f; --danger: #a8302a; --primary: #1a3260;
  --border: #d8dff0; --shadow: 0 4px 24px rgba(13,31,60,0.12);
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
  background-color: #c9d4f0;
  background-image: linear-gradient(135deg, #b8c7e8 0%, #c9d4f0 50%, #d8e2f5 100%);
  font-family: 'DM Sans', sans-serif;
  color: var(--text-dark);
  min-height: 100vh;
  padding: 0 0 40px 0;
}

/* NAVBAR */
.navbar {
  background-color: #0d1f3c;
  background-image: linear-gradient(90deg, #0d1f3c 0%, #1a3260 60%, #0f2a50 100%);
  padding: 14px 32px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  box-shadow: 0 2px 12px rgba(0,0,0,0.3);
  position: sticky;
  top: 0;
  z-index: 999;
}

/* DASHBOARD CARDS */
.dashboard {
  display: flex;
  gap: 20px;
  padding: 24px 32px 0;
  flex-wrap: wrap;
}

.dash-card {
  flex: 1;
  min-width: 180px;
  border-radius: 14px;
  padding: 24px;
  text-align: center;
}

/* SEARCH + RECORDS AREA */
.main-area {
  padding: 0 32px;
  margin-top: 24px;
}

.search-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
  gap: 16px;
  flex-wrap: wrap;
}

.search-form {
  display: flex;
  gap: 10px;
  align-items: center;
}

.search-box {
  flex: 1;
  background-color: #f4f7ff;
  border: 1.5px solid #c8d4f0;
  border-radius: 10px;
  padding: 10px 16px;
  display: flex;
  align-items: center;
  gap: 10px;
  min-width: 260px;
}

/* CONTAINER */
.container {
  max-width: 100%;
  background-color: #ffffff;
  background-image: linear-gradient(160deg, #ffffff 70%, #f0f4ff 100%);
  border-radius: 18px;
  box-shadow: var(--shadow);
  padding: 32px 36px 40px;
  border-top: 6px solid var(--accent);
  position: relative;
  overflow: hidden;
}

.container h1 {
  font-family: 'Playfair Display', serif;
  font-size: 2rem;
  font-weight: 700;
  color: var(--navy);
  margin-bottom: 24px;
  padding: 16px 20px 18px !important;
  background-color: #f0f4ff;
  background-image: linear-gradient(90deg, #e8edf8 0%, #f8f9ff 100%);
  border-radius: 10px;
  border-left: 4px solid var(--accent);
}

/* TABLE */
.table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  font-size: 0.92rem;
  background-color: transparent;
}

.table thead tr {
  background-color: #0d1f3c;
  background-image: linear-gradient(90deg, #0d1f3c 0%, #1a3260 60%, #0f2a50 100%);
}

.table thead th {
  padding: 14px 16px;
  font-weight: 600;
  font-size: 0.76rem;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: rgba(255,255,255,0.88);
  border: none;
  white-space: nowrap;
}

.table thead th:first-child { border-radius: 10px 0 0 0; }
.table thead th:last-child  { border-radius: 0 10px 0 0; }

.table tbody tr {
  background-color: #ffffff;
  transition: all 0.18s ease;
}

.table tbody tr:nth-child(even) {
  background-color: #eef1fb;
}

.table tbody tr:hover {
  background-color: #dce3f7;
  transform: translateY(-1px);
  box-shadow: 0 3px 14px rgba(13,31,60,0.08);
}

.table tbody td {
  padding: 12px 16px;
  border: none;
  border-bottom: 1px solid #d8dff0;
  vertical-align: middle;
}

.table tbody td:first-child {
  font-weight: 700;
  color: var(--accent);
}

/* BUTTONS */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 6px 13px;
  border-radius: 7px;
  border: none;
  font-family: 'DM Sans', sans-serif;
  font-weight: 600;
  font-size: 0.80rem;
  cursor: pointer;
  transition: all 0.2s ease;
}

.btn a { text-decoration: none; color: inherit; }

.btn-success {
  background-color: #1d7a5f;
  background-image: linear-gradient(135deg, #1d7a5f, #249171);
  color: #ffffff;
}

.btn-primary {
  background-color: #1a3260;
  background-image: linear-gradient(135deg, #1a3260, #1e3d78);
  color: #ffffff;
}

.btn-danger {
  background-color: #a8302a;
  background-image: linear-gradient(135deg, #a8302a, #c23b33);
  color: #ffffff;
}

.btn-block {
  display: block;
  width: 100%;
  padding: 15px 24px;
  font-size: 0.95rem;
  font-weight: 700;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  background-color: #0d1f3c;
  background-image: linear-gradient(135deg, #1a3260 0%, #0d1f3c 50%, #0a1728 100%);
  border-radius: 12px;
  color: #ffffff;
  border: none;
  cursor: pointer;
  transition: all 0.25s ease;
  margin-top: 12px;
}

.btn-block a { text-decoration: none; color: #ffffff; }

::-webkit-scrollbar { width: 8px; height: 8px; }
::-webkit-scrollbar-track { background-color: #e8edf8; border-radius: 4px; }
::-webkit-scrollbar-thumb { background-color: #1a3260; border-radius: 4px; }
::-webkit-scrollbar-thumb:hover { background-color: #c8973a; }
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div style="display:flex;align-items:center;gap:12px;">
        <i class="fas fa-graduation-cap" style="color:#c8973a;font-size:1.5rem;"></i>
        <span style="font-family:'Playfair Display',serif;color:#ffffff;font-size:1.1rem;font-weight:700;">
            Student Admission System
        </span>
    </div>
    <div style="display:flex;align-items:center;gap:20px;">
        <div style="background-color:rgba(200,151,58,0.15);border:1px solid rgba(200,151,58,0.35);border-radius:20px;padding:7px 18px;display:flex;align-items:center;gap:8px;">
            <i class="fas fa-user-circle" style="color:#f0c97a;font-size:1rem;"></i>
            <span style="color:#f0c97a;font-size:0.88rem;font-weight:600;">
                Welcome, ${sessionScope.loggedInUser}!
            </span>
        </div>
        <a href="/logout" style="background-color:#a8302a;background-image:linear-gradient(135deg,#a8302a,#c23b33);color:#ffffff;padding:8px 20px;border-radius:8px;text-decoration:none;font-size:0.86rem;font-weight:700;letter-spacing:0.05em;text-transform:uppercase;display:flex;align-items:center;gap:8px;">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>
</div>

<!-- DASHBOARD CARDS -->
<div class="dashboard">
    <!-- Total -->
    <div class="dash-card" style="background-color:#0d1f3c;background-image:linear-gradient(135deg,#0d1f3c,#1a3260);box-shadow:0 4px 18px rgba(13,31,60,0.18);border-top:4px solid #c8973a;">
        <div style="font-size:2rem;margin-bottom:8px;"><i class="fas fa-users" style="color:#c8973a;"></i></div>
        <div style="font-size:2.2rem;font-weight:800;color:#ffffff;font-family:'Playfair Display',serif;">${totalStudents}</div>
        <div style="color:rgba(255,255,255,0.65);font-size:0.85rem;font-weight:600;letter-spacing:0.06em;text-transform:uppercase;margin-top:4px;">Total Students</div>
    </div>
    <!-- Completed -->
    <div class="dash-card" style="background-color:#1d7a5f;background-image:linear-gradient(135deg,#1d7a5f,#249171);box-shadow:0 4px 18px rgba(29,122,95,0.22);border-top:4px solid #7ee8c8;">
        <div style="font-size:2rem;margin-bottom:8px;"><i class="fas fa-check-circle" style="color:#7ee8c8;"></i></div>
        <div style="font-size:2.2rem;font-weight:800;color:#ffffff;font-family:'Playfair Display',serif;">${completed}</div>
        <div style="color:rgba(255,255,255,0.65);font-size:0.85rem;font-weight:600;letter-spacing:0.06em;text-transform:uppercase;margin-top:4px;">Completed</div>
    </div>
    <!-- Incomplete -->
    <div class="dash-card" style="background-color:#a8302a;background-image:linear-gradient(135deg,#a8302a,#c23b33);box-shadow:0 4px 18px rgba(168,48,42,0.22);border-top:4px solid #ffb3af;">
        <div style="font-size:2rem;margin-bottom:8px;"><i class="fas fa-clock" style="color:#ffb3af;"></i></div>
        <div style="font-size:2.2rem;font-weight:800;color:#ffffff;font-family:'Playfair Display',serif;">${incomplete}</div>
        <div style="color:rgba(255,255,255,0.65);font-size:0.85rem;font-weight:600;letter-spacing:0.06em;text-transform:uppercase;margin-top:4px;">Incomplete</div>
    </div>
</div>

<!-- MAIN AREA — Search left, Records right concept replaced with stacked clean layout -->
<div class="main-area">

    <!-- Search Row — LEFT side la count, RIGHT side la search -->
    <div class="search-row">

        <!-- Left: Records count -->
        <div style="font-family:'Playfair Display',serif;font-size:1.1rem;font-weight:700;color:#0d1f3c;">
            <i class="fas fa-list" style="color:#c8973a;margin-right:8px;"></i>
            Showing <span style="color:#c8973a;">${totalStudents}</span> record(s)
            <c:if test="${not empty keyword}">
                for "<span style="color:#1a3260;">${keyword}</span>"
            </c:if>
        </div>

        <!-- Right: Search form -->
        <form action="/viewToDoList" method="get" class="search-form">
            <div class="search-box">
                <i class="fas fa-search" style="color:#6b7a99;"></i>
                <input type="text" name="keyword" value="${keyword}"
                    placeholder="Search student name..."
                    style="border:none;outline:none;background:transparent;font-family:'DM Sans',sans-serif;font-size:0.94rem;color:#0d1f3c;width:100%;"/>
            </div>
            <button type="submit" style="background-color:#1a3260;background-image:linear-gradient(135deg,#1a3260,#0d1f3c);color:#ffffff;border:none;border-radius:10px;padding:10px 20px;font-family:'DM Sans',sans-serif;font-weight:700;font-size:0.88rem;cursor:pointer;">
                <i class="fas fa-search"></i> Search
            </button>
            <a href="/viewToDoList" style="background-color:#6b7a99;color:#ffffff;border-radius:10px;padding:10px 16px;text-decoration:none;font-family:'DM Sans',sans-serif;font-weight:700;font-size:0.88rem;">
                <i class="fas fa-times"></i> Clear
            </a>
        </form>
    </div>

    <!-- TABLE CONTAINER -->
    <div class="container">
        <h1 class="p-3">Student Admission Records</h1>

        <form:form>
            <div style="overflow-x:auto;width:100%;">
                <table class="table" style="min-width:1200px;">
                    <thead>
                        <tr>
                            <th>Adm. No</th>
                            <th>Student Name</th>
                            <th>Date of Birth</th>
                            <th>Gender</th>
                            <th>Course</th>
                            <th>Joining Date</th>
                            <th>Address</th>
                            <th>Admission Status</th>
                            <th>Status Completed</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="todo" items="${list}">
                            <tr>
                                <td>${todo.id}</td>
                                <td>${todo.title}</td>
                                <td>${todo.dob}</td>
                                <td>${todo.gender}</td>
                                <td>${todo.course}</td>
                                <td>${todo.date.toString().substring(0,10)}</td>
                                <td>${todo.address}</td>
                                <td>${todo.status}</td>
                            <td>
							    <button type="button" class="btn"
							        style="
							            background-image: linear-gradient(135deg,
							                ${todo.status == 'Completed' ? '#1d7a5f,#249171' : '#f5c842,#e6b800'});
							            color: ${todo.status == 'Completed' ? '#ffffff' : '#5a4000'};
							            font-weight: 700;
							        ">
							        <a href="/updateToDoStatus/${todo.id}"
							            style="color: inherit;">
							            ${todo.status == 'Completed' ? 'Mark Incomplete' : 'Mark Complete'}
							        </a>
							    </button>
							</td>
                                <td>
                                    <button type="button" class="btn btn-primary">
                                        <a href="/editToDoItem/${todo.id}">Edit</a>
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger">
                                        <a href="/deleteToDoItem/${todo.id}">Delete</a>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div style="display:flex;justify-content:center;align-items:center;gap:8px;margin:24px 0 16px;flex-wrap:wrap;">
                <c:if test="${currentPage > 0}">
                    <a href="/viewToDoList?page=${currentPage - 1}&keyword=${keyword}"
                        style="padding:8px 18px;background-color:#1a3260;color:#ffffff;border-radius:8px;text-decoration:none;font-weight:600;font-size:0.88rem;">
                        <i class="fas fa-chevron-left"></i> Prev
                    </a>
                </c:if>

                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                    <a href="/viewToDoList?page=${i}&keyword=${keyword}"
                        style="padding:8px 14px;border-radius:8px;text-decoration:none;font-weight:600;font-size:0.88rem;background-color:${i == currentPage ? '#c8973a' : '#f0f4ff'};color:${i == currentPage ? '#ffffff' : '#1a3260'};border:1px solid #d8dff0;">
                        ${i + 1}
                    </a>
                </c:forEach>

                <c:if test="${currentPage < totalPages - 1}">
                    <a href="/viewToDoList?page=${currentPage + 1}&keyword=${keyword}"
                        style="padding:8px 18px;background-color:#1a3260;color:#ffffff;border-radius:8px;text-decoration:none;font-weight:600;font-size:0.88rem;">
                        Next <i class="fas fa-chevron-right"></i>
                    </a>
                </c:if>

                <span style="color:#6b7a99;font-size:0.85rem;margin-left:8px;">
                    Page ${currentPage + 1} of ${totalPages}
                </span>
            </div>
        </form:form>

        <!-- Export PDF -->
        <a href="/exportPDF" style="display:block;width:100%;padding:14px 24px;font-size:0.95rem;font-weight:700;letter-spacing:0.05em;text-transform:uppercase;background-color:#1d7a5f;border-radius:12px;color:#ffffff;text-decoration:none;text-align:center;margin-bottom:12px;box-shadow:0 5px 22px rgba(29,122,95,0.22);">
            <i class="fas fa-file-pdf"></i> Export PDF
        </a>

        <!-- Add New -->
        <button type="button" class="btn btn-primary btn-block">
            <a href="/addToDoItem">Add New Student</a>
        </button>
    </div>
</div>

<script th:inline="javascript">
    window.onload = function() {
        var msg = "${message}";
        if (msg == "Save Success") {
            toastr["success"]("Item added successfully!!")
        } else if (msg == "Delete Success") {
            toastr["success"]("Item deleted successfully!!")
        } else if (msg == "Delete Failure") {
            toastr["error"]("Some error occurred, couldn't delete item")
        } else if (msg == "Edit Success") {
            toastr["success"]("Item updated successfully!!")
        }
        toastr.options = {
            "closeButton": true, "progressBar": true,
            "positionClass": "toast-top-right", "timeOut": "5000"
        }
    }
</script>

</body>
</html>