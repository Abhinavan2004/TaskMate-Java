package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.entity.Entity;

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
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<Entity> getTodo(){
		List<Entity> list = new ArrayList<Entity>();
		Entity t = null ;
		
		try {
			String sql = "select * from todo_storage" ;
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				t = new Entity();
				t.setID(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setTask(rs.getString(3));
				t.setStatus(rs.getString(4));
				
				list.add(t);
			}

		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
}
