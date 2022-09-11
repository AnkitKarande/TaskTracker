package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.*;
// task class for storing task details
@Entity
@Table(name="Tasks")
public class Task {

	@Id
	private int TaskId;
	private String Title;
	@Column(length=1500)
	private String Content;
	private Date date;
	public int getTaskId() {
		return TaskId;
	}
	public void setTaskId(int taskId) {
		TaskId = taskId;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Task() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Task( String title, String content, Date date) {
		super();
		TaskId = new Random().nextInt(10000);
		Title = title;
		Content = content;
		this.date = date;
	}
	
	
}
