package com.example.model;

import java.sql.*;

public class LoginModel {
    public String checkLogin(String username, String password){
        String url = "jdbc:mysql://localhost:3306/cms";
        String user = "root";
        String pass = "mysql";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url,user,pass);
            String sql = "select * from user where uname=? and upassword=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return resultSet.getString("urole");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
