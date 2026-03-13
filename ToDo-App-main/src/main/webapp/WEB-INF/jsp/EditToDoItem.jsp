<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Student Details</title>

    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap');

:root {
  --navy: #0d1f3c;
  --accent: #c8973a;
  --edit-primary: #5c2d91;
  --edit-mid: #7b3db5;
  --text-dark: #1a1a2e;
  --text-muted: #6b7a99;
  --success: #1d7a5f;
  --shadow: 0 8px 36px rgba(92,45,145,0.13);
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
  background-color: #c9b8e8;
  background-image: linear-gradient(135deg, #b8a8d8 0%, #c9b8e8 35%, #d8c8f0 65%, #e0d4f5 100%);
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
  max-width: 800px;
  background-color: #ffffff;
  background-image: linear-gradient(155deg, #ffffff 55%, #f5f0ff 85%, #ede4ff 100%);
  border-radius: 22px;
  box-shadow: var(--shadow);
  padding: 0 0 52px 0;
  border-top: 6px solid var(--edit-primary);
  position: relative;
  overflow: hidden;
}

.container::before {
  content: '';
  position: absolute;
  top: 0; right: 0;
  width: 320px; height: 320px;
  background: radial-gradient(circle at top right, rgba(123,61,181,0.10), transparent 65%);
  pointer-events: none;
}

.container::after {
  content: '';
  position: absolute;
  bottom: 0; left: 0;
  width: 220px; height: 220px;
  background: radial-gradient(circle at bottom left, rgba(200,151,58,0.08), transparent 65%);
  pointer-events: none;
}

.container h1 {
  font-family: 'Playfair Display', serif;
  font-size: 1.85rem;
  font-weight: 700;
  color: #ffffff;
  padding: 26px 36px !important;
  margin-bottom: 38px;
  background-color: #5c2d91;
  background-image: linear-gradient(100deg, #3d1a6e 0%, #5c2d91 45%, #7b3db5 100%);
  position: relative;
  z-index: 1;
}

.container h1::after {
  content: '';
  position: absolute;
  left: 36px; bottom: 0;
  width: 70px; height: 3px;
  background-color: var(--accent);
  border-radius: 2px;
}

.container h1::before {
  content: '✏ EDIT MODE';
  position: absolute;
  right: 36px; top: 50%;
  transform: translateY(-50%);
  background-color: rgba(200,151,58,0.22);
  color: #f0c97a;
  font-family: 'DM Sans', sans-serif;
  font-size: 0.68rem;
  font-weight: 700;
  letter-spacing: 0.12em;
  padding: 5px 12px;
  border-radius: 20px;
  border: 1px solid rgba(200,151,58,0.35);
}

form { background-color: transparent; padding: 0 36px; }
.row { background-color: transparent; margin-bottom: 22px; }

.form-group {
  background-color: #f9f5ff;
  background-image: linear-gradient(90deg, #f3eeff 0%, #f9f5ff 60%, #fdfaff 100%);
  border: 1.5px solid #dcc8f8;
  border-radius: 13px;
  padding: 20px 24px;
  display: flex;
  align-items: center;
  gap: 18px;
  transition: box-shadow 0.22s ease, border-color 0.22s ease;
}

.form-group:hover { border-color: #b899e8; box-shadow: 0 4px 18px rgba(92,45,145,0.09); }

.form-group:focus-within {
  border-color: var(--edit-primary);
  box-shadow: 0 0 0 3px rgba(92,45,145,0.13);
}

label {
  display: inline-block;
  background-color: #e8d8f8;
  background-image: linear-gradient(135deg, #ddc8f5 0%, #e8d8f8 50%, #eedff9 100%);
  color: var(--edit-primary);
  font-weight: 700;
  font-size: 0.86rem;
  letter-spacing: 0.05em;
  text-transform: uppercase;
  padding: 9px 18px;
  border-radius: 8px;
  border-left: 3px solid var(--edit-primary);
  min-width: 185px;
  text-align: left;
  white-space: nowrap;
  flex-shrink: 0;
}

.form-control {
  width: 100%;
  background-color: #ffffff;
  border: 1.5px solid #cbb8ec;
  border-radius: 9px;
  padding: 11px 16px;
  font-family: 'DM Sans', sans-serif;
  font-size: 0.95rem;
  color: var(--text-dark);
  transition: all 0.22s ease;
  outline: none;
}

.form-control:hover:not(:focus) { border-color: #a882e0; }

.form-control:focus {
  border-color: var(--edit-primary);
  box-shadow: 0 0 0 3px rgba(92,45,145,0.13);
}

input[type="date"]::-webkit-calendar-picker-indicator {
  filter: invert(18%) sepia(70%) saturate(500%) hue-rotate(255deg);
  cursor: pointer; opacity: 0.65;
}

#status {
  background-color: #f0f4f0;
  color: #1d7a5f;
  font-weight: 600;
  border-color: #a8d5c2;
}

.row.p-2 {
  background-color: #f0e8ff;
  background-image: linear-gradient(90deg, #e8d8f8 0%, #f0e8ff 50%, #f5f0ff 100%);
  border-radius: 13px;
  padding: 22px 24px !important;
  border: 1.5px solid #dcc8f8;
  margin-bottom: 0;
  display: flex;
  align-items: center;
}

.btn-success {
  background-color: #5c2d91;
  background-image: linear-gradient(135deg, #3d1a6e 0%, #5c2d91 50%, #7b3db5 100%);
  color: #ffffff;
  border: none;
  border-radius: 10px;
  padding: 13px 40px;
  font-family: 'DM Sans', sans-serif;
  font-weight: 700;
  font-size: 0.95rem;
  letter-spacing: 0.07em;
  text-transform: uppercase;
  cursor: pointer;
  box-shadow: 0 5px 20px rgba(92,45,145,0.32);
  transition: all 0.22s ease;
}

.btn-success:hover {
  background-color: #3d1a6e;
  box-shadow: 0 8px 28px rgba(92,45,145,0.42);
  transform: translateY(-2px);
}

::-webkit-scrollbar { width: 8px; }
::-webkit-scrollbar-track { background-color: #ede4ff; border-radius: 4px; }
::-webkit-scrollbar-thumb { background-color: #5c2d91; border-radius: 4px; }
::-webkit-scrollbar-thumb:hover { background-color: var(--accent); }

@media (max-width: 640px) {
  .container h1 { font-size: 1.3rem; padding: 20px !important; }
  .container h1::before { display: none; }
  form { padding: 0 16px; }
  .form-group { flex-direction: column; align-items: flex-start; padding: 16px; gap: 12px; }
  label { min-width: unset; width: 100%; }
  .btn-success { width: 100%; padding: 14px; }
}
</style>
</head>

<body>
    <div class="container">

        <h1 class="p-3">Edit Student Details</h1>

        <form:form action="/editSaveToDoItem" method="post" modelAttribute="todo">
            <form:input path="id" type="hidden"/>

            <!-- Student Name -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="title">Student Name</label>
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
                            class="form-control input-sm" />
                    </div>
                </div>
            </div>

            <!-- Gender -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="gender">Gender</label>
                    <div class="col-md-6">
                        <form:select path="gender" id="gender" class="form-control">
                            <form:option value="">-- Select Gender --</form:option>
                            <form:option value="Male">Male</form:option>
                            <form:option value="Female">Female</form:option>
                            <form:option value="Other">Other</form:option>
                        </form:select>
                    </div>
                </div>
            </div>

            <!-- Course / Department -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="course">Course / Dept</label>
                    <div class="col-md-6">
                        <form:select path="course" id="course" class="form-control">
                            <form:option value="">-- Select Course --</form:option>
                            <form:option value="B.E Computer Science">B.E Computer Science</form:option>
                            <form:option value="B.E Electronics">B.E Electronics</form:option>
                            <form:option value="B.Sc Mathematics">B.Sc Mathematics</form:option>
                            <form:option value="B.Com">B.Com</form:option>
                            <form:option value="B.A English">B.A English</form:option>
                            <form:option value="MBA">MBA</form:option>
                            <form:option value="MCA">MCA</form:option>
                        </form:select>
                    </div>
                </div>
            </div>

            <!-- Date of Birth -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="dob">Date of Birth</label>
                    <div class="col-md-6">
                        <form:input type="date" path="dob" id="dob"
                            class="form-control input-sm" />
                    </div>
                </div>
            </div>

            <!-- Address -->
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="address">Address</label>
                    <div class="col-md-6">
                        <form:textarea path="address" id="address"
                            class="form-control" rows="3"
                            placeholder="Enter full address..." />
                    </div>
                </div>
            </div>

            <!-- Save Button -->
            <div class="row p-2">
                <div class="col-md-2">
                    <button type="submit" class="btn btn-success">Update</button>
                </div>
            </div>

        </form:form>
    </div>

    <script th:inline="javascript">
        window.onload = function() {
            var msg = "${message}";
            if (msg == "Edit Failure") {
                toastr["error"]("Something went wrong with the edit.")
            }
            toastr.options = {
                "closeButton": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "timeOut": "5000"
            }
        }
    </script>
</body>
</html>