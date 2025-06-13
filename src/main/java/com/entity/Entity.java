package com.entity;

public class Entity {

	private int ID;
	private String Name;
	private String Task ;
	private String status;
	
	
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getTask() {
		return Task;
	}

	public void setTask(String task) {
		Task = task;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Entity [ID=" + ID + ", Name=" + Name + ", Task=" + Task + ", status=" + status + "]";
	}

	


}
