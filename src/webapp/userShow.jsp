<%@ page import="com.example.model.ComplainModel" %>
<%@ page import="com.example.dto.ComplainDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Complaints</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background-color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
        }

        .container {
            margin-top: 2rem;
        }

        .table-container,
        .table-container table,
        .table-container th,
        .table-container td {
            color: black;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .header-section h3 {
            font-weight: 600;
            color: #007bff;
        }

        .btn-secondary {
            background-color: #007bff;
            border: none;
            color: white;
            font-weight: 600;
            padding: 6px 18px;
            border-radius: 30px;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #0056b3;
        }

        .table-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background-color: #007bff;
            color: white;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .badge {
            font-weight: 600;
            padding: 6px 12px;
            border-radius: 20px;
        }

        .badge-info {
            background-color: #17a2b8;
            color: white;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            padding: 6px 16px;
            font-size: 0.85rem;
            border-radius: 30px;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #c82333;
            color: white;
        }

        @media (max-width: 768px) {
            .header-section {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }

            thead {
                display: none;
            }

            tbody td {
                display: block;
                text-align: left;
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            tbody td::before {
                content: attr(data-label);
                font-weight: 600;
                color: #007bff;
                display: inline-block;
                width: 120px;
            }

            tbody td:last-child {
                border-bottom: none;
            }
        }
    </style>
</head>
<body>


<div class="container">
    <div class="header-section">
        <h3>My Complaints</h3>
        <a href="addComplaint.jsp" class="btn btn-secondary btn-sm">Back to Dashboard</a>
    </div>

    <div class="table-container">
        <%
            String uname = request.getParameter("uname");
            ComplainModel model = new ComplainModel();
            List<ComplainDto> complaints = model.getComplaintsByUser(uname);
        %>

        <table>
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
            <% for (ComplainDto c : complaints) { %>
            <tr>
                <td data-label="User Name"><%= c.getUname() %></td>
                <td data-label="Description"><%= c.getDescription() %></td>
                <td data-label="Date"><%= c.getDate() %></td>
                <td data-label="Status">
                    <span class="badge badge-info"><%= c.getStatus() %></span>
                </td>
                <td data-label="Action">
                    <a href="DeleteComplaintServlet?cid=<%= c.getCid() %>&uname=<%= uname %>"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure you want to delete this complaint?');">
                        Delete
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
