<%@ page import="com.example.model.ComplainModel" %>
<%@ page import="com.example.dto.ComplainDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Complaint Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background-color: #212529;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
        }

        .navbar {
            background-color: #000 !important;
            border-bottom: 1px solid #dee2e6;
        }

        .navbar-brand {
            font-weight: bold;
            color: #fff !important;
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

        .container {
            margin-top: 2rem;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .header-section h3 {
            font-weight: 600;
            color: #0dcaf0;
        }

        .table-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            color: #000;
        }

        .custom-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        .custom-table thead {
            background-color: #00bcd4;
            color: white;
        }

        .custom-table th, .custom-table td {
            padding: 14px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 0.95rem;
        }

        .badge-status {
            padding: 6px 12px;
            border-radius: 15px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        .status-pending {
            background-color: #17a2b8;
            color: white;
        }

        .status-progress {
            background-color: #ffc107;
            color: black;
        }

        .status-resolved {
            background-color: #28a745;
            color: white;
        }

        .btn-edit {
            background-color: #ffc107;
            border: none;
            color: black;
            font-weight: 600;
            border-radius: 20px;
            padding: 4px 14px;
            font-size: 0.85rem;
        }

        .btn-delete {
            background-color: #dc3545;
            border: none;
            color: white;
            font-weight: 600;
            border-radius: 20px;
            padding: 4px 14px;
            font-size: 0.85rem;
            margin-left: 5px;
        }

        .btn-edit:hover {
            background-color: #e0a800;
        }

        .btn-delete:hover {
            background-color: #b02a37;
        }

        .card {
            background-color: #f8f9fa;
            color: #000;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 2rem;
        }

        label {
            font-weight: 600;
        }

        input.form-control, textarea.form-control, select.form-control {
            border-radius: 8px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark">
    <div class="container-fluid px-4">
        <a class="navbar-brand" href="#">Admin Dashboard</a>
        <a href="userLogin.jsp" class="btn btn-outline-primary btn-sm">Logout</a>
    </div>
</nav>

<div class="container">
    <div class="header-section">
        <h3>Manage Complaints</h3>
    </div>

    <%
        String updateStatus = request.getParameter("update");
        String deleteStatus = request.getParameter("delete");

        if ("success".equals(updateStatus)) {
    %>
    <div class="alert alert-success">Complaint updated successfully!</div>
    <% } else if ("fail".equals(updateStatus)) { %>
    <div class="alert alert-danger">Failed to update complaint.</div>
    <% } %>

    <% if ("success".equals(deleteStatus)) { %>
    <div class="alert alert-success">Complaint deleted successfully!</div>
    <% } else if ("fail".equals(deleteStatus)) { %>
    <div class="alert alert-danger">Failed to delete complaint.</div>
    <% } %>

    <%
        ComplainModel model = new ComplainModel();
        List<ComplainDto> complaints = model.getAllComplaints();
        String editingCid = request.getParameter("edit");
        ComplainDto editingComplaint = null;
        if (editingCid != null) {
            editingComplaint = model.getComplaintById(editingCid);
        }
    %>

    <% if (editingComplaint != null) { %>
    <div class="card">
        <h5>Edit Complaint</h5>
        <form action="UpdateComplaintServlet" method="post">
            <input type="hidden" name="cid" value="<%= editingComplaint.getCid() %>">

            <div class="mb-3">
                <label>User Name</label>
                <input type="text" name="uname" class="form-control" value="<%= editingComplaint.getUname() %>" readonly>
            </div>

            <div class="mb-3">
                <label>Date</label>
                <input type="date" name="date" class="form-control" value="<%= editingComplaint.getDate() %>" readonly>
            </div>

            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control" required><%= editingComplaint.getDescription() %></textarea>
            </div>


            <div class="mb-3">
                <label>Status</label>
                <select name="status" class="form-control" required>
                    <option <%= "Pending".equals(editingComplaint.getStatus()) ? "selected" : "" %>>Pending</option>
                    <option <%= "In Progress".equals(editingComplaint.getStatus()) ? "selected" : "" %>>In Progress</option>
                    <option <%= "Resolved".equals(editingComplaint.getStatus()) ? "selected" : "" %>>Resolved</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
            <a href="adminShow.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
    <% } %>

    <% if (editingComplaint == null) { %>
    <div class="table-container">
        <table class="custom-table">
            <thead>
            <tr>
                <th>User Name</th>
                <th>Description</th>
                <th>Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (ComplainDto c : complaints) {
                String statusClass = "status-pending";
                if ("In Progress".equalsIgnoreCase(c.getStatus())) {
                    statusClass = "status-progress";
                } else if ("Resolved".equalsIgnoreCase(c.getStatus())) {
                    statusClass = "status-resolved";
                }
            %>
            <tr>
                <td><%= c.getUname() %></td>
                <td><%= c.getDescription() %></td>
                <td><%= c.getDate() %></td>
                <td><span class="badge-status <%= statusClass %>"><%= c.getStatus() %></span></td>
                <td>
                    <a href="adminShow.jsp?edit=<%= c.getCid() %>" class="btn btn-edit">Edit</a>
                    <a href="DeleteComplaintServlet?cid=<%= c.getCid() %>&redirect=admin"
                       onclick="return confirm('Are you sure you want to delete this complaint?');"
                       class="btn btn-delete">Delete</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } %>

</div>

</body>
</html>
