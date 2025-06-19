<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - CMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            margin: 0;
            background-color: #2c2c2c;
        }

        .login-container {
            background: #fff;
            padding: 40px 40px;
            border-radius: 12px;
            box-shadow:
                    0 8px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            transition: box-shadow 0.3s ease;
        }
        .login-container:hover {
            box-shadow:
                    0 12px 24px rgba(0, 0, 0, 0.15);
        }

        h3 {
            color: #0d6efd;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            letter-spacing: 1px;
        }

        label {
            color: #555;
            font-weight: 600;
        }

        .form-control {
            border-radius: 8px;
            border: 1.5px solid #ced4da;
            padding: 10px 14px;
            font-size: 1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 8px rgba(13, 110, 253, 0.25);
            outline: none;
            color: #212529;
            background-color: #fff;
        }

        .btn-primary {
            background-color: #0d6efd;
            border: none;
            font-weight: 700;
            padding: 12px 0;
            font-size: 1.1rem;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            letter-spacing: 0.8px;
        }

        .btn-primary:hover {
            background-color: #0b5ed7;
        }

        .alert-danger {
            background-color: #f8d7da;
            border: 1px solid #f5c2c7;
            color: #842029;
            border-radius: 8px;
            padding: 12px 16px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="login-container shadow-sm">
    <h3>User Login</h3>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <form action="userLoginServlet" method="post" novalidate>
        <div class="mb-4">
            <label for="username" class="form-label">Username</label>
            <input id="username" type="text" name="username" class="form-control" placeholder="Enter username" required/>
        </div>

        <div class="mb-5">
            <label for="password" class="form-label">Password</label>
            <input id="password" type="password" name="password" class="form-control" placeholder="Enter password" required/>
        </div>

        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
</div>

</body>
</html>
