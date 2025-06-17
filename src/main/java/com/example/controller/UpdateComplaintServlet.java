package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.dto.ComplainDto;
import com.example.model.ComplainModel;

import java.io.IOException;

@WebServlet("/UpdateComplaintServlet")
public class UpdateComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        String uname = req.getParameter("uname");
        String description = req.getParameter("description");
        String date = req.getParameter("date");
        String status = req.getParameter("status");

        ComplainDto dto = new ComplainDto(cid, uname, description, date, status);

        ComplainModel model = new ComplainModel();
        boolean isUpdated = model.updateComplaint(dto);

        if (isUpdated) {
            resp.sendRedirect("adminShow.jsp?update=success");
        } else {
            resp.sendRedirect("adminShow.jsp?update=fail");
        }
    }
}
