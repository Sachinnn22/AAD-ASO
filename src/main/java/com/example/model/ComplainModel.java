package com.example.model;

import com.example.dto.ComplainDto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ComplainModel {

    private final String url = "jdbc:mysql://localhost:3306/cms";
    private final String user = "root";
    private final String pass = "mysql";

    public boolean saveComplaint(String userName, String date, String description) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                String sql = "INSERT INTO complaint (uname, description, date, status) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                    stmt.setString(1, userName);
                    stmt.setString(2, description);
                    stmt.setString(3, date);
                    stmt.setString(4, "Pending");
                    return stmt.executeUpdate() > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<ComplainDto> getComplaintsByUser(String userName) {
        List<ComplainDto> complaints = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                String sql = "SELECT cid, uname, description, date, status FROM complaint WHERE uname = ?";
                try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                    stmt.setString(1, userName);
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            complaints.add(new ComplainDto(
                                    rs.getString("cid"),
                                    rs.getString("uname"),
                                    rs.getString("description"),
                                    rs.getString("date"),
                                    rs.getString("status")
                            ));
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return complaints;
    }

    public List<ComplainDto> getAllComplaints() {
        List<ComplainDto> complaints = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                String sql = "SELECT cid, uname, description, date, status FROM complaint";
                try (PreparedStatement stmt = connection.prepareStatement(sql);
                     ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        complaints.add(new ComplainDto(
                                rs.getString("cid"),
                                rs.getString("uname"),
                                rs.getString("description"),
                                rs.getString("date"),
                                rs.getString("status")
                        ));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return complaints;
    }

    public boolean deleteComplaint(String cid) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                String sql = "DELETE FROM complaint WHERE cid = ?";
                try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                    stmt.setString(1, cid);
                    return stmt.executeUpdate() > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ComplainDto getComplaintById(String cid) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                String sql = "SELECT cid, uname, description, date, status FROM complaint WHERE cid = ?";
                try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                    stmt.setString(1, cid);
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            return new ComplainDto(
                                    rs.getString("cid"),
                                    rs.getString("uname"),
                                    rs.getString("description"),
                                    rs.getString("date"),
                                    rs.getString("status")
                            );
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateComplaint(ComplainDto dto) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                String sql = "UPDATE complaint SET description = ?, date = ?, status = ? WHERE cid = ?";
                try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                    stmt.setString(1, dto.getDescription());
                    stmt.setString(2, dto.getDate());
                    stmt.setString(3, dto.getStatus());
                    stmt.setString(4, dto.getCid());
                    return stmt.executeUpdate() > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
