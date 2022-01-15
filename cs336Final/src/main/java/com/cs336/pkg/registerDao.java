package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class registerDao {
	
	
	private String dbUrl = "jdbc:mysql://localhost:3306/airlinewebsite";
	private String dbUsername = "root";
	private String dbPassword = "Isa5927@";
	private String dbDriver = "com.mysql.jdbc.Driver";
	

	public void loadDriver(String dbDriver) {
		try {
		Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public String insert(newCustomer newCustomer) {
		
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Your credentials were successfully entered";
		
		String sql = "insert into user(f_name, l_name, u_user, u_pass, cid) values(?,?,?,?,?)";
		
		PreparedStatement preparedStatement;
		
		try {
		preparedStatement = con.prepareStatement(sql);
		
		preparedStatement.setString(1, newCustomer.getFirstName());
		preparedStatement.setString(2, newCustomer.getLastName());
		preparedStatement.setString(3, newCustomer.getUsername());
		preparedStatement.setString(4, newCustomer.getPassword());
		preparedStatement.setInt(5, ((int)(Math.random() * 1000000000)));
		preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Your data was not entered";
		}
		return result;
	}
	
	public void closeConnection(Connection con){
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		registerDao registerDao = new registerDao();
		Connection connection = registerDao.getConnection();
		
		System.out.println(connection);		
		registerDao.closeConnection(connection);
	}


}