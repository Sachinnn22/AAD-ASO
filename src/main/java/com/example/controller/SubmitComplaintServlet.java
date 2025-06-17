package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.model.ComplainModel;

import java.io.IOException;

@WebServlet("/SubmitComplaintServlet")
public class SubmitComplaintServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String description = req.getParameter("description");
        String date = req.getParameter("date");

        System.out.println("uname: " + userName);

        ComplainModel model = new ComplainModel();

        boolean isSaved = model.saveComplaint(userName, date, description);

        if (isSaved) {
            resp.sendRedirect("userShow.jsp?uname=" + userName);
        } else {
            req.setAttribute("message", "Failed to submit complaint.");
            req.getRequestDispatcher("addComplaint.jsp").forward(req, resp);
        }
    }
}
