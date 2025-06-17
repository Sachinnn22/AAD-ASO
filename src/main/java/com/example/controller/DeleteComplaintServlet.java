package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.model.ComplainModel;

import java.io.IOException;

@WebServlet("/DeleteComplaintServlet")
public class DeleteComplaintServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        String uname = req.getParameter("uname");
        String redirectTo = req.getParameter("redirect");

        ComplainModel model = new ComplainModel();
        boolean isDeleted = model.deleteComplaint(cid);

        if (isDeleted) {
            if ("admin".equals(redirectTo)) {
                resp.sendRedirect("adminShow.jsp");
            } else if (uname != null && !uname.isEmpty()) {
                resp.sendRedirect("userShow.jsp?uname=" + uname);
            } else {
                resp.sendRedirect("adminShow.jsp");
            }
        } else {
            req.setAttribute("error", "Failed to delete complaint.");
            req.getRequestDispatcher("userShow.jsp?uname=" + (uname != null ? uname : "")).forward(req, resp);
        }
    }
}
