package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TodoDAO {

	private Connection conn;

	public TodoDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addTodo(String name , String task , String status) {
		boolean f = false;

		try {
		String sql = "INSERT INTO todo_storage(name , task , status) VALUES (? , ? ,?)";
		
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2, task);
			ps.setString(3, status);
			
			int psi = ps.executeUpdate();
			if(psi == 1) {
			  f = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}
	
}
