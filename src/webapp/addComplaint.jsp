<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Complaint - CMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            background-color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow: hidden;
        }

        .navbar {
            background-color: black;
            border-bottom: 1px solid #dee2e6;
            padding: 0.3rem 1rem;
        }

        .navbar-brand {
            font-weight: 700;
            color: #fff !important;
            font-size: 1.25rem;
        }

        .btn-outline-primary {
            color: #fff;
            border-color: #ccc;
            font-weight: 600;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-outline-primary:hover {
            background-color: #e9ecef;
            color: #000;
            border: #ccc;
        }

        main.container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            min-height: calc(100vh - 60px);
        }

        .card {
            background-color: #ffffff;
            color: #000; /* Ensures all text inside is black */
            border-radius: 12px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            padding: 30px 40px;
            width: 100%;
            max-width: 600px;
        }

        .card-header {
            font-size: 1.5rem;
            font-weight: 700;
            color: #000;
            margin-bottom: 25px;
            text-align: center;
        }

        .card-body {
            color: #000;
        }

        label.form-label {
            font-weight: 600;
            color: #000;
        }

        input.form-control,
        textarea.form-control {
            border-radius: 8px;
            border: 1.5px solid #ced4da;
            padding: 12px 15px;
            font-size: 1rem;
            background-color: #fff;
            color: #000;
        }

        input.form-control:focus,
        textarea.form-control:focus {
            border-color: #999;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            outline: none;
            color: #000;
        }

        input[readonly] {
            background-color: #f5f5f5;
            cursor: not-allowed;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            font-weight: 600;
            padding: 12px 30px;
            font-size: 1rem;
            border-radius: 8px;
            transition: background-color 0.3s ease, color 0.3s ease;
            flex: 1;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
            border: none;
            font-weight: 600;
            padding: 12px 30px;
            font-size: 1rem;
            border-radius: 8px;
            transition: background-color 0.3s ease, color 0.3s ease;
            flex: 1;
        }

        .btn-success:hover {
            background-color: #218838;
            color: #fff;
        }

        .btn-group {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }

        .alert-info {
            background-color: #f1f1f1;
            color: #000;
            border: 1px solid #dcdcdc;
            border-radius: 8px;
            padding: 14px 20px;
            margin-top: 25px;
            font-weight: 600;
            text-align: center;
        }

        .row-two-inputs {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .row-two-inputs > div {
            flex: 1;
            min-width: 150px;
        }

        @media (max-width: 480px) {
            .card {
                padding: 25px 20px;
            }

            .btn-group {
                flex-direction: column;
            }

            .btn-group .btn {
                width: 100%;
            }

            .row-two-inputs {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg shadow-sm">
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand" href="#">Complaint Management System</a>
        <a href="userLogin.jsp" class="btn btn-outline-primary btn-sm">Logout</a>
    </div>
</nav>

<main class="container">
    <div class="card">
        <div class="card-header">Submit New Complaint</div>
        <div class="card-body">
            <%
                String loggedInUser = (String) session.getAttribute("username");
                if (loggedInUser == null) {
                    response.sendRedirect("userLogin.jsp");
                    return;
                }
            %>
            <form action="SubmitComplaintServlet" method="post" novalidate>
                <div class="row-two-inputs mb-4">
                    <div>
                        <label for="usernameInput" class="form-label">User Name</label>
                        <input type="text" name="username" id="usernameInput" class="form-control"
                               value="<%= loggedInUser %>" readonly />
                    </div>
                    <div>
                        <label for="dateInput" class="form-label">Date</label>
                        <input type="date" name="date" id="dateInput" class="form-control" required />
                    </div>
                </div>

                <div class="mb-4">
                    <label for="descriptionInput" class="form-label">Description</label>
                    <textarea name="description" id="descriptionInput" class="form-control" rows="5"
                              placeholder="Describe your complaint..." required></textarea>
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">Submit Complaint</button>
                    <button type="button" class="btn btn-success" onclick="viewMyComplaints()">View My Complaints</button>
                </div>
            </form>

            <% String message = (String) request.getAttribute("message");
                if (message != null) { %>
            <div class="alert alert-info mt-4"><%= message %></div>
            <% } %>
        </div>
    </div>
</main>

<script>
    function viewMyComplaints() {
        const username = document.getElementById("usernameInput").value;
        window.location.href = "userShow.jsp?uname=" + encodeURIComponent(username);
    }
</script>

</body>
</html>
