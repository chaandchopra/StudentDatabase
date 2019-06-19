package com.mystudent.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;





public class StudentDbUtil {
	private DataSource dataSource;
	public StudentDbUtil(DataSource theDataScource){
		dataSource = theDataScource;
	}
	
	public List<Student> getStudents() throws Exception	{
		List<Student> students = new ArrayList<>();
		
		Connection myconn = null;
		Statement mystmt = null;
		ResultSet myrs = null;
		try{
			//get a connection
			myconn = dataSource.getConnection();
			//create sql statement
			String sql = "select * from student order by last_name";
			mystmt = myconn.createStatement();
			//execute query
			myrs = mystmt.executeQuery(sql);	
			//process result set
			while(myrs.next()){
				//retrieve data from result set row
				int id = myrs.getInt("id");
				String firstName = myrs.getString("first_name");
				String lastName = myrs.getString("last_name");
				String email = myrs.getString("email");
				
				//create new student object
				Student tempStudent = new Student(id, firstName, lastName, email);
				
				students.add(tempStudent);
				
			}
			//close jdbc objects
		}
		finally{
			//close JDBC objects
			close(myconn, mystmt, myrs);
		}
		
		
		
		return students;
	}

	private void close(Connection myconn, Statement mystmt, ResultSet myrs) {
		// TODO Auto-generated method stub
		try{
			if(myrs !=null){
				myrs.close();
			}
			if(myconn !=null){
				myconn.close();
			}
			if(mystmt !=null){
				mystmt.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void addStudent(Student theStudents) throws Exception{
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement mystmt = null;
		try
		{
			conn = dataSource.getConnection();
			String sql = "insert into student"
					+ "(first_name, last_name, email)"
					+"values(?,?,?)";
			mystmt = conn.prepareStatement(sql);
			
			mystmt.setString(1, theStudents.getFirstName());
			mystmt.setString(2, theStudents.getLastName());
			mystmt.setString(3, theStudents.getEmail());
			
			mystmt.execute();
		}
		finally
		{
			close(conn, mystmt, null);
		}
	}

	public Student getStudent(String studentid) throws Exception{
		Student theStudent = null;
		Connection myconn = null;
		PreparedStatement mystmt = null;
		ResultSet myrs = null;
		try{

			//convert student id to int
			int studentId = Integer.parseInt(studentid);
			
			//get connection to database
			myconn = dataSource.getConnection();
			
			//create sql to get selected student
			String  sql = "select * from student where id = ?";
			mystmt = myconn.prepareStatement(sql);
			
			//set params
			mystmt.setInt(1, studentId);
			
			//execute statement
			myrs = mystmt.executeQuery();

			
			//retrieve data rom result set row
			if(myrs.next())
			{
				String fname = myrs.getString("first_name");
				String lname = myrs.getString("last_name");
				String email = myrs.getString("email");
				theStudent = new Student(studentId, fname, lname, email);
			}
			else
			{
				throw new Exception("could not find student id ");
			}
			
			return theStudent;
		}
		finally{
			close( myconn, mystmt, myrs);
		}
	}

	public void updateStudent(Student theStudent) throws Exception{
		Connection myconn = null;
		PreparedStatement mystmt = null;
		try{
			myconn = dataSource.getConnection();
			String sql = "update student "
					+ "set first_name=?, last_name=?, email=? "
					+ "where id=?";
			mystmt = myconn.prepareStatement(sql);
			String fname = theStudent.getFirstName();
			String lname = theStudent.getLastName();
			String email = theStudent.getEmail();
			int id = theStudent.getId();
			mystmt.setString(1, fname);
			mystmt.setString(2, lname);
			mystmt.setString(3, email);
			mystmt.setInt(4,id);
			mystmt.execute();
		}finally{
			close(myconn, mystmt, null);
		}
		
	}

	public void deleteStudent(String id) throws Exception{
		Connection myconn = null;
		PreparedStatement mystmt = null;
		try{
			myconn = dataSource.getConnection();
			String sql = "delete from student "
					+ "where id=?";
			mystmt = myconn.prepareStatement(sql);
			mystmt.setString(1,id);
			mystmt.execute();
		}finally{
			close(myconn, mystmt, null);
		}		
		
	}

}
