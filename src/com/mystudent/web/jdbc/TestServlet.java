package com.mystudent.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    @Resource(name = "jdbc/web_student_tracker")
    private DataSource dataSource;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//step 1: set up the print writer
		PrintWriter out =  response.getWriter();
		
		//step 2: get a connection to the database
		Connection myconn = null;
		Statement mystmt = null;
		ResultSet myrs = null; 
		
		try{
			
			myconn = dataSource.getConnection();

			//step3 : create a sql statement
			String sql = "select * from student";
			mystmt = myconn.createStatement();
			
			//step 4: execute sql query
			myrs = mystmt.executeQuery(sql);
			
			//step 5: process the result set
			while(myrs.next())
			{
				String email = myrs.getString("email");
				out.println(email);
			}
		}
		catch(Exception exe){
			out.print(exe);
			
		}
	}

}
