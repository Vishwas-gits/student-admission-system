<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Student Registration</title>
    
    <style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap');

:root {
  --navy: #0d1f3c;
  --navy-mid: #1a3260;
  --accent: #c8973a;
  --accent-light: #f0c97a;
  --white: #ffffff;
  --text-dark: #0d1f3c;
  --text-muted: #6b7a99;
  --success: #1d7a5f;
  --border: #d8dff0;
  --input-bg: #f4f7ff;
  --label-bg: #eef1fb;
  --shadow: 0 6px 32px rgba(13, 31, 60, 0.13);
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
  background-color: #b8c7e8;
  background-image: linear-gradient(135deg, #a8bade 0%, #c2d0ee 40%, #d4e0f5 100%);
  font-family: 'DM Sans', sans-serif;
  color: var(--text-dark);
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px 20px;
}

.container {
  width: 100%;
  max-width: 780px;
  background-color: #ffffff;
  background-image: linear-gradient(160deg, #ffffff 60%, #f0f4ff 100%);
  border-radius: 20px;
  box-shadow: var(--shadow);
  padding: 0 0 48px 0;
  border-top: 6px solid var(--accent);
  position: relative;
  overflow: hidden;
}

.container::before {
  content: '';
  position: absolute;
  top: 0; right: 0;
  width: 280px; height: 280px;
  background: radial-gradient(circle at top right, rgba(200,151,58,0.10), transparent 65%);
  pointer-events: none;
}

.container::after {
  content: '';
  position: absolute;
  bottom: 0; left: 0;
  width: 200px; height: 200px;
  background: radial-gradient(circle at bottom left, rgba(26,50,96,0.07), transparent 65%);
  pointer-events: none;
}

.container h1 {
  font-family: 'Playfair Display', serif;
  font-size: 1.85rem;
  font-weight: 700;
  color: #ffffff;
  letter-spacing: -0.3px;
  padding: 26px 36px !important;
  margin-bottom: 36px;
  background-color: #0d1f3c;
  background-image: linear-gradient(100deg, #0d1f3c 0%, #1a3260 60%, #0f2a50 100%);
  position: relative;
  z-index: 1;
}

.container h1::after {
  content: '';
  position: absolute;
  left: 36px; bottom: 0;
  width: 60px; height: 3px;
  background-color: var(--accent);
  border-radius: 2px;
}

form { background-color: transparent; padding: 0 36px; }

.row { background-color: transparent; margin-bottom: 24px; }

.form-group {
  background-color: #f8faff;
  background-image: linear-gradient(90deg, #f4f7ff, #f8faff);
  border: 1px solid #dde4f5;
  border-radius: 12px;
  padding: 20px 24px;
  display: flex;
  align-items: center;
  gap: 16px;
  transition: box-shadow 0.2s ease, border-color 0.2s ease;
}

.form-group:hover { border-color: #b0bde8; box-shadow: 0 3px 14px rgba(13,31,60,0.07); }

.form-group:focus-within {
  border-color: var(--accent);
  background-color: #fffdf6;
  box-shadow: 0 0 0 3px rgba(200,151,58,0.12);
}

label {
  display: inline-block;
  background-color: #e8edf8;
  background-image: linear-gradient(135deg, #dce3f5 0%, #eaeffb 100%);
  color: var(--navy);
  font-weight: 600;
  font-size: 0.88rem;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  padding: 8px 16px;
  border-radius: 7px;
  border-left: 3px solid var(--accent);
  min-width: 180px;
  text-align: left;
  white-space: nowrap;
  flex-shrink: 0;
}

.form-control {
  width: 100%;
  background-color: #ffffff;
  border: 1.5px solid #c8d4f0;
  border-radius: 8px;
  padding: 11px 16px;
  font-family: 'DM Sans', sans-serif;
  font-size: 0.94rem;
  color: var(--text-dark);
  transition: all 0.22s ease;
  outline: none;
}

.form-control:focus {
  border-color: var(--accent);
  box-shadow: 0 0 0 3px rgba(200,151,58,0.14);
}

.form-control:hover:not(:focus) { border-color: #a0b0d8; }

input[type="date"]::-webkit-calendar-picker-indicator {
  filter: invert(25%) sepia(60%) saturate(400%) hue-rotate(200deg);
  cursor: pointer; opacity: 0.7;
}

#status {
  background-color: #f0f4f0;
  color: #1d7a5f;
  font-weight: 600;
  border-color: #a8d5c2;
  cursor: default;
}

.row.p-2 {
  background-color: #f0f4ff;
  border-radius: 12px;
  padding: 20px 24px !important;
  border: 1px solid #dde4f5;
  margin-bottom: 0;
  display: flex;
  align-items: center;
}

.btn-success {
  background-color: #1d7a5f;
  background-image: linear-gradient(135deg, #1d7a5f 0%, #24916f 60%, #1a6e55 100%);
  color: #ffffff;
  border: none;
  border-radius: 9px;
  padding: 12px 36px;
  font-family: 'DM Sans', sans-serif;
  font-weight: 700;
  font-size: 0.95rem;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  cursor: pointer;
  box-shadow: 0 4px 16px rgba(29,122,95,0.28);
  transition: all 0.22s ease;
}

.btn-success:hover {
  background-color: #155c48;
  box-shadow: 0 7px 24px rgba(29,122,95,0.38);
  transform: translateY(-2px);
}

::-webkit-scrollbar { width: 8px; }
::-webkit-scrollbar-track { background-color: #e8edf8; border-radius: 4px; }
::-webkit-scrollbar-thumb { background-color: #1a3260; border-radius: 4px; }
::-webkit-scrollbar-thumb:hover { background-color: #c8973a; }

@media (max-width: 640px) {
  .container h1 { font-size: 1.35rem; padding: 20px !important; }
  form { padding: 0 16px; }
  .form-group { flex-direction: column; align-items: flex-start; padding: 16px; }
  label { min-width: unset; width: 100%; }
  .btn-success { width: 100%; padding: 13px; }
}
    </style>
</head>

<body>
    <div class="container">

        <h1 class="p-3">New Student Registration</h1>

        <form:form action="/saveToDoItem" method="post" modelAttribute="todo">

            <!-- Name -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="title">Name of Student</label>
                    <div class="col-md-6">
                        <form:input type="text" path="title" id="title"
                            class="form-control input-sm" required="required" />
                    </div>
                </div>
            </div>

            <!-- Joining Date -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="date">Joining Date</label>
                    <div class="col-md-6">
                        <form:input type="date" path="date" id="date"
                            class="form-control input-sm" required="required" />
                    </div>
                </div>
            </div>

            <!-- Admission Status -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="status">Admission Status</label>
                    <div class="col-md-6">
                        <form:input type="text" path="status" id="status"
                            class="form-control input-sm" value="Incomplete" />
                    </div>
                </div>
            </div>

            <!-- Gender -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="gender">Gender</label>
                    <div class="col-md-6">
                        <select name="gender" id="gender" class="form-control">
                            <option value="">-- Select Gender --</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Course / Department -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="course">Course / Dept</label>
                    <div class="col-md-6">
                        <select name="course" id="course" class="form-control">
                            <option value="">-- Select Course --</option>
                            <option value="B.E Computer Science">B.E Computer Science</option>
                            <option value="B.E Electronics">B.E Electronics</option>
                            <option value="B.Sc Mathematics">B.Sc Mathematics</option>
                            <option value="B.Com">B.Com</option>
                            <option value="B.A English">B.A English</option>
                            <option value="MBA">MBA</option>
                            <option value="MCA">MCA</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Date of Birth -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="dob">Date of Birth</label>
                    <div class="col-md-6">
                        <input type="date" name="dob" id="dob"
                            class="form-control input-sm" />
                    </div>
                </div>
            </div>

            <!-- Address -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="address">Address</label>
                    <div class="col-md-6">
                        <textarea name="address" id="address"
                            class="form-control" rows="3"
                            placeholder="Enter full address..."></textarea>
                    </div>
                </div>
            </div>

            <!-- Save Button -->
            <div class="row p-2">
                <div class="col-md-2">
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </div>

        </form:form>
    </div>
</body>
</html>