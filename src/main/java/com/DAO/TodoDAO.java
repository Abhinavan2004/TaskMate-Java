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
    
    public boolean addTodo(String name, String task, String status) {
        boolean f = false;
        PreparedStatement ps = null;
        try {
            String sql = "INSERT INTO todo_storage(name, task, status) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, name);
            ps.setString(2, task);
            ps.setString(3, status);
            
            int psi = ps.executeUpdate();
            if (psi == 1) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return f;
    }
    
    public List<Entity> getTodo() {
        List<Entity> list = new ArrayList<Entity>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            String sql = "SELECT * FROM todo_storage";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Entity t = new Entity();
                t.setID(rs.getInt(1));
                t.setName(rs.getString(2));
                t.setTask(rs.getString(3));
                t.setStatus(rs.getString(4));
                
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return list;
    }
    
    public Entity gettoById(int id) {
        Entity entity = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            String sql = "SELECT * FROM todo_storage WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {  // Use if instead of while since we expect only one result
                entity = new Entity();
                entity.setID(rs.getInt("id"));
                entity.setName(rs.getString("name"));
                entity.setTask(rs.getString("task"));
                entity.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return entity;
    }
    
    public boolean updateTodo(Entity t) {
        boolean f = false;
        PreparedStatement ps = null;
        
        try {
            String sql = "UPDATE todo_storage SET name = ?, task = ?, status = ? WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setString(2, t.getTask());
            ps.setString(3, t.getStatus());
            ps.setInt(4, t.getID());
            
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return f;
    }
    
    public boolean deletetask(int id) {
    	boolean f = false ;
    	try {
    		String sql = "delete from todo_storage where id= ?";
    		PreparedStatement ps = conn.prepareStatement(sql);
    		ps.setInt(1, id);
    		
    		int i = ps.executeUpdate();
    		
    		if(i == 1) {
    			f = true;
    		}
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
        return f ;

    }
}